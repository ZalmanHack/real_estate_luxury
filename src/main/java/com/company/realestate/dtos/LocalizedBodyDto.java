package com.company.realestate.dtos;

import com.company.realestate.domains.LocaleCode;
import lombok.Data;

@Data
public class LocalizedBodyDto {
    private String localeCode;
    private String description;
    private String features;
}
