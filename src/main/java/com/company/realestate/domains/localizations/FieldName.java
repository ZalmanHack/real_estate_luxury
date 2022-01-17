package com.company.realestate.domains.localizations;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@ToString(includeFieldNames = true)
@Data
@Entity
public class FieldName {
    @JsonIgnore
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

//    @JsonIgnore
//    @OneToMany(mappedBy = "fieldName")
//    private List<Alias> aliases = new ArrayList<>();

    private String value;
}
