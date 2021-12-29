package com.company.realestate.assets.domainDtos;

import com.company.realestate.domains.enums.Role;
import lombok.Data;

import java.util.List;

@Data
public class UserShortDto{
    private long id;
    private String email;
    private String username;
    private String firstName;
    private String lastName;
    private String profileImage;
    private List<Role> roles;
}
