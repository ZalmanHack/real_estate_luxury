package com.company.realestate.services;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.User;
import com.company.realestate.domains.posts.LocalizedBody;
import com.company.realestate.dtos.UserDto;
import com.company.realestate.repos.LocalizedBodyRepo;
import com.company.realestate.repos.UserRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
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
}
