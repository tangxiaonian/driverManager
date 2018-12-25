package com.tang.web;

import com.tang.bean.Department;
import com.tang.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author ASUS
 * @create 2018-12-12 21:09
 */
@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @GetMapping("/dept")
    @ResponseBody
    public List<Department> list(){

        List<Department> departments = departmentService.list();

        return departments;
    }

}
