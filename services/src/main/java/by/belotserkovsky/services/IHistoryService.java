package by.belotserkovsky.services;

import by.belotserkovsky.pojos.History;

import java.util.List;

/**
 * Created by K.Belotserkovsky
 */
public interface IHistoryService {

    void saveHistory(String expression, String result, String userName);

    List<History> getHistory(int offset, int numberOfRecords);

    int getRowsHistory();
}
