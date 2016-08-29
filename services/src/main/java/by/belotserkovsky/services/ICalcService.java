package by.belotserkovsky.services;

import by.belotserkovsky.services.exceptions.CalculationFailsException;

/**
 * Created by K.Belotserkovsky
 */
public interface ICalcService {

    /**
     * Check the current character is an operator
     * @param op
     * @return boolean
     */
    boolean isOperator(char op);

    /**
     * Check and return operator priority
     * @param op
     * @return int
     */
    int checkOpPriority(char op);

    /**
     * Transformation original string to Reverse Polish Notation (algorithm sorting station)
     * @param original input string
     * @return Output string (RPN)
     */
    String transformToRpn(String original);

    /**
     * Calculation expression in RPN
     * @param rpn
     * @return double
     */
    String calculateRpn(String rpn) throws CalculationFailsException;

}
