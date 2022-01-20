package com.company.realestate.domains;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@ToString(includeFieldNames = true)
@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Location {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cityId")
    private City city;

    private double latitude;

    private double longitude;

    @Length(min = 1, max = 64)
    @NotBlank
    private String name;
}
