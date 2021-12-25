package com.company.realestate.repos;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.localizations.Alias;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AliasRepo extends CrudRepository<Alias, Long> {
    List<Alias> findByLocaleCode(LocaleCode code);
}
