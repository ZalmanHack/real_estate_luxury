package com.company.realestate.assets.domainDtos;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class PostDto extends PostShortDto{
  private UserShortDto author;
}
