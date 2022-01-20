package com.company.realestate.services;

import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.repos.PostImageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

@Service
public class PostImageService {

    @Autowired
    PostImageRepo postImageRepo;

    @Value("${upload.path.img}")
    private String pathImg;

    public PostImage createImage(File file, Post post) {
        PostImage postImage = new PostImage();
        postImage.setImage(pathImg + "/" + file.getName());
        postImage.setPost(post);
        postImageRepo.save(postImage);
        return postImage;
    }

    public PostImage findFirstById(long id) {
        return postImageRepo.findFirstById(id);
    }

    public PostImage findFirstByPost(Post post) {
        return postImageRepo.findFirstByPost(post);
    }

    public void delete(PostImage postImage) {

        postImageRepo.delete(postImage);
    }
}
