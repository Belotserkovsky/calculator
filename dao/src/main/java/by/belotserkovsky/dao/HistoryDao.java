package by.belotserkovsky.dao;

import by.belotserkovsky.pojos.History;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by K.Belotserkovsky
 */

@Repository
public class HistoryDao extends Dao<History> implements IHistoryDao {
    private static Logger log = Logger.getLogger(HistoryDao.class);

    @Autowired
    public HistoryDao(SessionFactory sessionFactory){
        super(sessionFactory);
    }

    public List<History> getAll(int offset, int numberOfRecords){
        String hql = "FROM History";
        List<History> all = getSession().createQuery(hql).setFirstResult(offset).setMaxResults(numberOfRecords).list();
        log.info("Got all.");
        return all;
    }

    public int getFoundRows(){
        Criteria criteria = getSession().createCriteria(History.class);
        criteria.setProjection(Projections.rowCount());
        Long result = (Long)criteria.uniqueResult();
        int foundRows = result.intValue();
        log.info("Got a number of rows.");
        return foundRows;
    }
}
