package com.company.realestate.assets.domainDtos;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserDto extends UserShortDto{
    // added to PropertyMap
    private List<PostShortDto> posts;
}
