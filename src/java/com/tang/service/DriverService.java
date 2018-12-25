package com.tang.service;

import com.tang.bean.Driver;
import com.tang.bean.PageDriver;
import com.tang.dao.DriverDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ASUS
 * @create 2018-12-23 14:25
 */
@Service
public class DriverService {

    @Autowired
    DriverDao driverDaoImpl;

//    根据id 查询
    public Driver selectDriverById(String id){

        Driver driver = driverDaoImpl.selectDriverById(id);

        return driver;
    }

//    分页的page
    public PageDriver pageSelectDriver(Integer currentPage, Integer pageSize){

        PageDriver pageDriver = new PageDriver();
//        每页的大小
        pageDriver.setPageSize(pageSize);
//        总记录数
        int count = driverDaoImpl.driverCount().intValue();
        pageDriver.setCount(count);
//        总页数
        Integer countPage = (count + pageSize - 1) / pageSize;
        pageDriver.setCountPage(countPage);
//        当前页
        pageDriver.setCurrentPage(currentPage);

        currentPage = pageDriver.getCurrentPage();
//        开始位置
        Integer start = ( currentPage - 1 ) * pageSize;
//        开始位置
        pageDriver.setPosition(start);

        List<Driver> driverList = driverDaoImpl.pageSelectDriver(start, pageSize);

        pageDriver.setList(driverList);

        return pageDriver;

    }

//    删除
    public int deleteDriver(Integer[] delA){

        int result = 0;

        for (int i = 0;i < delA.length;i++){

            result = driverDaoImpl.deleteById(delA[i]);
        }

        return result;
    }
//  添加
    public int addDriver(Driver driver){

        int result = driverDaoImpl.addDriver(driver);

        return result;
    }

    public int updtaeDriver(Driver driver){

        int result = driverDaoImpl.updtaeDriver(driver);

        return result;
    }

}
