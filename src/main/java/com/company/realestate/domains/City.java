package com.company.realestate.domains;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@ToString(includeFieldNames = true)
@Data
@Entity
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(unique = true)
    private String value;
}
