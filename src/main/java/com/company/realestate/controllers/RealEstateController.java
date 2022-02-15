package com.company.realestate.controllers;

import com.company.realestate.assets.domainDtos.LocalizedBodyDto;
import com.company.realestate.assets.domainDtos.PostShortDto;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.posts.LocalizedBody;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.services.CityService;
import com.company.realestate.services.LocalizedBodyService;
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
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

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
    LocalizedBodyService localizedBodyService;

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
    @PreAuthorize("(#authUser.id.equals(#post.author.id) && hasAuthority('USER')) || hasAuthority('ADMIN')")
    public String new_post(@AuthenticationPrincipal User authUser,
                           @PathVariable Post post,
                           Locale locale, Model model) {

        List<LocalizedBodyDto> bodyDtoList = localizedBodyService.getAll(post)
                .stream()
                .map(localizedBody -> modelMapper.map(localizedBody, LocalizedBodyDto.class))
                .collect(Collectors.toList());
        model.addAttribute("localizedBodies", bodyDtoList);
        model.addAttribute("realEstateType", post.getRealEstateType());
        model.addAttribute("post", modelMapper.map(post, PostShortDto.class));
        model.addAttribute("cities", cityService.getAllNames());
        return "editPost";
    }
}
