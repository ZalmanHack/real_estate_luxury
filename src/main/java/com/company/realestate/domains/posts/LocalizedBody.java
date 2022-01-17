package com.company.realestate.domains.posts;

import com.company.realestate.domains.LocaleCode;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

@ToString()
@Entity
@Data
public class LocalizedBody {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "postId")
    private Post post;

    @ManyToOne
    @JoinColumn(name = "localeCodeId")
    private LocaleCode localeCode;

    @Length(max = 2048)
    private String description;

    private String features;


}
