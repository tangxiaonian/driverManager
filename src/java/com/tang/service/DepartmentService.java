package com.tang.service;

import com.tang.bean.Department;
import com.tang.dao.DepartmentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ASUS
 * @create 2018-12-12 21:14
 */
@Service
public class DepartmentService {

    @Autowired
    DepartmentDao departmentImpl;

    public List<Department> list(){

        return departmentImpl.selectAll();

    }

}
