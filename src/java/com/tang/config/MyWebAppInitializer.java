package com.tang.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * @author ASUS
 * @create 2018-12-22 14:36
 */
public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{Root.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{App.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
