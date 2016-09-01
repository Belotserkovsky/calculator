package by.belotserkovsky.services;

import by.belotserkovsky.dao.IUserDao;
import by.belotserkovsky.pojos.History;
import by.belotserkovsky.pojos.User;
import by.belotserkovsky.pojos.constants.Role;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

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

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Long createOrUpdateUser(User user){
        Long userId = user.getUserId();
        if(userId != null){
            User newUser = userDao.get(User.class, userId);
            newUser.setName(user.getName());
            newUser.setPassword(user.getPassword());
            newUser.setEmail(user.getEmail());
            return userDao.saveOrUpdate(newUser).getUserId();
        }
        else {
            user.setRole(Role.USER.getType());
            Set<History> history = new HashSet<History>();
            user.setCalcHistory(history);
            return userDao.saveOrUpdate(user).getUserId();
        }
    }
}
