package com.company.realestate.services;

import com.company.realestate.domains.localizations.FieldName;
import com.company.realestate.repos.FieldNameRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FieldNameService {

    @Autowired
    FieldNameRepo fieldNameRepo;

    public FieldName findByName(String fieldName) {
        return fieldNameRepo.findFirstByValue(fieldName);
    }
}
