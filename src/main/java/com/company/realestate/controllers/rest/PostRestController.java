package com.company.realestate.controllers.rest;

import com.company.realestate.assets.requestDtos.RequestPostBody;
import com.company.realestate.services.LocaleCodeService;
import com.company.realestate.services.LocalizedBodyService;
import com.company.realestate.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    public ResponseEntity<Object> getByFilter(@RequestBody RequestPostBody body, Locale locale) {
        System.out.println(body);
        Pageable firstPageWithTwoElements = PageRequest.of(body.getPage(), body.getSize());
        return new ResponseEntity<>(postService.getByFilter(locale, firstPageWithTwoElements), HttpStatus.OK);
    }
}
