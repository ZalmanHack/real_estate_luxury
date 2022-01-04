package com.company.realestate.controllers.rest;

import com.company.realestate.assets.requestDtos.RequestFeedbackDto;
import com.company.realestate.services.RegistryFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@RestController
@RequestMapping("api/user")
public class UserRestController {

    @Autowired
    RegistryFeedbackService registryFeedbackService;

    @PostMapping("feedback")
    public ResponseEntity<Object> getByFilter(@RequestBody RequestFeedbackDto body) {
        return new ResponseEntity<>(null, registryFeedbackService.register(body)
                ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }
}
