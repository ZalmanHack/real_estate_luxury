package com.company.realestate.configs;

import org.hibernate.validator.HibernateValidator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.MultipartFilter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Value("${upload.path.pre}")
    private String uploadPathPre;

    @Value("${upload.path}")
    private String uploadPath;

    @Value("${upload.path.img}")
    private String pathImg;

    @Value("${upload.path.vid}")
    private String pathVid;

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
    }

    @Override
    public Validator getValidator() {
        LocalValidatorFactoryBean lvfb = new LocalValidatorFactoryBean();
        lvfb.setProviderClass(HibernateValidator.class);
        return lvfb;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(pathImg + "/**")
                .addResourceLocations(uploadPathPre + uploadPath + pathImg + "/");
        registry.addResourceHandler(pathVid + "/**")
                .addResourceLocations(uploadPathPre + uploadPath + pathVid + "/");

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/"); // ищет в списке ресурсов/проекта
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }
}
