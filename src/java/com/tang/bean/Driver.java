package com.tang.bean;

/**
 * @author ASUS
 * @create 2018-12-22 16:20
 */
public class Driver {

    private Integer id;
    private String driverName;
    private String driverNumber;
    private String driverDesc;
    private String driverWay;
    private Integer dId;

    private Department department;

    public Driver(){
    }


    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Driver{" +
                "id=" + id +
                ", driverName='" + driverName + '\'' +
                ", driverNumber='" + driverNumber + '\'' +
                ", driverDesc='" + driverDesc + '\'' +
                ", driverWay='" + driverWay + '\'' +
                ", dId=" + dId +
                '}';
    }

    public Driver(Integer id, String driverName, String driverNumber, String driverDesc, String driverWay, Integer dId) {
        this.id = id;
        this.driverName = driverName;
        this.driverNumber = driverNumber;
        this.driverDesc = driverDesc;
        this.driverWay = driverWay;
        this.dId = dId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getDriverNumber() {
        return driverNumber;
    }

    public void setDriverNumber(String driverNumber) {
        this.driverNumber = driverNumber;
    }

    public String getDriverDesc() {
        return driverDesc;
    }

    public void setDriverDesc(String driverDesc) {
        this.driverDesc = driverDesc;
    }

    public String getDriverWay() {
        return driverWay;
    }

    public void setDriverWay(String driverWay) {
        this.driverWay = driverWay;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}
