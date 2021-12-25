package com.company.realestate.services;

import com.company.realestate.domains.LocaleCode;
import com.company.realestate.domains.posts.LocalizedBody;
import com.company.realestate.repos.LocalizedBodyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LocalizedBodyService {

    @Autowired
    LocalizedBodyRepo localizedBodyRepo;

    public List<LocalizedBody> getAll(LocaleCode code) {
        return localizedBodyRepo.findAllByLocaleCode(code);
    }

}
