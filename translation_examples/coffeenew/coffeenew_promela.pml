mtype = {no_action, insertBev_Euro__action, insertBev_Dollar__action, cancelBev_action, sugar_action, no_sugar_action, coffee_action, tea_action, cappuccino_action, pour_sugar_action, pour_milk_action, pour_coffee_action, pour_tea_action, ring_action, skip_action, take_cup_action};

mtype action

int state

#define INSERTBEV_EURO__ACTION (action == insertBev_Euro__action)
#define INSERTBEV_DOLLAR__ACTION (action == insertBev_Dollar__action)
#define CANCELBEV_ACTION (action == cancelBev_action)
#define SUGAR_ACTION (action == sugar_action)
#define NO_SUGAR_ACTION (action == no_sugar_action)
#define COFFEE_ACTION (action == coffee_action)
#define TEA_ACTION (action == tea_action)
#define CAPPUCCINO_ACTION (action == cappuccino_action)
#define POUR_SUGAR_ACTION (action == pour_sugar_action)
#define POUR_MILK_ACTION (action == pour_milk_action)
#define POUR_COFFEE_ACTION (action == pour_coffee_action)
#define POUR_TEA_ACTION (action == pour_tea_action)
#define RING_ACTION (action == ring_action)
#define SKIP_ACTION (action == skip_action)
#define TAKE_CUP_ACTION (action == take_cup_action)

init{
    action=no_action;
    state=0;
    do
    ::state==0 -> action = insertBev_Euro__action;state = 1;
    ::state==0 -> action = insertBev_Dollar__action;state = 1;
    ::state==1 -> action = cancelBev_action;state = 0;
    ::state==1 -> action = sugar_action;state = 2;
    ::state==1 -> action = no_sugar_action;state = 3;
    ::state==2 -> action = coffee_action;state = 6;
    ::state==2 -> action = tea_action;state = 5;
    ::state==2 -> action = cappuccino_action;state = 4;
    ::state==3 -> action = cappuccino_action;state = 9;
    ::state==3 -> action = tea_action;state = 8;
    ::state==3 -> action = coffee_action;state = 7;
    ::state==6 -> action = pour_sugar_action;state = 7;
    ::state==5 -> action = pour_sugar_action;state = 8;
    ::state==4 -> action = pour_sugar_action;state = 9;
    ::state==9 -> action = pour_milk_action;state = 11;
    ::state==9 -> action = pour_coffee_action;state = 10;
    ::state==8 -> action = pour_tea_action;state = 12;
    ::state==7 -> action = pour_coffee_action;state = 12;
    ::state==11 -> action = pour_coffee_action;state = 12;
    ::state==10 -> action = pour_milk_action;state = 12;
    ::state==12 -> action = ring_action;state = 13;
    ::state==12 -> action = skip_action;state = 13;
    ::state==13 -> action = take_cup_action;state = 0;
od;
};
