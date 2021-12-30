package com.company.realestate.domains.enums;

import java.util.Locale;

public enum RealEstateType {
    APARTMENT, HOUSE, VILLA, LAND, BUSINESS, RENT;

    public static RealEstateType get(String value) {
        try {
            return valueOf(value.toUpperCase(Locale.ROOT));
        } catch (Exception e){
            return null;
        }
    }
}
