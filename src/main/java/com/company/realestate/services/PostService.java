package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.PostDto;
import com.company.realestate.assets.requestDtos.RequestPostBodyDto;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.enums.RealEstateType;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.repos.PostRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Service
public class PostService {

    @Autowired
    PostRepo postRepo;

    @Autowired
    CityService cityService;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    LocalizedBodyService localizedBodyService;

    public List<PostDto> getActivePremiumPosts(Locale locale) {
        List<PostDto> result = postRepo.findAllByPostStatusAndPremium(PostStatus.ACTIVE, true)
                .stream()
                .map(post -> {
                    post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));
                    return modelMapper.map(post, PostDto.class);
                }).collect(Collectors.toList());
        System.out.println("-----");
        System.out.println(result.get(0).getLocalizedBodies());
        return result;

    }

    public Page<PostDto> getByFilter(Locale locale, RequestPostBodyDto body) {
        Pageable pageable = PageRequest.of(body.getPage(), body.getSize());
        RealEstateType realEstateType = RealEstateType.get(body.getRealEstateType());

        System.out.println(body);

        Page<Post> posts;
        if(realEstateType == null) {
            posts = postRepo.findPostsWithPagination(
                    PostStatus.ACTIVE,
                    body.getCity(),
                    body.getName(),
                    body.getPriceFrom(),
                    body.getPriceTo(),
                    pageable);
        } else {
            posts = postRepo.findPostsWithPagination(
                    PostStatus.ACTIVE,
                    body.getCity(),
                    realEstateType,
                    body.getName(),
                    body.getPriceFrom(),
                    body.getPriceTo(),
                    pageable);
        }

        return new PageImpl<>(posts
                .getContent()
                .stream()
                .map(post -> {
                    post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));
                    return modelMapper.map(post, PostDto.class);
                })
                .collect(Collectors.toList()), pageable, posts.getTotalElements());
    }

    public PostDto getDto (Locale locale, Post post) {
        post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));
        return modelMapper.map(post, PostDto.class);
    }

    public Long getMaxPrice() {
        return postRepo.findMaxPrice();
    };

    public Object getMainVideo(Post post) {
        return post.getMainVideo().getVideo();
    }
}
