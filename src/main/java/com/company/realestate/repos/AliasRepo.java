package com.company.realestate.repos;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.localizations.Alias;
import com.company.realestate.domains.localizations.FieldName;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface AliasRepo extends CrudRepository<Alias, Long> {
    List<Alias> findByLocaleCode(LocaleCode code);
    Optional<Alias> findFirstByFieldNameAndLocaleCode(FieldName fieldName, LocaleCode localeCode);
}
