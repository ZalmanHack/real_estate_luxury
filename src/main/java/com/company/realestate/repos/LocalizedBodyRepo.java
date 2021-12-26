package com.company.realestate.repos;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.posts.LocalizedBody;
import com.company.realestate.domains.posts.Post;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Locale;

public interface LocalizedBodyRepo extends CrudRepository<LocalizedBody, Long> {
    List<LocalizedBody> findAllByLocaleCode(LocaleCode code);

    LocalizedBody findFirstByLocaleCodeAndPost(LocaleCode code, Post post);
}
