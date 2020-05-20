package com.example.tccdemo.service;

import com.example.tccdemo.db131.dao.AccountAMapper;
import com.example.tccdemo.db131.model.AccountA;
import com.example.tccdemo.db132.dao.AccountBMapper;
import com.example.tccdemo.db132.model.AccountB;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;

@Service
public class AccountService {
    @Resource
    private AccountAMapper accountAMapper;
    @Resource
    private AccountBMapper accountBMapper;

    @Transactional(transactionManager = "tm131",rollbackFor = Exception.class)
    public void transferAccount(){
        AccountA accountA = accountAMapper.selectByPrimaryKey(1);
        accountA.setBalance(accountA.getBalance().subtract(new BigDecimal(200)));
        accountAMapper.updateByPrimaryKey(accountA);

        AccountB accountB = accountBMapper.selectByPrimaryKey(2);
        accountB.setBalance(accountB.getBalance().add(new BigDecimal(200)));
        accountBMapper.updateByPrimaryKey(accountB);

        try{
            int i = 1/0;
        }catch (Exception e){
            //异常->补偿(撤销)->try的位置需要注意 ,如果异常是在数据库之前发生的,补偿机制不需要生效. 而且捕捉的异常最好是根据自定义异常捕捉,比如: 为数据库操作时,及以后发生的异常统一捕捉再抛出,后由补偿机制进行捕获
            try{
                //如果在补偿时出现了错误,将同样操作成数据不一致
                // 如果逻辑里面还涉及其他数据源,代码将更复杂
                AccountB accountb = accountBMapper.selectByPrimaryKey(2);
                accountb.setBalance(accountb.getBalance().subtract(new BigDecimal(200)));
                accountBMapper.updateByPrimaryKey(accountb);
            }catch (Exception e1){

            }


            throw e;
        }

    }



}
