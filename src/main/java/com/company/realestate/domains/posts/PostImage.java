package com.company.realestate.domains.posts;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@ToString(includeFieldNames = true)
@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class PostImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "postId")
    private Post post;

    private String image;
}
