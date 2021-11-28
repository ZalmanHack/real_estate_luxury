package com.company.realestate.utils;

import jdk.nashorn.internal.parser.JSONParser;
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

public class CustomSessionLocaleResolver extends SessionLocaleResolver {

    private List<Locale> LOCALES;

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
            return requiredLocale;
        }
        // иначе возвращаем тот язык, который стоит дефолтны для проперти
        // Задавать дефолтный язык для класса НЕЛЬЗЯ, тогда не будет работать автоопределение языка из заголовка
        return new Locale("en");
    }
}