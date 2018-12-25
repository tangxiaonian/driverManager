package com.tang.config;

import org.springframework.context.annotation.*;
import org.springframework.stereotype.Controller;
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
    @Bean
    public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
        return new HiddenHttpMethodFilter();
    }

}
