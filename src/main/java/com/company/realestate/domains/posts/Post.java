package com.company.realestate.domains.posts;

import com.company.realestate.domains.Location;
import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.enums.RealEstateType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@ToString(includeFieldNames=true)
@Data
@Entity
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "userId")
    private User author;

    @ManyToOne
    @JoinColumn(name = "LocationId")
    private Location location;

    @Enumerated(EnumType.STRING)
    private RealEstateType realEstateType;

    @Enumerated(EnumType.STRING)
    private PostStatus postStatus;

    @ToString.Exclude
    @JsonIgnore
    @OneToMany(mappedBy = "post")
    private List<LocalizedBody> localizedBodies = new ArrayList<>();

    @OneToMany(mappedBy = "post")
    private List<PostImage> postImages = new ArrayList<>();

    @Column(columnDefinition = "DATE")
    private LocalDate publicationDate;

    private double area;

    private short bedrooms;

    private short bathrooms;

    private short guestBathrooms;

    private short terrace;

    private short swimmingPool;

    private short parking;

    private long cost;

}
