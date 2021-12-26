package com.company.realestate.dtos;

import com.company.realestate.domains.Location;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.posts.LocalizedBody;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class PostShortDto {

    private long id;

    private String locationCityValue;
    private String locationName;
    private double latitude;
    private double locationLongitude;

    private String realEstateType;
    private String postStatus;

    private List<LocalizedBodyDto> localizedBodies;

    // added to PropertyMap
    private List<String> PostImages;
    // added to PropertyMap
    private String publicationDate;

    private double area;
    private short bedrooms;
    private short bathrooms;
    private short guestBathrooms;
    private short terrace;
    private short swimmingPool;
    private short parking;
    private long cost;
}
