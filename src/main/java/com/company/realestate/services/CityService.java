package com.company.realestate.services;

import com.company.realestate.domains.City;
import com.company.realestate.repos.CityRepo;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CityService {

    @Autowired
    CityRepo cityRepo;

    @Autowired
    ModelMapper modelMapper;

    public List<String> getAllNames() {
        return cityRepo.findAll().stream().map(City::getValue).collect(Collectors.toList());
    }

    public City getCity(String city) {
        return cityRepo.findByValue(city);
    }
}
