package com.company.realestate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

//TODO Реализовать преобразование сущностей через DTO объект
// https://stackoverflow.com/questions/48808163/convert-spring-entity-objects-to-modified-json-object

@SpringBootApplication
public class RealestateApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(RealestateApplication.class, args);
    }

    @Bean("multipartResolver")
    public MultipartResolver multipartResolver() {
        final CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        // 2 MB
        int maxUploadSizeInMb = 5 * 1024 * 1024;
        commonsMultipartResolver.setMaxUploadSize(maxUploadSizeInMb);
        commonsMultipartResolver.setMaxUploadSizePerFile(maxUploadSizeInMb);
        commonsMultipartResolver.setDefaultEncoding("utf-8");
        return commonsMultipartResolver;
    }
}
