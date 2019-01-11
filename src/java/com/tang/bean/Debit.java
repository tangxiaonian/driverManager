package com.tang.bean;

/**
 * @author Tang
 * @create 2019-01-08 19:40:09
 */
public class Debit {

	private Integer id;

	private Integer u_id;

	private Integer d_id;

	private Integer number;

//	private Integer auditStatus;

	private Integer flageStatus;

	private String user_message;

	private String admin_message;

	private User user;
	private Driver driver;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public Integer getId() {
        return this.id;
    }

	public void setId(Integer id) {
        this.id = id;
    }

	public Integer getU_id() {
        return this.u_id;
    }

	public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

	public Integer getD_id() {
        return this.d_id;
    }

	public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

	public Integer getNumber() {
        return this.number;
    }

	public void setNumber(Integer number) {
        this.number = number;
    }

//	public Integer getAuditStatus() {
//        return this.auditStatus;
//    }
//
//	public void setAuditStatus(Integer auditStatus) {
//        this.auditStatus = auditStatus;
//    }

	public Integer getFlageStatus() {
        return this.flageStatus;
    }

	public void setFlageStatus(Integer flageStatus) {
        this.flageStatus = flageStatus;
    }

	public String getUser_message() {
        return this.user_message;
    }

	public void setUser_message(String user_message) {
        this.user_message = user_message;
    }

	public String getAdmin_message() {
        return this.admin_message;
    }

	public void setAdmin_message(String admin_message) {
        this.admin_message = admin_message;
    }


    @Override
    public String toString() {
        return "DebitTable{" +
                "id=" + id +
                ", u_id=" + u_id +
                ", d_id=" + d_id +
                ", number=" + number +
                ", flageStatus=" + flageStatus +
                ", user_message='" + user_message + '\'' +
                ", admin_message='" + admin_message + '\'' +
                '}';
    }
}