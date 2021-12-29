package com.company.realestate.assets.requestDtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class RequestPostBody {
    private int page;
    private int size;
    private String city;
    private String search;
    @JsonProperty("real_estate_type")
    private String realEstateType;
    @JsonProperty("price_from")
    private Long priceFrom;
    @JsonProperty("price_to")
    private Long priceTo;
}
