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
    ::state==0 -> action = insertSoup_Euro__action;state = 1;
    ::state==0 -> action = insertSoup_Dollar__action;state = 1;
    ::state==1 -> action = cancelSoup_action;state = 0;
    ::state==1 -> action = tomato_action;state = 2;
    ::state==1 -> action = chicken_action;state = 4;
    ::state==1 -> action = pea_action;state = 6;
    ::state==2 -> action = no_cup_action;state = 3;
    ::state==2 -> action = cup_present_action;state = 8;
    ::state==2 -> action = skip_action;state = 8;
    ::state==3 -> action = place_cup_action;state = 2;
    ::state==8 -> action = pour_tomato_action;state = 11;
    ::state==9 -> action = pour_chicken_action;state = 11;
    ::state==10 -> action = pour_pea_action;state = 11;
    ::state==11 -> action = ring_action;state = 12;
    ::state==12 -> action = take_soup_action;state = 0;
    ::state==12 -> action = bad_luck_action;state = 0;
od;
};
