**一.TCC事务补偿机制**
    1.配置多数据源
    2.配置事务管理器
    3.单元测试:
    com.example.tccdemo.TccDemoApplicationTests.testAccount

**二.基于本地消息表的最终一致性方案**

-- 1.本地消息表+定时任务=httpclient
    支付:
    localhost:8080/payment?userId=1&orderId=10010&amount=100
        代码:com.example.tccdemo.controller.PaymentController.payment
        思路:
            1.(减扣金额+生成消息表)->同一个事务
            2.定时任务扫描任务表  未发送成功并且失败次数小于阈值 ->根据id发送消息(这里走httpClient) 
              if(success)->finish  fail->重试,到阈值更改为超时状态转人工处理
              代码:com.example.tccdemo.service.OrderScheduler.orderNotify
            3.订单系统(另外一个数据库),接收到请求->将订单更新为已支付->回传success

-- 2. 基于mq的最终一致性方案:

    2.1 需要mq环境(这里以mac环境 rocketMq作为实示例)
        cd /Users/zhangchao/develop/rocketMQ/rocketmq-all-4.5.1-bin-release
        1.启动路由:
        nohup sh bin/mqnamesrv & 
        新开窗口查看日志:
        tail -f ~/logs/rocketmqlogs/namesrv.log 
        2.启动broker:
        nohup sh bin/mqbroker -n localhost:9876 &
        新开窗口查看日志:
        tail -f ~/logs/rocketmqlogs/broker.log
     2.2  引入mq相关依赖  配置Bean，见：RocketMQConfig
     2.3  支付:
      localhost:8080/paymentMq?userId=1&orderId=10010&amount=100
      消息代码:com.example.tccdemo.service.PaymentServcie.pamentMQ
     
**三.接口幂等性**
1.update操作:利用乐观锁(version) 初始化页面将数据版本号给客户端,更新时必须携带这个version
2.insert操作没有唯一性标识,可以采用token机制+锁,防止重复提交

    zk:
    zookeeper-server-start  /usr/local/etc/kafka/zookeeper.properties 
    http://localhost:8080/user/register

