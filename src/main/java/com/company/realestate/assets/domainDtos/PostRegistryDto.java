package com.company.realestate.assets.domainDtos;

import lombok.Data;

@Data
public class PostRegistryDto {
    private long id;
    private PostDto post;
    private String changeDate;
    private String changePostStatus;
}
