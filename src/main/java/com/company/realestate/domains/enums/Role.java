package com.company.realestate.domains.enums;

import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;

@ToString
public enum Role implements GrantedAuthority {
    ADMIN, USER, PREMIUM;

    @Override
    public String getAuthority() {
        return name();
    }
}
