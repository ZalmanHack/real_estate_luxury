package com.company.realestate.controllers;

import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.services.CityService;
import com.company.realestate.services.PostService;
import com.company.realestate.services.UserService;
import com.sun.xml.bind.v2.TODO;
import javafx.geometry.Pos;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.Collections;
import java.util.Locale;

@Controller
@RequestMapping("/real_estate")
public class RealEstateController {

    @Autowired
    CityService cityService;

    @Autowired
    UserService userService;

    @Autowired
    PostService postService;

    @Autowired
    ModelMapper modelMapper;

    @GetMapping
    public String real_estate(Locale locale, Model model) {
        model.addAttribute("cities", cityService.getAllNames());
        model.addAttribute("companies", userService.getAllCompanies());
        model.addAttribute("max_price", postService.getMaxPrice());
        model.addAttribute("posts", postService.getActivePremiumPosts(locale));
        model.addAttribute("post_status", PostStatus.ACTIVE);
        return "realEstate";
    }


    //TODO Добавить проверку состояния поста. Давать доступ только при состоянии ACTIVE или владельцу поста

    @GetMapping("{post}/show")
    public String show(@PathVariable Post post, Locale locale, Model model) {
        model.addAttribute("post", postService.getDto(locale, post));
        return "realEstateShow";
    }

    @GetMapping("{post}/edit")
    @PreAuthorize("#authUser.id.equals(#post.author.id) && hasAuthority('USER')")
    public String new_post(@AuthenticationPrincipal User authUser,
                           @PathVariable Post post,
                           Locale locale, Model model) {
        return "editPost";
    }
}
