package com.example.tccdemo.controller;

import com.example.tccdemo.service.PaymentServcie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@RestController
public class PaymentController {
    @Autowired
    private PaymentServcie paymentServcie;

    /**
     * 支付接口->模拟单是业务上层,如生成订单(未支付),减扣余额
     * @param userId
     * @param orderId
     * @param amount
     * @return
     * @throws Exception
     */
    @RequestMapping("payment")
    public String payment(int userId, int orderId, BigDecimal amount) throws Exception {

//        int result = paymentServcie.pamentMQ(userId, orderId, amount);
        int result = paymentServcie.pament(userId, orderId, amount);
        return "支付结果："+result;
    }
}
