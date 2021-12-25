package com.company.realestate.repos;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.posts.LocalizedBody;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LocalizedBodyRepo extends CrudRepository<LocalizedBody, Long> {
    List<LocalizedBody> findAllByLocaleCode(LocaleCode code);
}
