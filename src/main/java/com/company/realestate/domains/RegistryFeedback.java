package com.company.realestate.domains;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@ToString(includeFieldNames = true)
@Data
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class RegistryFeedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Length(min = 5, max = 50)
    @NotBlank
    private String email;

    @Length(min = 1, max = 50)
    @NotBlank
    private String name;

    @Length(min = 1, max = 1024)
    @NotBlank
    private String question;

    @Column(columnDefinition = "DATE")
    private LocalDate sentDate;
}
