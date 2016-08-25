package by.belotserkovsky.services;

import org.apache.log4j.Logger;

import java.util.Stack;
import java.util.StringTokenizer;

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

    public Double calculateRpn(String rpn){
        double numberA;
        double numberB;
        String sTemp;

        Stack<Double> stack = new Stack<Double>();
        StringTokenizer sRpn = new StringTokenizer(rpn);

        while(sRpn.hasMoreTokens()){
            sTemp = sRpn.nextToken().trim();
            if(sTemp.length() == 1 && isOperator(sTemp.charAt(0))){
                if(stack.size() < 2){
                    log.error("Not enough data on the stack for the operation " + sTemp);
                }
                numberB = stack.pop();
                numberA = stack.pop();
                switch (sTemp.charAt(0)){
                    case ('+'): numberA += numberB; break;
                    case ('-'): numberA -= numberB; break;
                    case ('*'): numberA *= numberB; break;
                    case ('/'): numberA /= numberB; break;
                }
                stack.push(numberA);
            } else {
                numberA = Double.parseDouble(sTemp);
                stack.push(numberA);
            }
        }
        if(stack.size() > 1){
            log.error("The number of operands does not match the number of operations!");
        }

        return stack.pop();
    }

}
