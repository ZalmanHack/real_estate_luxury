package com.company.realestate.repos;

import com.company.realestate.domains.localizations.FieldName;
import org.springframework.data.repository.CrudRepository;

public interface FieldNameRepo extends CrudRepository<FieldName, Long> {
    FieldName findFirstByValue(String value);
}
