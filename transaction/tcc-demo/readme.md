**一.TCC事务补偿机制**
    1.配置多数据源
    2.配置事务管理器
    3.单元测试:
    com.example.tccdemo.TccDemoApplicationTests.testAccount

一.基于本地消息表的最终一致性方案
-- 1.本地消息表+定时任务=httpclient
step1:支付
    localhost:8080/payment?userId=1&orderId=10010&amount=100
        代码:com.example.tccdemo.controller.PaymentController.payment
        思路:
            1.(减扣金额+生成消息表)->同一个事务
            2.定时任务扫描任务表  未发送成功并且失败次数小于阈值 ->根据id发送消息(这里走httpClient) 
              if(success)->finish  fail->重试,到阈值更改为超时状态转人工处理
              代码:com.example.tccdemo.service.OrderScheduler.orderNotify
            3.订单系统(另外一个数据库),接收到请求->将订单更新为已支付->回传success

            