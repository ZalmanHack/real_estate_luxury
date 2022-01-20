package com.company.realestate.services;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.repos.LocaleCodeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Locale;

@Service
public class LocaleCodeService {

    @Autowired
    LocaleCodeRepo localeCodeRepo;

    public LocaleCode get(String code) {
        return localeCodeRepo.findByCode(code.toLowerCase(Locale.ROOT));
    }

    public List<LocaleCode> getAll() {
        return (List<LocaleCode>) localeCodeRepo.findAll();
    }
}
