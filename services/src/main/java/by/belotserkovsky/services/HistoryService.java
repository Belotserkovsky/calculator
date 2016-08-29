package by.belotserkovsky.services;

import by.belotserkovsky.dao.IHistoryDao;
import by.belotserkovsky.dao.IUserDao;
import by.belotserkovsky.pojos.History;
import by.belotserkovsky.pojos.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

/**
 * Created by K.Belotserkovsky
 */

@Service
@Transactional (propagation = Propagation.SUPPORTS)
public class HistoryService implements IHistoryService{

    @Autowired
    private IHistoryDao historyDao;

    @Autowired
    private IUserDao userDao;

    @Transactional (propagation = Propagation.REQUIRED)
    public void saveHistory(String expression, String result, String userName) {
        Date currentDate = new Date(System.currentTimeMillis());
        History history = new History(expression, result, currentDate);
        User user = userDao.getByUserName(userName);
        history.setUser(user);
        historyDao.saveOrUpdate(history);
    }


    public List<History> getUserHistory(int offset, int numberOfRecords, String userName){
        return historyDao.getByUser(offset, numberOfRecords, userName);
    }

    public int getRowsUserHistory(String userName){
        return historyDao.getFoundRows(userName);
    }

}