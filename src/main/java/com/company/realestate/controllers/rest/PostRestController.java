package com.company.realestate.controllers.rest;

import com.company.realestate.services.LocaleCodeService;
import com.company.realestate.services.LocalizedBodyService;
import com.company.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Locale;

@RestController
@RequestMapping("api/post")
public class PostRestController {

    @Autowired
    LocalizedBodyService localizedBodyService;

    @Autowired
    LocaleCodeService localeCodeService;

    @Autowired
    UserService userService;

    @GetMapping("all")
    public ResponseEntity<Object> all(Locale locale) {
//        return new ResponseEntity<>(
//                localizedBodyService.getAll(localeCodeService.get(locale.getLanguage().toLowerCase(Locale.ROOT))),
//                HttpStatus.OK);

        return new ResponseEntity<>(userService.getAllDto(locale), HttpStatus.OK);
    }
}
