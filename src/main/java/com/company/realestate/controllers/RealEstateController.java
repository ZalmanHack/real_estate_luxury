package com.company.realestate.controllers;

import com.company.realestate.assets.requestDtos.RequestPostBody;
import com.company.realestate.domains.City;
import com.company.realestate.services.CityService;
import com.company.realestate.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealEstateController {

    @Autowired
    CityService cityService;

    @Autowired
    PostService postService;

    @GetMapping("/real_estate")
    public String real_estate(Model model) {
        model.addAttribute("cities", cityService.getAllNames());
        model.addAttribute("max_price", postService.getMaxPrice());
        return "realEstate";
    }
}
