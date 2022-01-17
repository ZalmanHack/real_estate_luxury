package com.company.realestate.controllers;

import com.company.realestate.domains.User;
import com.company.realestate.services.AliasService;
import com.company.realestate.services.UserService;
import com.company.realestate.utils.ControllerUtils;
import com.company.realestate.utils.CustomSessionLocaleResolver;
import com.company.realestate.utils.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

    @Autowired
    UserValidator userValidator;

    @Autowired
    UserService userService;

    @Autowired
    AliasService aliasService;

    @Autowired
    CustomSessionLocaleResolver localeResolver;

    @GetMapping
    public String registration() {
        return "registration";
    }

    @PostMapping
    public String addUser(@Valid User user, BindingResult bindingResult, Model model) {
        userValidator.validate(user, bindingResult);
        if(bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("user", user);
            return "registration";
        }
        userService.addUser(user);
        model.addAttribute("info_message",
                String.format(
                        aliasService.getAlias("infoMessage.login.activationCode", localeResolver.getLastRequestLocale()),
                        user.getUsername(), user.getEmail()));
        return "login";
    }

    @GetMapping("/activate/{code}")
    public String activate(@PathVariable String code, Model model) {
        if(userService.activateUser(code)) {
            model.addAttribute("success_message", aliasService.getAlias("infoMessage.activateCode.success", localeResolver.getLastRequestLocale()));
        } else {
            model.addAttribute("error_message", aliasService.getAlias("infoMessage.activateCode.fail", localeResolver.getLastRequestLocale()));
        }
        return "login";
    }
}
