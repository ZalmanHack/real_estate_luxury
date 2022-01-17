package com.company.realestate.domains.posts;

import com.company.realestate.domains.User;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@ToString(includeFieldNames = true)
@Data
@Entity
public class PostVideo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "postId")
    private Post post;

    private String video;
}
