package by.belotserkovsky.dao;

import by.belotserkovsky.pojos.User;

/**
 * Created by K.Belotserkovsky
 */
public interface IUserDao extends IDao<User> {

    User getByUserName(String userName);
}
