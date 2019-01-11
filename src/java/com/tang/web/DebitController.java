package com.tang.web;

import com.tang.bean.Debit;
import com.tang.bean.Result;
import com.tang.bean.User;
import com.tang.service.DebitService;
import com.tang.service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ASUS
 * @create 2019-01-08 20:33
 */
@Controller
public class DebitController {

    @Autowired
    public DebitService debitService;

    @Autowired
    public DriverService driverServiceImpl;

    @PostMapping("/debit")
    @ResponseBody
    public Result insertDebitRecord(Debit debit, HttpSession httpSession)
            throws UnsupportedEncodingException {

        User user = (User) httpSession.getAttribute("user");
        debit.setU_id(user.getId());
        debit.setUser_message(new String(debit.getUser_message().getBytes("iso-8859-1"),"utf-8"));

//        减少设备数量
        debitService.updateReduceDriverNumber(debit.getNumber(),debit.getD_id());
//       用户借用设备
        Integer flage = debitService.insertDebitRecord(debit);
        Result result = new Result();
        result.setFlage(0);
        result.setMsg("借用失败!");
        if (flage == 1){
            result.setFlage(1);
            result.setMsg("借用成功，请等待审核结果!");
        }
        return result;

    }
    @GetMapping("/debits")
    @ResponseBody
    public List<Debit> getDebitAll(){

        List<Debit> debitAll = debitService.getDebitAll();

        return debitAll;
    }
    @GetMapping("/user/debits")
    @ResponseBody
    public List<Debit> selectByIdDebit(HttpSession httpSession){

        User user = (User) httpSession.getAttribute("user");

        System.out.println(user);

        return debitService.selectByIdDebit(user.getId());
    }

    @GetMapping("/admin/debits/{flage}")
    @ResponseBody
    public List<Debit> selectByFlageStatusDebit(@PathVariable("flage") Integer flage){

        return debitService.selectByFlageStatusDebit(flage);
    }

    @PostMapping("/admin/debit")
    @ResponseBody
    public Result updateRecordStatus(Integer recordId,Integer flage,
                                     String message,Integer driverId,Integer number)
            throws UnsupportedEncodingException {

        Map<String,Object> map = new HashMap<>();

        map.put("id",recordId.toString());
        map.put("flage",flage.toString());
        map.put("message",new String(message.getBytes("iso-8859-1"),"utf-8"));
//        更新设备审核状态
        int status = debitService.updateRecordStatus(map);

        Result result = new Result();
        result.setFlage(status);
        result.setMsg("审核完成!");

        if (flage == 1) {
//            审核成功设备数量减少
            driverServiceImpl.updateAddDriverNumber(number, driverId);
        }

        return result;
    }

    @PostMapping("/user/debit")
    @ResponseBody
    public Result returnDriver(Integer id,Integer dId,Integer number){

        Result result = new Result();

//        设备的数量增加
        int resultNumber = driverServiceImpl.updateAddDriverNumber(number, dId);
//        删除借记记录。。
        debitService.deleteByRecord(id);

        result.setFlage(resultNumber);

        result.setMsg("归还成功！");

        return  result;
    }


}
