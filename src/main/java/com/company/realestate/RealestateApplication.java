package com.company.realestate;

import org.apache.catalina.connector.Connector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

//TODO Реализовать преобразование сущностей через DTO объект
// https://stackoverflow.com/questions/48808163/convert-spring-entity-objects-to-modified-json-object

@SpringBootApplication
public class RealestateApplication extends SpringBootServletInitializer {

    //HTTP port
//    @Value("${http.port}")
//    private int httpPort;

    public static void main(String[] args) {
        SpringApplication.run(RealestateApplication.class, args);
    }

    // Изначально приложение настроено на работы по https (все настройки только в app.prop)
    // Но для того, чтобы осталась поддержка http, сделаны следующие настройки:

//    @Bean
//    public ServletWebServerFactory servletContainer() {
//        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
//        tomcat.addAdditionalTomcatConnectors(createStandardConnector());
//        return tomcat;
//    }
//
//    private Connector createStandardConnector() {
//        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
//        connector.setPort(httpPort);
//        return connector;
//    }
}
