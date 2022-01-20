package com.company.realestate.services;

import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import com.company.realestate.repos.PostImageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.io.File;

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

    public boolean delImage(Post post, long imgId) {
        PostImage postImage = postImageRepo.findFirstById(imgId);
        System.out.println(post);
        System.out.println(postImage);
        if (postImage == null) {
            return false;
        }
        if (!postImage.getPost().equals(post)) {
            return false;
        }
        postImageRepo.delete(postImage);
        return true;
    }

}
