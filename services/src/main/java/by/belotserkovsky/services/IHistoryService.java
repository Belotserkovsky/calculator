package by.belotserkovsky.services;

import by.belotserkovsky.pojos.History;

import java.util.List;

/**
 * Created by K.Belotserkovsky
 */
public interface IHistoryService {

    /**
     * @param expression
     * @param result
     * @param userName
     */
    void saveHistory(String expression, String result, String userName);

    /**
     * pagination
     * @param offset
     * @param numberOfRecords
     * @param userName
     */
    List<History> getUserHistory(int offset, int numberOfRecords, String userName);

    /**
     * number of rows in data base for pagination
     * @param userName
     */
    int getRowsUserHistory(String userName);
}
