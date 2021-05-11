mtype = {no_action, insertSoup_Euro__action, insertSoup_Dollar__action, cancelSoup_action, tomato_action, chicken_action, pea_action, no_cup_action, cup_present_action, skip_action, place_cup_action, pour_tomato_action, pour_chicken_action, pour_pea_action, ring_action, take_soup_action, bad_luck_action};

mtype action

int state

#define INSERTSOUP_EURO__ACTION (action == insertSoup_Euro__action)
#define INSERTSOUP_DOLLAR__ACTION (action == insertSoup_Dollar__action)
#define CANCELSOUP_ACTION (action == cancelSoup_action)
#define TOMATO_ACTION (action == tomato_action)
#define CHICKEN_ACTION (action == chicken_action)
#define PEA_ACTION (action == pea_action)
#define NO_CUP_ACTION (action == no_cup_action)
#define CUP_PRESENT_ACTION (action == cup_present_action)
#define SKIP_ACTION (action == skip_action)
#define PLACE_CUP_ACTION (action == place_cup_action)
#define POUR_TOMATO_ACTION (action == pour_tomato_action)
#define POUR_CHICKEN_ACTION (action == pour_chicken_action)
#define POUR_PEA_ACTION (action == pour_pea_action)
#define RING_ACTION (action == ring_action)
#define TAKE_SOUP_ACTION (action == take_soup_action)
#define BAD_LUCK_ACTION (action == bad_luck_action)

init{
    action=no_action;
    state=0;
    do
    /*0 -> 1[insertSoup(Euro)]*/
    ::state==0 -> action = insertSoup_Euro__action;state = 1;
    /*0 -> 1[insertSoup(Dollar)]*/
    ::state==0 -> action = insertSoup_Dollar__action;state = 1;
    /*1 -> 0[cancelSoup]*/
    ::state==1 -> action = cancelSoup_action;state = 0;
    /*1 -> 2[tomato]*/
    ::state==1 -> action = tomato_action;state = 2;
    /*1 -> 4[chicken]*/
    ::state==1 -> action = chicken_action;state = 3;
    /*1 -> 6[pea]*/
    ::state==1 -> action = pea_action;state = 4;
    /*2 -> 3[no_cup]*/
    ::state==2 -> action = no_cup_action;state = 5;
    /*2 -> 8[cup_present]*/
    ::state==2 -> action = cup_present_action;state = 6;
    /*2 -> 8[skip]*/
    ::state==2 -> action = skip_action;state = 6;
    /*3 -> 2[place_cup]*/
    ::state==5 -> action = place_cup_action;state = 2;
    /*3 -> 0[cancelSoup]*/
    ::state==5 -> action = cancelSoup_action;state = 0;
    /*4 -> 5[no_cup]*/
    ::state==3 -> action = no_cup_action;state = 7;
    /*4 -> 9[cup_present]*/
    ::state==3 -> action = cup_present_action;state = 8;
    /*4 -> 9[skip]*/
    ::state==3 -> action = skip_action;state = 8;
    /*5 -> 4[place_cup]*/
    ::state==7 -> action = place_cup_action;state = 3;
    /*5 -> 0[cancelSoup]*/
    ::state==7 -> action = cancelSoup_action;state = 0;
    /*6 -> 7[no_cup]*/
    ::state==4 -> action = no_cup_action;state = 9;
    /*6 -> 10[cup_present]*/
    ::state==4 -> action = cup_present_action;state = 10;
    /*6 -> 10[skip]*/
    ::state==4 -> action = skip_action;state = 10;
    /*7 -> 6[place_cup]*/
    ::state==9 -> action = place_cup_action;state = 4;
    /*7 -> 0[cancelSoup]*/
    ::state==9 -> action = cancelSoup_action;state = 0;
    /*8 -> 11[pour_tomato]*/
    ::state==6 -> action = pour_tomato_action;state = 11;
    /*9 -> 11[pour_chicken]*/
    ::state==8 -> action = pour_chicken_action;state = 11;
    /*10 -> 11[pour_pea]*/
    ::state==10 -> action = pour_pea_action;state = 11;
    /*11 -> 12[skip]*/
    ::state==11 -> action = skip_action;state = 12;
    /*11 -> 12[ring]*/
    ::state==11 -> action = ring_action;state = 12;
    /*12 -> 0[take_soup]*/
    ::state==12 -> action = take_soup_action;state = 0;
    /*12 -> 0[bad_luck]*/
    ::state==12 -> action = bad_luck_action;state = 0;
od;
};
