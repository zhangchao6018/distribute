整理自官方文档:[https://shardingsphere.apache.org/document/legacy/4.x/document/cn/overview/]

## **### ```一 sharding整合spring步骤```**
1. pom依赖
    特别注意需要这个依赖:
        <dependency>
            <groupId>org.apache.shardingsphere</groupId>
            <artifactId>sharding-jdbc-spring-namespace</artifactId>
            <version>4.0.0-RC2</version>
        </dependency>
2. 启动类:@ImportResource("classpath*:sharding-jdbc.xml") 
3. 表:sharding_order.sql
4. 配置 sharding-jdbc.xml 内容见 sharding-jdbc-1.xml
5. application.properties
    `spring.shardingsphere.datasource.names=ds0,ds1
    
    spring.shardingsphere.datasource.ds0.type=com.zaxxer.hikari.HikariDataSource
    spring.shardingsphere.datasource.ds0.driver-class-name=com.mysql.cj.jdbc.Driver
    spring.shardingsphere.datasource.ds0.jdbcUrl=jdbc:mysql://192.168.1.111:3306/sharding_order
    spring.shardingsphere.datasource.ds0.username=root
    spring.shardingsphere.datasource.ds0.password=root
    
    spring.shardingsphere.datasource.ds1.type=com.zaxxer.hikari.HikariDataSource
    spring.shardingsphere.datasource.ds1.driver-class-name=com.mysql.cj.jdbc.Driver
    spring.shardingsphere.datasource.ds1.jdbcUrl=jdbc:mysql://192.168.1.112:3306/sharding_order
    spring.shardingsphere.datasource.ds1.username=root
    spring.shardingsphere.datasource.ds1.password=root`

6. 测试
        Order order = new Order();
        order.setId(1l);
        order.setOrderId(1l);
        order.setUserId(15);
        order.setOrderAmount(BigDecimal.TEN);
        order.setOrderStatus(1);
        orderMapper.insertSelective(order); 
        
7. 结果分析
    我们在sharding-jdbc.xml 配置的根据user_id %2 判断取哪个数据库分片  -> 得出结果是: ds1
    根据id的值 %2+1 判断取哪张表 ->  t_order_2 
    因此该记录应为ds1节点库的t_order_2表

8. 问题 如果我们想查询刚才生成的数据 会发现查不到 后续我们将解决这个问题



[https://shardingsphere.apache.org/document/legacy/4.x/document/cn/manual/sharding-jdbc/configuration/config-spring-boot/]
## **### ```二 sharding整合spring-boot步骤```**

1.将启动类注解去掉 @ImportResource("classpath*:sharding-jdbc.xml") 
2.pom依赖 namespace依赖去掉
3.application.properties  见:application-2.properties
4.测试案例
        Order order2 = new Order();
        order2.setOrderId(2L);
        order2.setId(16L);
        order2.setUserId(26);
        order2.setOrderAmount(BigDecimal.TEN);
        order2.setOrderStatus(1);
        orderMapper.insertSelective(order2);
5. 数据落在     因此该记录应为ds0节点库的t_order_1表


## **### ```三 sharding-jdbc 的全局表```**

哪些表应该设计成为全局表,哪些表应该设计成分片表?

    全局表的数据量比较小,为了避免询和其他数据量大的表跨库联合查(分片的)  
1.配置
application.properties 配置: spring.shardingsphere.sharding.broadcast-tables=area
2.
    @Test
    public void testGlobal(){
        Area area = new Area();
        area.setId(2);
        area.setName("上海");
        areaMapper.insert(area);
    }
    
## **### ```四 sharding-jdbc 的字表(绑定表)```**
和父表需要在同一个分片当中(避免跨库查询)
例如:order  order_item  order_item相当于order的子表
sharding不像mycat可以配置主从表的具体根据哪个字段关联
    1.这里的order表主键是id,order_item'外键'是order_id,显然字段名不一致,因此order表的主键名需要跟order_item表的外键名一致->改为order_id,在实际表设计时,也应该如此
    2.由于我们这里order表示是根据user_id分片,order_id分表的,如果order_item将user_id也关联上,将报错
    3. 配置好了仍然报错 目前版本的sharding绑定表是在广播表之前创建的,绑定表的创建源码会用到广播表,会报空指针异常->不建议用
    
配置:(xml形似)
    测试案例:
    OrderItem orderItem = new OrderItem();
    orderItem.setId(2);
    orderItem.setOrderId(1);
    orderItem.setPruductName("测试商品");
    orderItem.setNum(1);
    orderItem.setUserId(19);
    orderItemMapper.insert(orderItem);
![bug](src/resources/sharding-bug.png)

