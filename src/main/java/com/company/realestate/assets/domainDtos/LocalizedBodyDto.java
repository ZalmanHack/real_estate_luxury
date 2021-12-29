package com.company.realestate.assets.domainDtos;

import lombok.Data;

@Data
public class LocalizedBodyDto {
    private String localeCode;
    private String description;
    private String features;
}
