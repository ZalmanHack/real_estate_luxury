package com.company.realestate.services;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.posts.LocalizedBody;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.repos.LocalizedBodyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Locale;

@Service
public class LocalizedBodyService {

    @Autowired
    LocalizedBodyRepo localizedBodyRepo;

    @Autowired
    LocaleCodeService localeCodeService;

    @Value("${language.default}")
    private String languageDefault;

    public List<LocalizedBody> getAll(LocaleCode code) {
        return localizedBodyRepo.findAllByLocaleCode(code);
    }

    public LocalizedBody get(Locale locale, Post post) {
        LocalizedBody localizedBody = localizedBodyRepo.findFirstByLocaleCodeAndPost(localeCodeService.get(locale.getLanguage()), post);
        if(localizedBody != null) {
            return localizedBody;
        }
        return localizedBodyRepo.findFirstByLocaleCodeAndPost(localeCodeService.get(languageDefault), post);
    }
}
