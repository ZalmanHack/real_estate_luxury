package com.company.realestate.repos;

import com.company.realestate.domains.City;
import org.springframework.data.repository.CrudRepository;
import org.springframework.lang.Nullable;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

public interface CityRepo extends CrudRepository<City, Long> {

    List<City> findAll();
    City findByValue(String city);
}
