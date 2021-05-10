mtype = {no_action, pay_action, free_action, change_action, cancel_action, soda_action, tea_action, return_action, serveSoda_action, serveTea_action, open_action, take_action, close_action};

mtype action

int state

#define PAY_ACTION (action == pay_action)
#define FREE_ACTION (action == free_action)
#define CHANGE_ACTION (action == change_action)
#define CANCEL_ACTION (action == cancel_action)
#define SODA_ACTION (action == soda_action)
#define TEA_ACTION (action == tea_action)
#define RETURN_ACTION (action == return_action)
#define SERVESODA_ACTION (action == serveSoda_action)
#define SERVETEA_ACTION (action == serveTea_action)
#define OPEN_ACTION (action == open_action)
#define TAKE_ACTION (action == take_action)
#define CLOSE_ACTION (action == close_action)

init{
    action=no_action;
    state=1;
    do
    ::state==1 -> action = pay_action;state = 2;
    ::state==1 -> action = free_action;state = 3;
    ::state==2 -> action = change_action;state = 3;
    ::state==3 -> action = cancel_action;state = 4;
    ::state==3 -> action = soda_action;state = 5;
    ::state==3 -> action = tea_action;state = 6;
    ::state==4 -> action = return_action;state = 1;
    ::state==5 -> action = serveSoda_action;state = 7;
    ::state==6 -> action = serveTea_action;state = 7;
    ::state==7 -> action = open_action;state = 8;
    ::state==7 -> action = take_action;state = 1;
    ::state==8 -> action = take_action;state = 9;
    ::state==9 -> action = close_action;state = 1;
od;
};
