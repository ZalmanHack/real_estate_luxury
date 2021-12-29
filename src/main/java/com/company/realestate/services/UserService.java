package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.UserDto;
import com.company.realestate.domains.User;
import com.company.realestate.repos.UserRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    UserRepo userRepo;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    LocalizedBodyService localizedBodyService;

    //TODO вынести преобразование в TDO в отдельный класс UTILS

    public List<UserDto> getAllDto(Locale locale) {
        return userRepo.findAll()
                .stream()
                .map(user -> {
                    user.getPosts().forEach(post -> {
                        post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));
                    });
                    return modelMapper.map(user, UserDto.class);
                })
                .collect(Collectors.toList());

//        return  userRepo.findAll().stream().map(user -> modelMapper.map(user, UserDto.class)).collect(Collectors.toList());
    }

    public Page<UserDto> getAllPageDto(Locale locale, Pageable pageable) {
        Page<User> users = userRepo.findAll(pageable);
        return new PageImpl<>(users
                .getContent()
                .stream()
                .map(user -> {
                    user.getPosts().forEach(post ->
                            post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post)))));
                    return modelMapper.map(user, UserDto.class);
                }).collect(Collectors.toList()), pageable, users.getTotalElements());
    }
}
