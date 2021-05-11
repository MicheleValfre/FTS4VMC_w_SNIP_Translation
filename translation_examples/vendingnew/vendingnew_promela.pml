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
    state=0;
    do
    /*1 -> 2[pay]*/
    ::state==0 -> action = pay_action;state = 1;
    /*1 -> 3[free]*/
    ::state==0 -> action = free_action;state = 2;
    /*2 -> 3[change]*/
    ::state==1 -> action = change_action;state = 2;
    /*3 -> 4[cancel]*/
    ::state==2 -> action = cancel_action;state = 3;
    /*3 -> 5[soda]*/
    ::state==2 -> action = soda_action;state = 4;
    /*3 -> 6[tea]*/
    ::state==2 -> action = tea_action;state = 5;
    /*4 -> 1[return]*/
    ::state==3 -> action = return_action;state = 0;
    /*5 -> 7[serveSoda]*/
    ::state==4 -> action = serveSoda_action;state = 6;
    /*6 -> 7[serveTea]*/
    ::state==5 -> action = serveTea_action;state = 6;
    /*7 -> 8[open]*/
    ::state==6 -> action = open_action;state = 7;
    /*7 -> 1[take]*/
    ::state==6 -> action = take_action;state = 0;
    /*8 -> 9[take]*/
    ::state==7 -> action = take_action;state = 8;
    /*9 -> 1[close]*/
    ::state==8 -> action = close_action;state = 0;
od;
};
