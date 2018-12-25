package com.tang.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

import java.beans.PropertyVetoException;

/**
 * @author ASUS
 * @create 2018-12-22 15:17
 */
@PropertySource(value = "classpath:static/db.properties")
@Configuration
public class DataSourceConfig {

    @Value("${driverClass}")
    public String driverClass;
    @Value("${jdbcUrl}")
    private String jdbcUrl;
    @Value("${user}")
    private String user;
    @Value("${password}")
    private String password;

    @Bean
    public ComboPooledDataSource dataSource() throws PropertyVetoException {

        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setJdbcUrl(this.jdbcUrl);
        dataSource.setUser(this.user);
        dataSource.setPassword(this.password);
        dataSource.setDriverClass(this.driverClass);

        return dataSource;
    }

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer(){
        return new PropertySourcesPlaceholderConfigurer();
    }

}
