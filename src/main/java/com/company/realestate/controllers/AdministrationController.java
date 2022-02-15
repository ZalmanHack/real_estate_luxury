package com.company.realestate.controllers;

import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.services.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

@Controller
@RequestMapping("/administration")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdministrationController {

    @Autowired
    CityService cityService;

    @Autowired
    UserService userService;

    @Autowired
    PostRegistryService postRegistryService;

    @Autowired
    PostService postService;

    @Autowired
    LocalizedBodyService localizedBodyService;

    @Autowired
    ModelMapper modelMapper;

    @GetMapping(value = {"", "posts"})
    public String showPostRegistry(Locale locale, Model model) {
        model.addAttribute("posts_history", postRegistryService.getAllDto(locale));
        model.addAttribute("posts_moderated", postService.getByPostStatusDto(PostStatus.MODERATED, locale));
        model.addAttribute("posts_rejected", postService.getByPostStatusDto(PostStatus.REJECTED, locale));
        return "showPostRegistry";
    }
}
