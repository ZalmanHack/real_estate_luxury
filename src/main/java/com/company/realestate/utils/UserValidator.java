package com.company.realestate.utils;

import com.company.realestate.domains.User;
import com.company.realestate.repos.UserRepo;
import com.company.realestate.services.AliasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.Optional;

@Component
public class UserValidator implements Validator {

    @Autowired
    UserRepo userRepo;

    @Autowired
    AliasService aliasService;

    @Autowired
    CustomSessionLocaleResolver localeResolver;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        if(userRepo.findFirstByUsername(user.getUsername()).isPresent()) {
            errors.rejectValue("username", "", aliasService.getAlias("username.invalid.alreadyExist", localeResolver.getLastRequestLocale()));
        }
        if(userRepo.findFirstByEmail(user.getEmail()).isPresent()) {
            errors.rejectValue("email", "", aliasService.getAlias("email.invalid.alreadyExist", localeResolver.getLastRequestLocale()));
        }
    }
}
