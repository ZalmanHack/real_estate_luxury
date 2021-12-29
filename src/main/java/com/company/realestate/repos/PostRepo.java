package com.company.realestate.repos;

import com.company.realestate.domains.posts.Post;
import javafx.geometry.Pos;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PostRepo extends CrudRepository<Post, Long> {
    Page<Post> findAll(Pageable pageable);
}
