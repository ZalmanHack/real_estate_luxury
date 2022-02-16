package com.company.realestate.controllers;

import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.services.AliasService;
import com.company.realestate.services.CityService;
import com.company.realestate.services.PostService;
import com.company.realestate.services.UserService;
import com.company.realestate.utils.ControllerUtils;
import com.company.realestate.utils.CustomSessionLocaleResolver;
import com.company.realestate.utils.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    CityService cityService;

    @Autowired
    PostService postService;

    @Autowired
    AliasService aliasService;

    @Autowired
    UserValidator userValidator;

    @Autowired
    CustomSessionLocaleResolver localeResolver;

    @GetMapping
    public String all() {
        throw new ResourceNotFoundException();
    }

    @GetMapping("{user}/show")
    public String user(@PathVariable User user, Locale locale, Model model) {
        model.addAttribute("posts_status", aliasService.getMappedAlias(PostStatus.values(), locale));
        model.addAttribute("cities", cityService.getAllNames());
        model.addAttribute("max_price", postService.getMaxPrice());
        return "profile";
    }

    @GetMapping("{user}/edit")
    @PreAuthorize("#authUser.id.equals(#user.id) && hasAuthority('USER')")
    public String userEdit(@AuthenticationPrincipal User authUser, @PathVariable User user, Locale locale, Model model) {
        return "profileEdit";
    }

    @PostMapping("{user}/change_info")
    @PreAuthorize("#authUser.id.equals(#user.id) && hasAuthority('USER')")
    public String changeInfo(@PathVariable User user, @AuthenticationPrincipal User authUser, @Valid User bodyUser, BindingResult bindingResult, Model model) {
        userValidator.validate(bodyUser, bindingResult);
        if(bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("user", bodyUser);
        }
        if(userService.updateInfoUser(bodyUser)) {
            model.addAttribute("success_message", aliasService.getAlias("infoMessage.changeUserInfo.success", localeResolver.getLastRequestLocale()));
        }
        if(userService.changeEmail(bodyUser)) {
            model.addAttribute("info_message", aliasService.getAlias("infoMessage.changeUserEmail", localeResolver.getLastRequestLocale()));
        }
        return "profileEdit";
    }

    @PostMapping(value = "{user}/change_password")
    @PreAuthorize("#authUser.id.equals(#user.id) && hasAuthority('USER')")
    public String changePassword(@AuthenticationPrincipal User authUser,
                                 @PathVariable User user,
                                 @RequestParam(name = "password", required = true, defaultValue = "") String password,
                                 Model model) {
        userService.changePassword(password, user);
        model.addAttribute("success_message", aliasService.getAlias("infoMessage.changeUserInfo.success", localeResolver.getLastRequestLocale()));
        return "profileEdit";
    }

    @GetMapping("/email/activate/{code}")
    public String activate(@PathVariable String code, Model model) {
        if(userService.activateEmailUser(code)) {
            model.addAttribute("success_message", aliasService.getAlias("infoMessage.activateCode.success", localeResolver.getLastRequestLocale()));
        } else {
            model.addAttribute("error_message", aliasService.getAlias("infoMessage.activateCode.fail", localeResolver.getLastRequestLocale()));
        }
        return "login";
    }
}
