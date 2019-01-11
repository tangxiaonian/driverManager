package com.tang.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.*;

/**
 * @author ASUS
 * @create 2018-12-22 14:29
 */
@ComponentScan(includeFilters = {
        @ComponentScan.Filter(type = FilterType.ANNOTATION,value = {Controller.class})
},useDefaultFilters = false,value = {"com.tang"})
@Configuration
@EnableWebMvc
public class App implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("",".jsp");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("login");
        registry.addViewController("/admin").setViewName("/admin/admin_main");
        registry.addViewController("/user").setViewName("/user/user_main");
    }
}
