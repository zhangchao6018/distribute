package com.example.tccdemo.config;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RocketMQConfig {


    @Bean(initMethod = "start",destroyMethod = "shutdown")  // 跟随spring项目启动/销毁
    public DefaultMQProducer producer() {
        DefaultMQProducer producer = new
                DefaultMQProducer("paymentGroup");
        // Specify name server addresses.
        producer.setNamesrvAddr("localhost:9876");
        return producer;
    }

    /**
     * 实例化消费者Bean
     * @param messageListener
     * @return
     * @throws MQClientException
     */
    @Bean(initMethod = "start",destroyMethod = "shutdown")
    public DefaultMQPushConsumer consumer(@Qualifier("messageListener") MessageListenerConcurrently messageListener) throws MQClientException {
        DefaultMQPushConsumer consumer = new
                DefaultMQPushConsumer("paymentConsumerGroup");

        // Specify name server addresses.
        //监听的rocket服务
        consumer.setNamesrvAddr("localhost:9876");

        // Subscribe one more more topics to consume.
        //指定主题
        consumer.subscribe("payment", "*");

        consumer.registerMessageListener(messageListener);

        return consumer;
    }

}
