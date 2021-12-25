package com.company.realestate.repos;

import com.company.realestate.domains.LocaleCode;
import org.springframework.data.repository.CrudRepository;

public interface LocaleCodeRepo extends CrudRepository<LocaleCode, Long> {
    LocaleCode findByCode(String code);
}
