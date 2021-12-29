package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.PostDto;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.repos.PostRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;
import java.util.stream.Collectors;

@Service
public class PostService {

    @Autowired
    PostRepo postRepo;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    LocalizedBodyService localizedBodyService;

    public Page<PostDto> getByFilter(Locale locale, Pageable pageable) {
        Page<Post> posts = postRepo.findAll(pageable);
        return new PageImpl<>(posts
                .getContent()
                .stream()
                .map(post -> {
                    post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));

                    return modelMapper.map(post, PostDto.class);
                })
                .collect(Collectors.toList()), pageable, posts.getTotalElements());
    }
}
