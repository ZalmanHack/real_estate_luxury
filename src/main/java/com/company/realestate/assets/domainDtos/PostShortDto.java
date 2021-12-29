package com.company.realestate.assets.domainDtos;

import lombok.Data;

import java.util.List;

@Data
public class PostShortDto {

    private long id;

    private String locationCityValue;
    private String locationName;
    private double locationLatitude;
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
    private long price;
}
