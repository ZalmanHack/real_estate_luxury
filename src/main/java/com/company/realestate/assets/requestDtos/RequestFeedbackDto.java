package com.company.realestate.assets.requestDtos;

import lombok.Data;

@Data
public class RequestFeedbackDto {
    private String email;
    private String name;
    private String question;
}
