package com.company.realestate.controllers.rest;

import com.company.realestate.assets.requestDtos.RequestPostBodyDto;
import com.company.realestate.services.LocaleCodeService;
import com.company.realestate.services.LocalizedBodyService;
import com.company.realestate.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@RestController
@RequestMapping("api/post")
public class PostRestController {

    @Autowired
    LocalizedBodyService localizedBodyService;

    @Autowired
    LocaleCodeService localeCodeService;

    @Autowired
    PostService postService;

    @PostMapping
    public ResponseEntity<Object> getByFilter(@RequestBody RequestPostBodyDto body, Locale locale) {
        return new ResponseEntity<>(postService.getByFilter(locale, body), HttpStatus.OK);
    }
}
