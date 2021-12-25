package com.company.realestate.domains.posts;

import com.company.realestate.domains.LocaleCode;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@ToString()
@Entity
@Data
public class LocalizedBody {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "postId")
    private Post post;

    @ManyToOne
    @JoinColumn(name = "localeCodeId")
    private LocaleCode localeCode;

    private String description;

    private String features;


}
