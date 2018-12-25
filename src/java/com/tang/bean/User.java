package com.tang.bean;

/**
 * @author ASUS
 * @create 2018-12-22 16:16
 */
public class User {

    private Integer id;
    private String username;
    private String password;
    private String phone;
    private Integer role;


    public User(){
    }

    public User(Integer id, String username, String password,String phone,Integer role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.role = role;
    }


    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", role=" + role +
                '}';
    }
}
