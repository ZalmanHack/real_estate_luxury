package com.company.realestate.domains;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@ToString(includeFieldNames = true)
@Data
@Entity
public class Subscription {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToMany
    private List<User> users = new ArrayList<>();

    private short monthCount;

    private String name;

    private int cost;
}
