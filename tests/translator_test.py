import pytest
import os
import sys
from src.internals.translator import Translator

VMC_LINUX = os.path.relpath('vmc65-linux')
VMC_MAC = os.path.relpath('vmc-macos')
VMC_WINDOWS = os.path.relpath('vmc-win7.exe')

class TestTranslator:
    @pytest.fixture
    def vendingnew(self, tmp_path):
        import src.internals.analyser as analyser
        from src.internals.disambiguator import Disambiguator
        with open(os.path.join('tests','dot', 'vendingnew.dot'), 'r') as fts_source:
            fts = analyser.load_dot(fts_source)
        fts_source.close()
        analyser.z3_analyse_full(fts)
        dis = Disambiguator.from_file(os.path.join('tests', 'dot', 'vendingnew.dot'))
        dis.remove_transitions(fts._set_dead)
        dis.set_true_list(fts._set_false_optional)
        dis.solve_hidden_deadlocks(fts._set_hidden_deadlock)
        with open(os.path.join(tmp_path, "fixed-vendingnew.dot"), 'w') as out:
            out.write(dis.get_graph())
        return os.path.join(tmp_path, 'fixed-vendingnew.dot')

    @pytest.fixture
    def true(self, tmp_path):
        with open(os.path.join(tmp_path, "true.txt"), 'w') as true:
            true.write("[true] true")
        return os.path.join(tmp_path, "true.txt")

    @pytest.fixture
    def fixed_dot(self, tmp_path):
        import src.internals.analyser as analyser
        from src.internals.disambiguator import Disambiguator
        dots = []
        dot = os.listdir(os.path.join('tests','dot'))
        for source in dot:
            with open(os.path.join('tests','dot', source), 'r') as fts_source:
                fts = analyser.load_dot(fts_source)
            fts_source.close()
            analyser.z3_analyse_full(fts)
            dis = Disambiguator.from_file(os.path.join('tests', 'dot', source))
            dis.remove_transitions(fts._set_dead)
            dis.set_true_list(fts._set_false_optional)
            dis.solve_hidden_deadlocks(fts._set_hidden_deadlock)
            dots.append(os.path.join(tmp_path, "fixed-"+source))
            with open(os.path.join(tmp_path, "fixed-"+source), 'w') as out:
                out.write(dis.get_graph())
        return dots

    def test_translation(self, tmp_path, fixed_dot, true):
        from src.internals.vmc_controller import VmcController
        for source in fixed_dot:
            t = Translator()
            t.load_model(source)
            t.translate()
            path, dot = os.path.split(source)
            path = os.path.join(path, 'vmc-'+dot)
            print (t.get_output())
            with open(path, 'w') as out:
                out.write(t.get_output())
            if sys.platform.startswith('linux'):
                vmc = VmcController(VMC_LINUX)
            elif sys.platform.startswith('win'):
                vmc = VmcController(VMC_WINDOWS)
            elif sys.platform.startswith('cygwin'):
                vmc = VmcController(VMC_WINDOWS)
            elif sys.platform.startswith('darwin'):
                vmc = VmcController(VMC_MAC)
            vmc.run_vmc(path, true)
            assert vmc.get_eval() == "TRUE"

    def test_translation_pml(self, tmp_path, fixed_dot, true):
        for source in fixed_dot:
            t = Translator()
            t.load_model(source)
            pml = t.translate_to_pml()
            pos = pml.find("init{")
            init = pml[pos:]
            st_map = dict()
            l_state = ""
            r_state = ""
            for line in init.splitlines():
                line = line.strip()
                if len(line) == 0:
                    pass
                elif line == 'od;':
                    break
                elif(line[0:16] == "/*FINAL STATES*/"):
                        break
                elif(line[0:2] == '/*'):#Extracting states in .dot model
                    
                    left, right = line.split('->')

                    l_state = ''.join(i for i in left if (i.isdigit() or i.isalpha()))

                    r_state = right.rsplit("[")[0].strip()

                elif(line[0:2] == '::'):#Extracting states in .pml model
                    left, right = line.split('->')
                    left = left.rsplit("==")[1].strip()
                    right = ''.join(i for i in right.rsplit("state =")[1] if i.isdigit()).strip()

                    if not l_state in st_map:
                        st_map[l_state] = left
                    else:
                        assert st_map[l_state] == left

                    if not r_state in st_map:
                        st_map[r_state] = right
                    else:
                        assert st_map[r_state] == right
                    l_state = ""
                    r_state = ""
            f_states = init.split("/*FINAL STATES*/")
            if len(f_states) > 1:
                for line in f_states[1].splitlines():
                    line = line.strip()
                    if len(line) == 0:
                        pass
                    elif line == 'od;':
                        break
                    elif(line[0:2] == '::'):
                        line = line.strip()
                        left, right = line.split('->')

                        l_state = ''.join(i for i in left if (i.isdigit() or i.isalpha()))

                        r_state = right.rsplit("[")[0].strip()
                        if l_state in st_map:
                            assert st_map[l_state] == left
                        #if l_state not in st_map then it is an unreachable state.
                        if r_state in st_map:
                            assert st_map[r_state] == right
                        #if r_state not in st_map then it is an unreachable state.
