package com.company.realestate.services;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.localizations.Alias;
import com.company.realestate.domains.posts.LocalizedBody;
import com.company.realestate.dtos.AliasDto;
import com.company.realestate.repos.AliasRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Service
public class AliasService {

    @Autowired
    AliasRepo aliasRepo;

    @Autowired
    LocaleCodeService localeCodeService;

    @Autowired
    ModelMapper modelMapper;

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
}
