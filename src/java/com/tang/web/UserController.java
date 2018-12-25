package com.tang.web;

import com.tang.bean.Result;
import com.tang.bean.User;
import com.tang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author ASUS
 * @create 2018-12-22 14:41
 */
@Controller
public class UserController {

    @Autowired
    public UserService userServiceImpl;

    @GetMapping("/login")
    @ResponseBody
    public Result login(User user, HttpServletRequest request){

        String username = user.getUsername();

        Result result = userServiceImpl.login(user);
//        login success
        if (result.getFlage() == 1){

            HttpSession session = request.getSession();

            user = userServiceImpl.selectUserByName(username);

            session.setAttribute("user",user);

            session.setMaxInactiveInterval(1200);

        }

        return result;
    }

    @PostMapping("/register")
    @ResponseBody
    public Result register(User user){

        System.out.println(user);

        Result result = userServiceImpl.register(user);

        return result;
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request,HttpServletResponse response){

        HttpSession session = request.getSession();

        session.removeAttribute("user");

        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
