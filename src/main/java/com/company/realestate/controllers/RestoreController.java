package com.company.realestate.controllers;

import com.company.realestate.services.AliasService;
import com.company.realestate.services.UserService;
import com.company.realestate.utils.CustomSessionLocaleResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/restore")
public class RestoreController {

    @Autowired
    UserService userService;

    @Autowired
    CustomSessionLocaleResolver localeResolver;

    @Autowired
    AliasService aliasService;

    @GetMapping("/password")
    public String checkMail() {
        return "passwordRestore";
    }

    @PostMapping("/password")
    public String sendMail(@RequestParam(name = "email", required = true, defaultValue = "") String email, Model model) {
        if(userService.activateChangePassword(email)) {
            model.addAttribute("info_message",
                    String.format(aliasService.getAlias("infoMessage.restorePasswordCode.success", localeResolver.getLastRequestLocale()), email));
            return "login";
        }
        model.addAttribute("error_message", aliasService.getAlias("infoMessage.restorePasswordCode.fail", localeResolver.getLastRequestLocale()));
        return "passwordRestore";
    }

    @GetMapping("/password/change")
    public String changePassword(@RequestParam(name = "code", required = true, defaultValue = "") String code, Model model) {
        if (userService.checkChangePasswordCode(code)) {
            model.addAttribute("code", code);
            return "passwordChange";
        }
        model.addAttribute("error_message", aliasService.getAlias("infoMessage.changePassword.fail", localeResolver.getLastRequestLocale()));
        return "login";
    }

    @PostMapping("/password/change")
    public String savePassword(@RequestParam(name = "code", required = true, defaultValue = "") String code,
                               @RequestParam(name = "password", required = true, defaultValue = "") String password,
                               Model model) {
        if(!userService.changePasswordByCode(password, code)) {
            model.addAttribute("error_message", aliasService.getAlias("infoMessage.changePassword.fail", localeResolver.getLastRequestLocale()));
            return "passwordChange";
        }
        model.addAttribute("success_message", aliasService.getAlias("infoMessage.changePassword.success", localeResolver.getLastRequestLocale()));
        return "login";
    }
}
