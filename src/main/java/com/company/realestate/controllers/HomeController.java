package com.company.realestate.controllers;

import com.company.realestate.domains.User;
import com.company.realestate.repos.PostRepo;
import com.company.realestate.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Locale;

@Controller
public class HomeController {

    @Autowired
    UserRepo userRepo;

    @Autowired
    PostRepo postRepo;

    @GetMapping(value = {"/", "/home"})
    public String home(Locale locale, Model model) {
        System.out.println("Home: " + locale.getLanguage());
        System.out.println("HOME");

        Iterable<User> users = userRepo.findAll();
        for(User user : users) {
            System.out.println(user.toString());
        }
        return "home";
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        System.out.println("ADMIN");
        return "home";
    }

    @GetMapping("/test")
    public String test(Model model) {
        System.out.println("TEST");
        return "home";
    }
}
