package by.belotserkovsky.services;

import by.belotserkovsky.dao.IUserDao;
import by.belotserkovsky.pojos.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by K.Belotserkovsky
 */

@Service
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public class UserService implements IUserService{
    private static Logger log = Logger.getLogger(UserService.class);

    @Autowired
    private IUserDao userDao;

    public User getUserByUserName(String userName){
        return userDao.getByUserName(userName);
    }

    public Long createOrUpdateUser(User user){
        return userDao.saveOrUpdate(user).getUserId();
    }

}
