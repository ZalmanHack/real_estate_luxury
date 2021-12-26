package com.company.realestate.dtos;

import com.company.realestate.domains.enums.Role;
import lombok.Data;

import java.util.List;
import java.util.Set;

@Data
public class UserDto {
    private long id;
    private String email;
    private String username;
    private String firstName;
    private String lastName;
    private String profileImage;
    private List<Role> roles;
    // added to PropertyMap
    private List<PostShortDto> posts;
}
