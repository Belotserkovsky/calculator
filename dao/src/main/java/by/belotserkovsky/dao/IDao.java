package by.belotserkovsky.dao;

/**
 * Created by K.Belotserkovsky
 */
public interface IDao<T> {
    T saveOrUpdate(T t);
    T get(Class<T> clazz, Long id);
}
