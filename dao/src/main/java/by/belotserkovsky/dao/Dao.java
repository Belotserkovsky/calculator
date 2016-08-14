package by.belotserkovsky.dao;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

/**
 * Created by K.Belotserkovsky
 */
abstract class Dao<T> implements IDao<T>{
    private static Logger log = Logger.getLogger(Dao.class);
    private SessionFactory sessionFactory;

    @Autowired
    public Dao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    public T saveOrUpdate(T t){
        getSession().saveOrUpdate(t);
        log.info("Save or update:" + t);
        return (T)t;
    }

    public T get(Class<T> clazz, Long id) {
        log.info("Get by id:" + id);
        return (T) getSession().get(clazz, id);
    }
}
