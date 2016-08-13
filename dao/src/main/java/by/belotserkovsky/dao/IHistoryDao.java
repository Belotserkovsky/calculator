package by.belotserkovsky.dao;

import by.belotserkovsky.pojos.History;

import java.util.List;

/**
 * Created by K.Belotserkovsky
 */
public interface IHistoryDao extends IDao<History> {

    List<History> getAll();

}
