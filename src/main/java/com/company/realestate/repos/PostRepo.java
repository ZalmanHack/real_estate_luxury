package com.company.realestate.repos;

import com.company.realestate.domains.City;
import com.company.realestate.domains.enums.RealEstateType;
import com.company.realestate.domains.posts.Post;
import javafx.geometry.Pos;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PostRepo extends CrudRepository<Post, Long> {
    Page<Post> findAll(Pageable pageable);
    Page<Post> findByRealEstateType(RealEstateType type, Pageable pageable);




    @Query(value = "SELECT P FROM Post as P " +
            "   where P.realEstateType = :realEstateType AND" +
            "         LOWER(P.location.city.value) LIKE LOWER(concat('%', concat(:city, '%'))) AND " +
            "         LOWER(P.location.name)       LIKE LOWER(concat('%', concat(:name, '%'))) AND " +
            "         P.price                      BETWEEN :price_from AND :price_to")
    Page<Post> findPostsWithPagination(@Param("city") String city,
                                    @Param("realEstateType") RealEstateType realEstateType,
                                    @Param("name") String name,
                                    @Param("price_from") Long price_from,
                                    @Param("price_to") Long price_to,
                                    Pageable pageable);

    @Query(value = "SELECT P FROM Post as P " +
            "   where LOWER(P.location.city.value) LIKE LOWER(concat('%', concat(:city, '%'))) AND " +
            "         LOWER(P.location.name)       LIKE LOWER(concat('%', concat(:name, '%'))) AND " +
            "         P.price                      BETWEEN :price_from AND :price_to")
    Page<Post> findPostsWithPagination(@Param("city") String city,
                                       @Param("name") String name,
                                       @Param("price_from") Long price_from,
                                       @Param("price_to") Long price_to,
                                       Pageable pageable);

    @Query(value = "SELECT P.price FROM Post as P ORDER BY P.price DESC LIMIT 1", nativeQuery = true)
    Long findMaxPrice();
}
