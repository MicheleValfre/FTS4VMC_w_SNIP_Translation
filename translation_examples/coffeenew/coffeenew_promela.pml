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
    /*0 -> 1[insertBev(Euro)]*/
    ::state==0 -> action = insertBev_Euro__action;state = 1;
    /*0 -> 1[insertBev(Dollar)]*/
    ::state==0 -> action = insertBev_Dollar__action;state = 1;
    /*1 -> 0[cancelBev]*/
    ::state==1 -> action = cancelBev_action;state = 0;
    /*1 -> 2[sugar]*/
    ::state==1 -> action = sugar_action;state = 2;
    /*1 -> 3[no_sugar]*/
    ::state==1 -> action = no_sugar_action;state = 3;
    /*2 -> 6[coffee]*/
    ::state==2 -> action = coffee_action;state = 4;
    /*2 -> 5[tea]*/
    ::state==2 -> action = tea_action;state = 5;
    /*2 -> 4[cappuccino]*/
    ::state==2 -> action = cappuccino_action;state = 6;
    /*3 -> 9[cappuccino]*/
    ::state==3 -> action = cappuccino_action;state = 7;
    /*3 -> 8[tea]*/
    ::state==3 -> action = tea_action;state = 8;
    /*3 -> 7[coffee]*/
    ::state==3 -> action = coffee_action;state = 9;
    /*6 -> 7[pour_sugar]*/
    ::state==4 -> action = pour_sugar_action;state = 9;
    /*5 -> 8[pour_sugar]*/
    ::state==5 -> action = pour_sugar_action;state = 8;
    /*4 -> 9[pour_sugar]*/
    ::state==6 -> action = pour_sugar_action;state = 7;
    /*9 -> 11[pour_milk]*/
    ::state==7 -> action = pour_milk_action;state = 10;
    /*9 -> 10[pour_coffee]*/
    ::state==7 -> action = pour_coffee_action;state = 11;
    /*8 -> 12[pour_tea]*/
    ::state==8 -> action = pour_tea_action;state = 12;
    /*7 -> 12[pour_coffee]*/
    ::state==9 -> action = pour_coffee_action;state = 12;
    /*11 -> 12[pour_coffee]*/
    ::state==10 -> action = pour_coffee_action;state = 12;
    /*10 -> 12[pour_milk]*/
    ::state==11 -> action = pour_milk_action;state = 12;
    /*12 -> 13[ring]*/
    ::state==12 -> action = ring_action;state = 13;
    /*12 -> 13[skip]*/
    ::state==12 -> action = skip_action;state = 13;
    /*13 -> 0[take_cup]*/
    ::state==13 -> action = take_cup_action;state = 0;
od;
};
