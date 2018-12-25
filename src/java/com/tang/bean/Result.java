package com.tang.bean;

/**
 * @author ASUS
 * @create 2018-12-22 16:27
 */
public class Result {

    private String msg;
    private Integer flage;

    public Result(){
        this.msg = "success!";
        this.flage = 1;
    }

    public Result(String msg, Integer flage) {
        this.msg = msg;
        this.flage = flage;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getFlage() {
        return flage;
    }

    public void setFlage(Integer flage) {
        this.flage = flage;
    }
}
