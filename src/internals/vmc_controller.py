import os
import re
import subprocess

separator = '-------------------------------------------\nThe formula:' 

class VmcController:
    __slots__ = ['vmc_path','output','explanation','counterexample']

    def __init__(self,vmc_path):
        if(not os.path.isfile(vmc_path)):
            raise ValueError('Invalid vmc_path')
        else:
            self.vmc_path = vmc_path
            self.output = ''
            self.explanation = ''
            self.counterexample = ''

    def _is_true(self):
        idx = self.output.find('is: TRUE')
        return not (idx == -1)

    def run_vmc(self, model, properties):
        if(not os.path.isfile(model)):
            raise ValueError('Invalid model file')
        if(not os.path.isfile(properties)):
            raise ValueError('Invalid properties file')
        self.output = subprocess.check_output(self.vmc_path + ' ' + model + ' ' + properties + ' +z', shell=True)
        decoded = self.output.decode("utf-8")
        if separator in decoded:
            self.output, self.explanation = decoded.split(separator,1) 
            self.explanation = separator +'\n' + self.explanation 
            if(self._is_true()):
                self.explanation = 'Nothing to show: the formula is TRUE'
        else:
            self.output = decoded

    def get_output(self):
        if(self.output == ''):
            return 'Nothing to show.'
        return self.output

    def get_explanation(self):
        print('exp=')
        print(self.explanation)
        if(self.explanation == ''):
            return 'Nothing to show.'
        return self.explanation