package com.company.realestate.controllers.rest;

import com.company.realestate.assets.domainDtos.PostImageDto;
import com.company.realestate.assets.domainDtos.PostShortDto;
import com.company.realestate.assets.requestDtos.RequestDelImage;
import com.company.realestate.assets.requestDtos.RequestPostBodyDto;
import com.company.realestate.assets.responseDtos.ResponseUrl;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.services.LocaleCodeService;
import com.company.realestate.services.LocalizedBodyService;
import com.company.realestate.services.PostService;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Locale;

@RestController
@RequestMapping("api/posts")
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

    @PostMapping("new_post")
    @PreAuthorize("hasAuthority('USER')")
    public ResponseEntity<Object> newPost(@AuthenticationPrincipal User authUser, Locale locale) {
        ResponseUrl responseUrl = new ResponseUrl();
        responseUrl.setUrl("/real_estate/" + postService.createPost(authUser).getId() + "/edit");
        return new ResponseEntity<>(responseUrl, HttpStatus.OK);
    }


    //TODO Добавить проверку на доступ к добавлению картинок

    @PostMapping("{post}/add_img")
    @PreAuthorize("#authUser.id.equals(#post.author.id) && hasAuthority('USER')")
    public ResponseEntity<Object> addImage(@AuthenticationPrincipal User authUser,
                                           @PathVariable Post post,
                                           @RequestParam(name = "img") MultipartFile rawImg) {
        PostImageDto postImageDto = postService.addImage(post, rawImg);
        if(postImageDto == null) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(postImageDto, HttpStatus.OK);
    }

    //TODO Добавить проверку на доступ к удалению картинок

    @PostMapping("{post}/del_img")
    @PreAuthorize("#authUser.id.equals(#post.author.id) && hasAuthority('USER')")
    public ResponseEntity<Object> delImage(@AuthenticationPrincipal User authUser,
                                           @PathVariable Post post,
                                           @RequestBody RequestDelImage requestDelImage) {
        if(!postService.delImage(post, requestDelImage.getImgId())) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(null, HttpStatus.OK);
    }


    @GetMapping("{post}/main_video")
    public ResponseEntity<Object> getByFilter(@PathVariable Post post) {
        return new ResponseEntity<>(postService.getMainVideo(post), HttpStatus.OK);
    }

    @PostMapping("{post}/save")
    @PreAuthorize("#authUser.id.equals(#post.author.id) && hasAuthority('USER')")
    public ResponseEntity<Object> save(@AuthenticationPrincipal User authUser,
                                           @PathVariable Post post,
                                           @RequestBody PostShortDto postDto) {
        if(!postService.updateUser(postDto)) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @PostMapping("{post}/disable")
    @PreAuthorize("#authUser.id.equals(#post.author.id) && hasAuthority('USER')")
    public ResponseEntity<Object> disable(@AuthenticationPrincipal User authUser,
                                           @PathVariable Post post) {
        postService.setPostStatus(post, PostStatus.DISABLED);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @PostMapping("{post}/sold_out")
    @PreAuthorize("#authUser.id.equals(#post.author.id) && hasAuthority('USER')")
    public ResponseEntity<Object> soldOut(@AuthenticationPrincipal User authUser,
                                           @PathVariable Post post) {
        postService.setPostStatus(post, PostStatus.SOLD_OUT);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
