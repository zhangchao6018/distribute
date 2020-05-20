package com.example.tccdemo.config;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;
import java.io.IOException;

@Configuration
@MapperScan(value = "com.example.tccdemo.db131.dao",sqlSessionFactoryRef = "factoryBean131")
public class ConfigDb131 {

    @Bean("db131")
    public DataSource db131() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUser("root");
        dataSource.setPassword("root");
        dataSource.setUrl("jdbc:mysql://192.168.1.111:3306/xa_111?characterEncoding=UTF-8");

        return dataSource;
    }

    @Bean("factoryBean131")
    public SqlSessionFactoryBean factoryBean(@Qualifier("db131") DataSource dataSource) throws IOException {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();

        factoryBean.setDataSource(dataSource);
        ResourcePatternResolver resourceResolver = new PathMatchingResourcePatternResolver();

        factoryBean.setMapperLocations(resourceResolver.getResources("mybatis/db131/*.xml"));
        return factoryBean;
    }

    @Bean("tm131")
    public PlatformTransactionManager transactionManager(@Qualifier("db131") DataSource dataSource) {

        return new DataSourceTransactionManager(dataSource);
    }
}
