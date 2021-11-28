package com.company.realestate.configs;

import com.company.realestate.utils.CustomSessionLocaleResolver;
import com.company.realestate.utils.LocaleHandlerInterceptor;
import freemarker.template.utility.XmlEscape;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.util.*;

@Configuration
public class InternationalizationConfig implements WebMvcConfigurer {

    @Bean("messageSource")
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasenames("languages/messages");
        messageSource.setDefaultEncoding("UTF-8");
        // вкл\выкл автоматическое задание языка == языку сервера
        // вместо этого будет использоваться язык из messages.properties
        messageSource.setFallbackToSystemLocale(false);
        return messageSource;
    }

    @Bean
    public LocaleResolver localeResolver() {
        CustomSessionLocaleResolver localeResolver = new CustomSessionLocaleResolver();
//        localeResolver.setDefaultLocale(Locale.ENGLISH);
        localeResolver.setLocales(Arrays.asList(
                new Locale("en"),
                new Locale("ru"),
                new Locale("es")));
        return localeResolver;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("language");
        return localeChangeInterceptor;
    }

    @Bean
    public LocaleHandlerInterceptor localeHandlerInterceptor() {
        return new LocaleHandlerInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
        registry.addInterceptor(localeHandlerInterceptor());
    }
}
