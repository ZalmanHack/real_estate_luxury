package com.company.realestate.domains.posts;

import com.company.realestate.domains.City;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.enums.RealEstateType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@ToString(includeFieldNames=true)
@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private boolean premium = false;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User author;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cityId")
    private City city;

    private double latitude;
    private double longitude;

    @Length(min = 0, max = 64)
    @NotNull
    private String name;

    @Enumerated(EnumType.STRING)
    private RealEstateType realEstateType;

    @Enumerated(EnumType.STRING)
    private PostStatus postStatus = PostStatus.DISABLED;

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "post")
    private List<LocalizedBody> localizedBodies = new ArrayList<>();

    @Column(columnDefinition = "DATE")
    private LocalDate publicationDate;

    @OneToMany(mappedBy = "post")
    private List<PostImage> postImages = new ArrayList<>();

    private String mainImage;
    private String mainVideo;

    private double area;

    private short bedrooms;
    private short bathrooms;
    private short guestBathrooms;
    private short terrace;
    private short swimmingPool;
    private short parking;

    private short gym;
    private short golf;
    private short tennis;
    private short mall;
    private short beach;

    private short kitchen;
    private short livingRoom;
    private short barbecueArea;

    private long price;

}
