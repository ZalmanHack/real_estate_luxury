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
    @GetMapping(value = {"/", "/home"})
    public String home() {
        return "home";
    }
}
