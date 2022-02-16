package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.PostImageDto;
import com.company.realestate.assets.domainDtos.UserDto;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.Role;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.repos.UserRepo;
import com.company.realestate.utils.CustomSessionLocaleResolver;
import com.company.realestate.utils.FileUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    UserRepo userRepo;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    LocalizedBodyService localizedBodyService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    EmailSenderService emailSender;

    @Autowired
    AliasService aliasService;

    @Autowired
    CustomSessionLocaleResolver localeResolver;

    @Autowired
    FileUtils fileUtils;

    @Value("${upload.path.img}")
    private String pathImg;

    @Value("${host.name}")
    String hostName;

    //TODO вынести преобразование в TDO в отдельный класс UTILS

    public List<UserDto> getAllDto(Locale locale) {
        return userRepo.findAll()
                .stream()
                .map(user -> {
                    user.getPosts().forEach(post -> {
                        post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post))));
                    });
                    return modelMapper.map(user, UserDto.class);
                }).collect(Collectors.toList());
    }

    public Page<UserDto> getAllPageDto(Locale locale, Pageable pageable) {
        Page<User> users = userRepo.findAll(pageable);
        return new PageImpl<>(users
                .getContent()
                .stream()
                .map(user -> {
                    user.getPosts().forEach(post -> post.setLocalizedBodies(new ArrayList<>(Collections.singletonList(localizedBodyService.get(locale, post)))));
                    return modelMapper.map(user, UserDto.class);
                }).collect(Collectors.toList()), pageable, users.getTotalElements());
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> person = userRepo.findFirstByUsername(username);
        return person.orElse(null);
    }

    public void addUser(User user) {
        if (userRepo.findFirstByUsername(user.getUsername()).isPresent()) {
            return;
        }
        if (userRepo.findFirstByEmail(user.getUsername()).isPresent()) {
            return;
        }
        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
        if (!user.getEmail().isEmpty()) {
            String title = aliasService.getAlias("email.activationCode.title", localeResolver.getLastRequestLocale());
            String message = String.format(
                    aliasService.getAlias("email.activationCode.body", localeResolver.getLastRequestLocale()),
                    user.getUsername(), hostName, hostName, user.getActivationCode());
            emailSender.send(user.getEmail(), title, message);
        }
    }

    public boolean activateUser(String code) {
        Optional<User> userDb = userRepo.findByActivationCode(code);
        if (!userDb.isPresent()) {
            return false;
        }
        User user = userDb.get();
        user.setActive(true);
        user.setActivationCode(null);
        userRepo.save(user);
        return true;
    }

    public boolean activateChangePassword(String email) {
        Optional<User> userDb = userRepo.findFirstByEmail(email);
        if (!userDb.isPresent()) {
            return false;
        }
        if (userDb.get().getEmail().isEmpty()) {
            return false;
        }
        User user = userDb.get();
        user.setRestorePasswordCode(UUID.randomUUID().toString());
        userRepo.save(user);
        String title = aliasService.getAlias("email.restorePasswordCode.title", localeResolver.getLastRequestLocale());
        String message = String.format(
                aliasService.getAlias("email.restorePasswordCode.body", localeResolver.getLastRequestLocale()),
                user.getUsername(), hostName, user.getRestorePasswordCode());
        emailSender.send(user.getEmail(), title, message);
        return true;
    }

    public boolean changePasswordByCode(String password, String code) {
        if(password.length() < 8 || password.length() > 24) {
            return false;
        }
        Optional<User> userDb = userRepo.findFirstByRestorePasswordCode(code);
        if (!userDb.isPresent()) {
            return false;
        }
        User user = userDb.get();
        user.setPassword(passwordEncoder.encode(password));
        user.setRestorePasswordCode(null);
        userRepo.save(user);
        return true;
    }

    public boolean checkChangePasswordCode(String code) {
        return userRepo.findFirstByRestorePasswordCode(code).isPresent();
    }

    public List<String> getAllCompanies() {
        return userRepo.findAllCompanyNamesUnique();
    }

    public boolean changeProfileImage(User user, MultipartFile rawImg) {
        File img = fileUtils.createFileImg(rawImg);
        if (img == null) {
            return false;
        }
        user.setProfileImage(pathImg + "/" + img.getName());
        userRepo.save(user);
        return true;
    }

    public List<User> getAll() {
        return userRepo.findAll();
    }

    public boolean updateInfoUser(User user) {
        Optional<User> userDb = userRepo.findFirstById(user.getId());
        if(!userDb.isPresent()) {
            return false;
        }
        User newInfoUser = userDb.get();
        newInfoUser.setFirstName(user.getFirstName());
        newInfoUser.setLastName(user.getLastName());
        newInfoUser.setCompanyName(user.getCompanyName());
        newInfoUser.setPhone(user.getPhone());
        newInfoUser.setUsername(user.getUsername());
        userRepo.save(newInfoUser);
        return true;
    }

    public boolean changeEmail(User user) {
        if(user.getNewEmail().isEmpty() || user.getEmail().equals(user.getNewEmail())) {
            return false;
        }

        user.setActivationCode(UUID.randomUUID().toString());
        userRepo.save(user);

        String title = aliasService.getAlias("email.changeActivationCode.title", localeResolver.getLastRequestLocale());
        String message = String.format(
                aliasService.getAlias("email.changeActivationCode.body", localeResolver.getLastRequestLocale()),
                user.getUsername(), hostName, user.getActivationCode());
        emailSender.send(user.getNewEmail(), title, message);
        return true;
    }

    public boolean activateEmailUser(String code) {
        Optional<User> userDb = userRepo.findByActivationCode(code);
        if (!userDb.isPresent()) {
            return false;
        }
        User user = userDb.get();
        user.setActivationCode(null);
        user.setEmail(user.getNewEmail());
        user.setNewEmail(null);
        userRepo.save(user);
        return true;
    }

    public void changePassword(String password, User user) {
        user.setPassword(passwordEncoder.encode(password));
        userRepo.save(user);
    }
}
