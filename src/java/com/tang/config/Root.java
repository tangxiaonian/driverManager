package com.tang.config;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;

/**
 * @author ASUS
 * @create 2018-12-22 14:29
 */

@ImportResource("classpath:static/applicationContext-Mybatis.xml")
@Configuration
@ComponentScan(value = {"com.tang"},excludeFilters = {
        @ComponentScan.Filter(type = FilterType.ANNOTATION,value = {Controller.class})
})
public class Root {

//    @Bean
//    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory){
////        批量执行的一个sqlSession
//        SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory,ExecutorType.BATCH);
//
//        return sqlSessionTemplate;
//    }

    @Bean
    public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
        return new HiddenHttpMethodFilter();
    }

}
