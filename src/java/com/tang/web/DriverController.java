package com.tang.web;

import com.tang.bean.Driver;
import com.tang.bean.PageDriver;
import com.tang.bean.Result;
import com.tang.service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Arrays;

/**
 * @author ASUS
 * @create 2018-12-23 13:30
 */
@Controller
public class DriverController {

    @Autowired
    private DriverService driverServiceImpl;

//  delete
    @PostMapping("/delDrivers")
    @ResponseBody
    public Result delDriver(@RequestParam(name = "delA") Integer[] delA){

        int driver = driverServiceImpl.deleteDriver(delA);

        return new Result("删除成功!", driver);
    }

//    post 更新
    @PostMapping("/post_driver")
    @ResponseBody
    public Result updtaeDriver(Driver driver){

        int updtaeDriver = driverServiceImpl.updtaeDriver(driver);

        return new Result("更新成功!", 0);
    }
//    put 增加
    @PostMapping("/driver")
    @ResponseBody
    public Result addDriver(Driver driver) throws IOException {

        int flage = driverServiceImpl.addDriver(driver);

        Result result = new Result("添加成功!", 1);

        if (flage == 0){
            result.setMsg("添加失败!");
            result.setFlage(0);
        }
        return result;

    }


    @GetMapping("/driver/{id}")
    @ResponseBody
    public Driver selectDriverById(@PathVariable String id){

        Driver driver = driverServiceImpl.selectDriverById(id);

        return driver;
    }

    @GetMapping("/drivers")
    @ResponseBody
    public PageDriver pageSelectDriver(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "5") Integer pageSize,
            ModelMap modelMap){

        PageDriver pageDriver = driverServiceImpl.pageSelectDriver(currentPage, pageSize);

        modelMap.addAttribute("pageDriver",pageDriver);

        return pageDriver;
    }

}
