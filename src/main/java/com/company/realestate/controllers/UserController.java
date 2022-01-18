package com.company.realestate.controllers;

import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.services.CityService;
import com.company.realestate.services.PostService;
import com.company.realestate.services.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import java.util.Locale;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    CityService cityService;

    @Autowired
    PostService postService;

    @GetMapping("{user}")
    public String user(@AuthenticationPrincipal User authUser, @PathVariable User user, Locale locale, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("posts_status", PostStatus.values());
        model.addAttribute("cities", cityService.getAllNames());
        model.addAttribute("max_price", postService.getMaxPrice());
        return "profile";
    }
}
