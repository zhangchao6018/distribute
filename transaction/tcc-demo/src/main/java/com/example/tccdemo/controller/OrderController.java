package com.example.tccdemo.controller;

import com.example.tccdemo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderController {
    @Autowired
    private OrderService orderService;

    /**
     * 处理订单(一般是业务下游,如扣减余额成功后->更新订单为已支付)
     * @param orderId
     * @return
     */
    @RequestMapping("handleOrder")
    public String handleOrder(int orderId){

        try{
            int result = orderService.handleOrder(orderId);

            if (result == 0) return "success";

            return "fail";
        }catch (Exception e){
            return "fail";
        }

    }

}
