package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.PostDto;
import com.company.realestate.assets.domainDtos.PostRegistryDto;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.registries.PostRegistry;
import com.company.realestate.repos.PostRegistryRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Service
public class PostRegistryService {

    @Autowired
    PostRegistryRepo postRegistryRepo;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    EmailSenderService emailSenderService;

    @Autowired
    UserService userService;

    @Value("${host.name}")
    private String hostName;

    public List<PostRegistryDto> getAllDto(Locale locale) {
        return postRegistryRepo.findAllOrderByIdDesc()
                .stream()
                .map(postRegistry -> modelMapper.map(postRegistry, PostRegistryDto.class))
                .collect(Collectors.toList());
    }

    public void save(Post post) {
        PostRegistry postRegistry = new PostRegistry();
        postRegistry.setPost(post);
        postRegistry.setChangePostStatus(post.getPostStatus());
        postRegistry.setChangeDate(LocalDate.now());
        System.out.println(postRegistry);
        postRegistryRepo.save(postRegistry);
        sendEmailOfChangePostStatus(post);
    }

    public void sendEmailOfChangePostStatus(Post post) {
        String message = String.format(
                "<html lang=\"en\">\n" +
                        "<head>\n" +
                        "<meta charset=\"UTF-8\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<p>Hello, %s!</p>\n" +
                        "<p>The status of your post \"%s\" has been changed to: %s.</p>\n" +
                        "<p>Best regards, administration of %s.</p>" +
                        "</body>\n" +
                        "</html>",
                post.getAuthor().getUsername(), post.getName(), post.getPostStatus().name(), hostName);
        emailSenderService.send(post.getAuthor().getEmail(), "Post status change", message);

        if (post.getPostStatus().equals(PostStatus.MODERATED)) {
            String adminMessage = String.format(
                    "<html lang=\"en\">\n" +
                            "<head>\n" +
                            "<meta charset=\"UTF-8\">\n" +
                            "</head>\n" +
                            "<body>\n" +
                            "<p>User %s sent the post \"%s\" with id %s for moderation.</p>\n" +
                            "<p>%s.</p>" +
                            "</body>\n" +
                            "</html>",
                    post.getAuthor().getUsername(), post.getName(), post.getId(), hostName);
            userService.getAll()
                    .stream()
                    .filter(User::isAdmin)
                    .forEach(admin -> emailSenderService.send(admin.getEmail(), "Post moderation", adminMessage));
        }
    }
}
