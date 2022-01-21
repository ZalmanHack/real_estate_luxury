package com.company.realestate.services;

import com.company.realestate.assets.domainDtos.LocalizedBodyDto;
import com.company.realestate.assets.domainDtos.PostShortDto;
import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.posts.LocalizedBody;
import com.company.realestate.domains.posts.Post;
import com.company.realestate.repos.LocalizedBodyRepo;
import org.modelmapper.ModelMapper;
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

    @Autowired
    ModelMapper modelMapper;

    @Value("${language.default}")
    private String languageDefault;

    public List<LocalizedBody> getAll(LocaleCode code) {
        return localizedBodyRepo.findAllByLocaleCode(code);
    }

    public List<LocalizedBody> getAll(Post post) {
        List<LocalizedBody> localizedBodies = localizedBodyRepo.findAllByPost(post);
        if(localizedBodies == null) {
            return null;
        }

        localeCodeService.getAll().forEach(localeCode -> {
            // если нет тела с такой локализацией, то создаем его
            if(localizedBodies.stream().noneMatch(localizedBody -> localizedBody.getLocaleCode().equals(localeCode))) {
                this.createNew(post, new Locale(localeCode.getCode().toLowerCase(Locale.ROOT)));
            }
        });
        return localizedBodyRepo.findAllByPost(post);
    }



    public LocalizedBody get(Locale locale, Post post) {
        LocalizedBody localizedBody = localizedBodyRepo.findFirstByLocaleCodeAndPost(localeCodeService.get(locale.getLanguage()), post);
        if(localizedBody != null) {
            return localizedBody;
        }
        return localizedBodyRepo.findFirstByLocaleCodeAndPost(localeCodeService.get(languageDefault), post);
    }

    public LocalizedBody createNew(Post post, Locale locale) {
        LocalizedBody localizedBody = new LocalizedBody();
        localizedBody.setLocaleCode(localeCodeService.get(locale.getLanguage()));
        localizedBody.setPost(post);
        localizedBodyRepo.save(localizedBody);
        return localizedBody;
    }

    public LocalizedBody createNewWithDefaultLanguage(Post post) {
        return createNew(post, new Locale(languageDefault));
    }


    public void save(LocalizedBody localizedBody) {
        localizedBodyRepo.save(localizedBody);
    }

    public void updateBody(LocalizedBodyDto localizedBody, Post post) {
        LocalizedBody body = localizedBodyRepo.findFirstByLocaleCodeAndPost(localeCodeService.get(localizedBody.getLocaleCode()), post);
        if(body != null) {
            body.setDescription(localizedBody.getDescription());
            body.setFeatures(localizedBody.getFeatures());
            localizedBodyRepo.save(body);
        }
    }

    public void updateBodies(List<LocalizedBodyDto> localizedBodies, Post post) {
        localizedBodies.forEach(localizedBodyDto -> updateBody(localizedBodyDto, post));
    }
}
