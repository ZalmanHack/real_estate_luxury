package com.company.realestate.assets.domainDtos;

import lombok.Data;

import java.util.List;

@Data
public class PostShortDto {

    private long    id;
    private boolean premium;

    private String cityValue;
    private String name;
    private double latitude;
    private double longitude;

    private String realEstateType;
    private String postStatus;
    private String mainImage;
    private String mainVideo;

    private List<LocalizedBodyDto> localizedBodies;

    // added to PropertyMap
    private List<PostImageDto> PostImages;
    // added to PropertyMap
    private String publicationDate;

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
