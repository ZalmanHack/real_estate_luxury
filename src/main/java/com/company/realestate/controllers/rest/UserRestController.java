package com.company.realestate.controllers.rest;

import com.company.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Locale;

@RestController
@RequestMapping("api/user")
public class UserRestController {

    @Autowired
    UserService userService;

    @GetMapping("/")
    public ResponseEntity<Object> all(Locale locale) {
        Pageable firstPageWithTwoElements = PageRequest.of(0, 2);
        return new ResponseEntity<>(userService.getAllPageDto(locale, firstPageWithTwoElements), HttpStatus.OK);
    }
}
