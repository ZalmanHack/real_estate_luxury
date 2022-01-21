package com.company.realestate.controllers.rest;

import com.company.realestate.assets.domainDtos.PostImageDto;
import com.company.realestate.assets.requestDtos.RequestFeedbackDto;
import com.company.realestate.domains.User;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.services.RegistryFeedbackService;
import com.company.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Locale;

@RestController
@RequestMapping("api/users")
public class UserRestController {

    @Autowired
    RegistryFeedbackService registryFeedbackService;

    @Autowired
    UserService userService;

    @PostMapping("feedback")
    public ResponseEntity<Object> getByFilter(@RequestBody RequestFeedbackDto body) {
        return new ResponseEntity<>(null, registryFeedbackService.register(body)
                ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

    @PostMapping("{user}/change_profile_img")
    @PreAuthorize("#authUser.id.equals(#user.id) && hasAuthority('USER')")
    public ResponseEntity<Object> addImage(@AuthenticationPrincipal User authUser,
                                           @PathVariable User user,
                                           @RequestParam(name = "img") MultipartFile rawImg) {
        if(!userService.changeProfileImage(user, rawImg)) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
