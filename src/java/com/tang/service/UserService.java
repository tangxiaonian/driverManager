package com.tang.service;

import com.tang.bean.Result;
import com.tang.bean.User;
import com.tang.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ASUS
 * @create 2018-12-22 16:15
 */
@Service
public class UserService {

    @Autowired
    public UserDao userDaoImpl;

    public Result login(User user){

        Integer num = userDaoImpl.login(user).intValue();

        Result result = new Result();

        result.setMsg("登录失败!");

        result.setFlage(0);

        if (1 == num){

            result.setMsg("登录成功");

            result.setFlage(1);
        }

        return result;
    }


    public Result register(User user){

        Integer register = userDaoImpl.register(user);

        Result result = new Result();

        result.setMsg("注册成功!");

        result.setFlage(1);

        if (0 == register){

            result.setMsg("注册失败");

            result.setFlage(0);
        }

        return result;
    }

    public User selectUserByName(String username){

        User user = userDaoImpl.selectUserByName(username);

        return user;
    }
}
