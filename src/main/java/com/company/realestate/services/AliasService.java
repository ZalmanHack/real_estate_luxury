package com.company.realestate.services;

import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.localizations.Alias;
import com.company.realestate.domains.localizations.FieldName;
import com.company.realestate.repos.AliasRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AliasService {

    @Autowired
    AliasRepo aliasRepo;

    @Autowired
    LocaleCodeService localeCodeService;

//    @Autowired
//    ModelMapper modelMapper;

    @Autowired
    FieldNameService fieldNameService;

    @Value("${language.default}")
    private String languageDefault;

    public List<Alias> getAliases(Locale locale) {
        List<Alias> aliases = aliasRepo.findByLocaleCode(localeCodeService.get(locale.getLanguage()));
        if(aliases != null) {
            return aliases;
        }
        return aliasRepo.findByLocaleCode(localeCodeService.get(languageDefault));
    }

    public Map<String, Object> getAliasesDto(Locale locale) {
        List<Alias> aliases = this.getAliases(locale);
        if(aliases == null) {
            return null;
        }
        Map<String, String> fields = new HashMap<>();
        for(Alias alias : aliases) {
            fields.put(alias.getFieldName().getValue(), alias.getValue());
        }
        Map<String, Object> result = new HashMap<>();
        result.put("localeCode", locale.getLanguage());
        result.put("fields", fields);
        return result;
    }

    public String getAlias(String fieldName, Locale locale) {
        FieldName fieldNameDb = fieldNameService.findByName(fieldName);
        if (fieldNameDb != null) {
            Optional<Alias> alias = aliasRepo.findFirstByFieldNameAndLocaleCode(
                    fieldNameDb, localeCodeService.get(locale.getLanguage()));
            return alias.map(Alias::getValue).orElse(fieldName);
        } else {
            return fieldName;
        }
    }

    public Map<String, String> getMappedAlias(PostStatus[] values, Locale locale) {
        Map<String, String> result = new HashMap<>();
        Arrays.stream(values).forEach(value -> result.put(value.name(), getAlias(value.name(), locale)));
        return result;
    }
}
