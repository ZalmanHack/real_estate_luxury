package com.company.realestate.domains;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@ToString(includeFieldNames = true)
@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Subscription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<User> users = new ArrayList<>();

    private short monthCount;

    private String name;

    private int cost;
}
