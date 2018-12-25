package com.tang.dao;


import com.tang.bean.Department;

import java.util.List;

public interface DepartmentDao {

    public Integer addDepart(Department department);

    public List<Department> selectAll();

}