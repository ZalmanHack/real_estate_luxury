package com.company.realestate.domains.localizations;

import com.company.realestate.domains.LocaleCode;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@ToString(includeFieldNames = true)
@Data
@Entity
public class Alias {
    @JsonIgnore
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne
    @JoinColumn(name = "fieldNameId")
    private FieldName fieldName;

    @ManyToOne
    @JoinColumn(name = "LocaleCodeId")
    private LocaleCode localeCode;

    private String value;
}