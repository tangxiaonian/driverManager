package com.tang.dao;

import com.tang.bean.Driver;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ASUS
 * @create 2018-12-23 14:24
 */
public interface DriverDao {

    public Driver selectDriverById(String id);
//    分页
    public List<Driver> pageSelectDriver(@Param("strat") Integer start,
                                         @Param("pageSize") Integer pageSize);
//    记录总数
    public Long driverCount();
//    通过id删除
    public int deleteById(Integer id);
//    添加
    public int addDriver(Driver driver);

    public int updtaeDriver(Driver driver);

//    减少设备数量
    public int updateReduceDriverNumber(@Param("number") Integer number,@Param("id") Integer id);

    public int updateAddDriverNumber(@Param("number") Integer number,@Param("id") Integer id);

}
