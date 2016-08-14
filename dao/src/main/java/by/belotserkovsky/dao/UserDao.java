package by.belotserkovsky.dao;

import by.belotserkovsky.pojos.User;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by K.Belotserkovsky
 */

@Repository
public class UserDao extends Dao<User> implements IUserDao {
    private static Logger log = Logger.getLogger(UserDao.class);

    @Autowired
    public UserDao(SessionFactory sessionFactory){
        super(sessionFactory);
    }

    public User getByUserName(String userName){
        log.info("Get user by userName:" + userName);
        String hql = "SELECT user FROM User user WHERE user.userName=:userName";
        Query query = getSession().createQuery(hql);
        query.setParameter("userName", userName);
        return (User)query.uniqueResult();
    }

}
