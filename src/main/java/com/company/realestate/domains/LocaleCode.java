package com.company.realestate.domains;

import com.company.realestate.domains.localizations.Alias;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@ToString(includeFieldNames = true)
@Data
@Entity
public class LocaleCode {
    @JsonIgnore
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String code;
}
