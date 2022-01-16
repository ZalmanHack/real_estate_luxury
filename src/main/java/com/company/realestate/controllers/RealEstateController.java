package com.company.realestate.controllers;

import com.company.realestate.domains.posts.Post;
import com.company.realestate.services.CityService;
import com.company.realestate.services.PostService;
import com.sun.xml.bind.v2.TODO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

@Controller
@RequestMapping("/real_estate")
public class RealEstateController {

    @Autowired
    CityService cityService;

    @Autowired
    PostService postService;

    @Autowired
    ModelMapper modelMapper;

    @GetMapping
    public String real_estate(Locale locale, Model model) {
        model.addAttribute("cities", cityService.getAllNames());
        model.addAttribute("max_price", postService.getMaxPrice());
        model.addAttribute("posts", postService.getActivePremiumPosts(locale));
        System.out.println(postService.getActivePremiumPosts(locale));
        return "realEstate";
    }


    //TODO Добавить проверку состояния поста. Давать доступ только при состоянии ACTIVE или владельцу поста

    @GetMapping("{post}/show")
    public String show(@PathVariable Post post, Locale locale, Model model) {
        model.addAttribute("post", postService.getDto(locale, post));
        System.out.println(post);
        return "realEstateShow";
    }
}
