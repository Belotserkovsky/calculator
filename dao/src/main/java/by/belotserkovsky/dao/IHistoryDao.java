package by.belotserkovsky.dao;

import by.belotserkovsky.pojos.History;

import java.util.List;

/**
 * Created by K.Belotserkovsky
 */
public interface IHistoryDao extends IDao<History> {

    /**
     * This method use for pagination
     * @param offset
     * @param numberOfRecords
     * @return List<User>
     */
    List<History> getByUser(int offset, int numberOfRecords, String userName);

    /**
     * @return Number of rows in user's table (for pagination)
     */
    int getFoundRows(String userName);

}
