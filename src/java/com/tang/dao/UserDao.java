package com.tang.dao;

import com.tang.bean.Result;
import com.tang.bean.User;

/**
 * @author ASUS
 * @create 2018-12-22 15:45
 */
public interface UserDao {

    public Long login(User user);

    public Integer register(User user);

    public User selectUserByName(String username);

}
