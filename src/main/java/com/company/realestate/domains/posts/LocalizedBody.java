package com.company.realestate.domains.posts;

import com.company.realestate.domains.LocaleCode;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

@ToString()
@Entity
@Data
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class LocalizedBody {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "postId")
    private Post post;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "localeCodeId")
    private LocaleCode localeCode;

    @Length(max = 2048)
    private String description;

    private String features;

}
