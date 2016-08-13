package by.belotserkovsky.dao;

/**
 * Created by K.Belotserkovsky
 */
public interface IDao<T> {
    T add(T t);
    T get(Class<T> clazz, Long id);
}
