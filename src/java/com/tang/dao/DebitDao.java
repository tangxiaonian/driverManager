package com.tang.dao;

import com.tang.bean.Debit;

import java.util.List;
import java.util.Map;

/**
 * @author ASUS
 * @create 2019-01-08 20:33
 */
public interface DebitDao {
//    插入一条借记记录
    public int insertDebitRecord(Debit debit);

    public List<Debit> getDebitAll();
//    根据用户id 查询出属于用户的借用记录
    public List<Debit> selectByIdDebit(Integer id);

//  根据设备状态查询出位审核的记录
    public List<Debit> selectByFlageStatusDebit(Integer flage);

//    更新借记表
    public int updateRecordStatus(Map<String,Object> map);

//    记录删除
    public int deleteByRecord(Integer id);
}
