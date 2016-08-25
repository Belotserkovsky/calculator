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
        StringBuilder sOut = new StringBuilder("");
        StringBuilder sStack = new StringBuilder("");
        char cIn;
        char cTemp;

        for (int i = 0; i < original.length(); ++i){
            cIn = original.charAt(i);
            if(isOperator(cIn)) {
                while (sStack.length() > 0) {
                    cTemp = sStack.substring(sStack.length() - 1).charAt(0);
                    if (checkOpPriority(cIn) <= checkOpPriority(cTemp)) {
                        sOut.append(" ").append(cTemp).append(" ");
                        sStack.setLength((sStack.length() - 1));
                    } else {
                        sOut.append(" ");
                        break;
                    }
                }
                sOut.append(" ");
                sStack.append(cIn);
            } else {
                sOut.append(cIn);
            }
        }

        while (sStack.length() > 0){
            sOut.append(" ").append(sStack.substring((sStack.length() - 1)));
            sStack.setLength(sStack.length() - 1);
        }

        return sOut.toString();
    }


}
