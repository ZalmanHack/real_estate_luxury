package com.company.realestate.repos;

import com.company.realestate.domains.posts.Post;
import com.company.realestate.domains.posts.PostImage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

public interface PostImageRepo extends CrudRepository<PostImage, Long> {
    PostImage findFirstById(long imgId);

    PostImage findFirstByPost(Post post);
}
