package com.company.realestate.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealEstateController {

    @GetMapping("/real_estate")
    public String real_estate(Model model) {
        System.out.println("realEstate");
        return "realEstate";
    }
}
