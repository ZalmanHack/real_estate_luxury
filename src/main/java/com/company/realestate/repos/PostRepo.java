package com.company.realestate.repos;

import com.company.realestate.domains.City;
import com.company.realestate.domains.enums.PostStatus;
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

    List<Post> findAllByPostStatusAndPremium(PostStatus status, boolean premium);

    @Query(value = "SELECT P FROM Post as P " +
            "   WHERE P.postStatus = :status AND" +
            "         P.realEstateType = :realEstateType AND" +
            "         LOWER(P.city.value) LIKE LOWER(concat('%', concat(:city, '%'))) AND " +
            "         LOWER(P.author.companyName) LIKE LOWER(concat('%', concat(:companyName, '%'))) AND " +
            "         LOWER(P.name)       LIKE LOWER(concat('%', concat(:name, '%'))) AND " +
            "         P.price                      BETWEEN :price_from AND :price_to" +
            "   ORDER BY P.publicationDate DESC")
    Page<Post> findPostsWithPagination(
                                    @Param("status") PostStatus status,
                                    @Param("city") String city,
                                    @Param("companyName") String companyName,
                                    @Param("realEstateType") RealEstateType realEstateType,
                                    @Param("name") String name,
                                    @Param("price_from") Long price_from,
                                    @Param("price_to") Long price_to,
                                    Pageable pageable);

    @Query(value = "SELECT P FROM Post as P " +
            "   WHERE P.postStatus = :status AND " +
            "         LOWER(P.city.value) LIKE LOWER(concat('%', concat(:city, '%'))) AND " +
            "         LOWER(P.author.companyName) LIKE LOWER(concat('%', concat(:companyName, '%'))) AND " +
            "         LOWER(P.name)       LIKE LOWER(concat('%', concat(:name, '%'))) AND " +
            "         P.price                      BETWEEN :price_from AND :price_to" +
            "   ORDER BY P.publicationDate DESC")
    Page<Post> findPostsWithPagination(
                                       @Param("status") PostStatus status,
                                       @Param("city") String city,
                                       @Param("companyName") String companyName,
                                       @Param("name") String name,
                                       @Param("price_from") Long price_from,
                                       @Param("price_to") Long price_to,
                                       Pageable pageable);

    @Query(value = "SELECT P.price FROM Post as P ORDER BY P.price DESC LIMIT 1", nativeQuery = true)
    Long findMaxPrice();

    Post findFirstById(long id);
}
