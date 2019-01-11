package com.tang.service;

import com.tang.bean.Debit;
import com.tang.bean.Result;
import com.tang.dao.DebitDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

/**
 * @author ASUS
 * @create 2019-01-08 20:33
 */
@Service
public class DebitService {

    @Autowired
    public DebitDao debitDaoImpl;

    @Autowired
    private DriverService driverServiceImpl;

    public Integer insertDebitRecord(Debit debit){

        return debitDaoImpl.insertDebitRecord(debit);
    }

    public List<Debit> getDebitAll(){

        List<Debit> debitAll = debitDaoImpl.getDebitAll();

        return debitAll;
    }

    public List<Debit> selectByIdDebit(Integer id){
        return debitDaoImpl.selectByIdDebit(id);
    }


    public List<Debit> selectByFlageStatusDebit(Integer flage){
        return debitDaoImpl.selectByFlageStatusDebit(flage);
    }

    public int updateRecordStatus(Map<String,Object> map){
        return debitDaoImpl.updateRecordStatus(map);
    }

    public int updateReduceDriverNumber(Integer number, Integer id){
        return driverServiceImpl.updateReduceDriverNumber(number,id);
    }

    public int updateAddDriverNumber(Integer number, Integer id){
        return driverServiceImpl.updateAddDriverNumber(number,id);
    }

    public int deleteByRecord(Integer id){
        return debitDaoImpl.deleteByRecord(id);
    }

}
