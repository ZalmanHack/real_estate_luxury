package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.PostDto;
import com.company.realestate.assets.domainDtos.PostImageDto;
import com.company.realestate.assets.requestDtos.RequestPostBodyDto;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.enums.RealEstateType;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.repos.PostRepo;
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

    @Value("${upload.path}")
    String uploadPath;

    @Value("${upload.path.img}")
    private String pathImg;

    @Autowired
    LocalizedBodyService localizedBodyService;

    public List<PostDto> getActivePremiumPosts(Locale locale) {
        List<PostDto> result = postRepo.findAllByPostStatusAndPremium(PostStatus.ACTIVE, true)
                .stream()
                .map(post -> {
                    post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));
                    return modelMapper.map(post, PostDto.class);
                }).collect(Collectors.toList());
        return result;

    }

    //TODO Добавить перевод состояния постов (уже есть в таблице Alias)

    public Page<PostDto> getByFilter(Locale locale, RequestPostBodyDto body) {
        System.out.println("-=----=--=-=-=-=-=--=-=-=-=-=-=-=");
        System.out.println(body);
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
        postRepo.save(post);
        localizedBodyService.createNewWithDefaultLanguage(post);
        return post;
    }

    public File loadImage(MultipartFile rawImg) {
        try {
            if (rawImg != null &&
                    rawImg.getOriginalFilename() != null &&
                    !rawImg.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath + pathImg);
                if(!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFileName = uuidFile;
                // загружаем файл
                File img = new File(uploadDir.getPath() + "/" + resultFileName);
                rawImg.transferTo(img);
                return img;
            }
            return null;
        } catch (IOException e) {
            return null;
        }
    }

    public PostImageDto addImage(User authUser, Post post, MultipartFile rawImg) {
        File img = loadImage(rawImg);
        if (img == null) {
            return null;
        }
        return modelMapper.map(postImageService.createImage(img, post), PostImageDto.class);
    }

    public boolean delImage(User authUser, Post post, long imgId) {
        return postImageService.delImage(post, imgId);
    }
}
