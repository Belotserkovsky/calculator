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
    }


}
