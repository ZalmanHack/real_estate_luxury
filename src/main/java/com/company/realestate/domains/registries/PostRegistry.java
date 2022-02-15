package com.company.realestate.domains.registries;

import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.posts.Post;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;

@ToString(includeFieldNames=true)
@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class PostRegistry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "postId")
    private Post post;

    @Column(columnDefinition = "DATE")
    private LocalDate changeDate;

    @Enumerated(EnumType.STRING)
    private PostStatus changePostStatus;
}
