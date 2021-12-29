package com.company.realestate.utils;

import jdk.nashorn.internal.parser.JSONParser;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

// Переопределил метод для того, чтобы при получении Locale в Controller(s) возвращалась не просто
// переданная браузером локаль, а в том числе и проверенная на поддерживаемые локали
// и в случае отстутствия поддержки, назначалась дефолтная, которая назначена в InternationalizationConfig

// Работает в коллаборации с messageSource и LocaleChangeInterceptor (назначен в InternationalizationConfig)
// Он же управляет messages.properties

@Component
public class CustomSessionLocaleResolver extends SessionLocaleResolver {

    @Value("${language.default}")
    private String languageDefault;

    private List<Locale> LOCALES;

    // Использовать при необходимости что-либо локализировать, когда нет возможности обратиться к самому телу запроса
    // Используется:
    // - для преобразования в DTO
    @Getter
    private Locale lastRequestLocale;

    public List<Locale> getLocales() {
        return LOCALES;
    }

    public void setLocales(List<Locale> Locales) {
        LOCALES = Locales;
    }

    @NonNull
    @Override
    public Locale resolveLocale(@NonNull HttpServletRequest request) {
        // Если запрашиваемая пользователем (в GET запросе) поддерживается, то возвращаем её иначе куки
        Locale requiredLocale = super.resolveLocale(request);
        // Если есть поддержка этого языка то возвращаем его
        if(LOCALES != null && LOCALES.stream().anyMatch(locale -> requiredLocale.getLanguage().equals(locale.getLanguage()))) {
            lastRequestLocale = requiredLocale;
            return requiredLocale;
        } else {
            // иначе возвращаем тот язык, который стоит дефолтны для проперти
            // Задавать дефолтный язык для класса НЕЛЬЗЯ, тогда не будет работать автоопределение языка из заголовка
            lastRequestLocale = new Locale(languageDefault);
        }
        return lastRequestLocale;
    }
}