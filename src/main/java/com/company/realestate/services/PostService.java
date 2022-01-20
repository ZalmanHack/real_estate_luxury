package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.PostDto;
import com.company.realestate.assets.domainDtos.PostImageDto;
import com.company.realestate.assets.domainDtos.PostShortDto;
import com.company.realestate.assets.requestDtos.RequestPostBodyDto;
import com.company.realestate.domains.Location;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.enums.RealEstateType;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.repos.PostRepo;
import com.company.realestate.utils.ControllerUtils;
import com.company.realestate.utils.FileUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class PostService {

    @Autowired
    PostRepo postRepo;

    @Autowired
    CityService cityService;

    @Autowired
    LocationService locationService;

    @Autowired
    PostImageService postImageService;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    LocalizedBodyService localizedBodyService;

    @Autowired
    FileUtils fileUtils;

    public List<PostDto> getActivePremiumPosts(Locale locale) {
        return postRepo.findAllByPostStatusAndPremium(PostStatus.ACTIVE, true)
                .stream()
                .map(post -> {
                    post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));
                    return modelMapper.map(post, PostDto.class);
                }).collect(Collectors.toList());

    }

    //TODO Добавить перевод состояния постов (уже есть в таблице Alias)

    public Page<PostDto> getByFilter(Locale locale, RequestPostBodyDto body) {
        PostStatus postStatus;
        try {
            postStatus = PostStatus.valueOf(body.getPostStatus());
        } catch (Exception e) {
            postStatus = PostStatus.ACTIVE;
        }
        Pageable pageable = PageRequest.of(body.getPage(), body.getSize());
        RealEstateType realEstateType = RealEstateType.get(body.getRealEstateType());
        Page<Post> posts;
        if(realEstateType == null) {
            posts = postRepo.findPostsWithPagination(
                    postStatus,
                    body.getCity(),
                    body.getCompanyName(),
                    body.getName(),
                    body.getPriceFrom(),
                    body.getPriceTo(),
                    pageable);
        } else {
            posts = postRepo.findPostsWithPagination(
                    postStatus,
                    body.getCity(),
                    body.getCompanyName(),
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
        return post.getMainVideo();
    }

    public Post createPost(User authUser) {
        Post post = new Post();
        post.setPublicationDate(LocalDate.now());
        post.setAuthor(authUser);
        post.setLocation(locationService.createLocation(post.getPublicationDate().toString()));
        post.setPostStatus(PostStatus.DISABLED);
        post.setRealEstateType(RealEstateType.APARTMENT);
        postRepo.save(post);
        localizedBodyService.createNewWithDefaultLanguage(post);
        return post;
    }

    public File loadImage(MultipartFile rawImg) {
        return fileUtils.createFileImg(rawImg);
    }

    public PostImageDto addImage(Post post, MultipartFile rawImg) {
        File img = loadImage(rawImg);
        if (img == null) {
            return null;
        }
        PostImage postImage = postImageService.createImage(img, post);
        if (postImageService.findFirstByPost(post).equals(postImage)) {
            post.setMainImage(postImage.getImage());
            postRepo.save(post);
        }
        return modelMapper.map(postImage, PostImageDto.class);
    }

    public boolean delImage(Post post, long imgId) {
        PostImage postImage = postImageService.findFirstById(imgId);
        if(postImage == null) {
            return false;
        }
        if (!postImage.getPost().equals(post)) {
            return false;
        }
        if(post.getMainImage().equals(postImage.getImage())) {
            post.setMainImage(null);
        }
        if(!fileUtils.deleteFile(postImage.getImage())) {
            return false;
        }
        postImageService.delete(postImage);
        return true;
    }

    public void updateUser(PostShortDto postDto) {
        Post post = modelMapper.map(postDto, Post.class);
        Location location = locationService.findFirstByName(postDto.getLocationCityValue());
        System.out.println(post);
    }
}
