1.引入jta依赖
2.配置多数据源以及xa分布式事务管理器  见: ConfigDb131  ConfigDb132
3.测试案例(必须在方法上加上@Transactional 注解 并指明xa事务管理器)
正常插入:
        XA131 xa131 = new XA131();
        xa131.setId(1);
        xa131.setName("xa_111");
        xa131Mapper.insert(xa131);

        XA132 xa132 = new XA132();
        xa132.setId(1);
        xa132.setName("xa_112");
        xa132Mapper.insert(xa132);
模拟异常:在112库(后执行的库)表结构改一下,name字段长度设置成2(不让插入)
    查看是否统一回滚