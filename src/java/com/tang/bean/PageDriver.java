package com.tang.bean;

import java.util.List;

/**
 * @author ASUS
 * @create 2018-12-12 19:32
 */
public class PageDriver {

    //    起始位置
    private Integer position;
    //    总记录数
    private Integer count;
    //    总页数
    private Integer countPage;
    //    页的大小
    private Integer pageSize;
    //    当前页
    private Integer currentPage;
    //    当前页的数据
    private List<Driver> list;

    public PageDriver(Integer pageSize, Integer currentPage) {
        this.pageSize = pageSize;
        this.currentPage = currentPage;
    }

    public PageDriver() {
        this.currentPage = 0;
    }

    public Integer getCountPage() {
        return countPage;
    }

    public void setCountPage(Integer countPage) {
        this.countPage = countPage;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getCurrentPage() {
        if (currentPage >= this.countPage)
            this.currentPage = this.countPage;
        if (currentPage <= 0)
            currentPage = 1;
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public List<Driver> getList() {
        return list;
    }

    public void setList(List<Driver> list) {
        this.list = list;
    }
}
