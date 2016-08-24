package by.belotserkovsky.services;

import org.apache.log4j.Logger;

/**
 * Created by K.Belotserovsky
 */
public class CalcService implements ICalcService{
    private static Logger log = Logger.getLogger(UserService.class);

    public boolean isOperator(char op){
        if(op == '+'|| op == '-' || op == '*' || op == '/'){
            return true;
        }
        return false;
    }

    public int checkOpPriority(char op){
        if (op == '*' || op == '/')
            return 2;
        else
            return 1;

    }

    public String transformToRpn(String original){
        double numberA = 0;
        double numberB = 0;
        String temp;

    }


}
