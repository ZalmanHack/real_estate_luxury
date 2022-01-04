package com.company.realestate.assets.requestDtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class RequestPostBodyDto {
    private int page;
    private int size;
    private String city;
    private String name;
    @JsonProperty("real_estate_type")
    private String realEstateType;
    @JsonProperty("price_from")
    private long priceFrom;
    @JsonProperty("price_to")
    private long priceTo;
}
