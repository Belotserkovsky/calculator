package by.belotserkovsky.services;

import by.belotserkovsky.pojos.User;

/**
 * Access to the class object UserDao
 * Created by K.Belotserkovsky
 */
public interface IUserService {

    /**
     * @param user
     */
    Long createOrUpdateUser(User user);

    /**
     * @param userName
     * @return user
     */
    User getUserByUserName(String userName);

}
