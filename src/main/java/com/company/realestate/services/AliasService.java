package com.company.realestate.services;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.localizations.Alias;
import com.company.realestate.repos.AliasRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AliasService {

    @Autowired
    AliasRepo aliasRepo;

    public List<Alias> getAliases(LocaleCode code) {
        return aliasRepo.findByLocaleCode(code);
    }
}
