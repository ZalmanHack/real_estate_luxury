package com.company.realestate.repos;

import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.registries.PostRegistry;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Arrays;
import java.util.List;

public interface PostRegistryRepo extends CrudRepository<PostRegistry, Long> {
    @Query("SELECT P FROM PostRegistry as P ORDER BY P.id DESC")
    List<PostRegistry> findAllOrderByIdDesc();
    List<PostRegistry> findByChangePostStatusOrderByChangeDateDesc(PostStatus postStatus);
}
