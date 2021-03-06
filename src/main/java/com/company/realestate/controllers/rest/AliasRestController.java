package com.company.realestate.controllers.rest;

import com.company.realestate.services.AliasService;
import com.company.realestate.services.LocaleCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Locale;

@RestController
@RequestMapping("api/aliases")
public class AliasRestController {

    @Autowired
    AliasService aliasService;

    @Autowired
    LocaleCodeService localeCodeService;

    @GetMapping("/all")
    public ResponseEntity<Object> all(Locale locale) {
        return new ResponseEntity<>(aliasService.getAliasesDto(locale), HttpStatus.OK);
    }
}
