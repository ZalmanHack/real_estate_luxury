package com.company.realestate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;
import java.util.Map;

@Controller
public class HomeController {

    @GetMapping(value = {"/", "/home"})
    public String home(Locale locale, Map<String, Object> model) {
        System.out.println("Home: " + locale.getLanguage());
        System.out.println("HOME");
        return "home";
    }

    @GetMapping("/admin")
    public String admin(Map<String, Object> model) {
        System.out.println("ADMIN");
        return "home";
    }

    @GetMapping("/test")
    public String test(Map<String, Object> model) {
        System.out.println("TEST");
        return "home";
    }
}
