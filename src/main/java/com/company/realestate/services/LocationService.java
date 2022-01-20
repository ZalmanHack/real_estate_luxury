package com.company.realestate.services;

import com.company.realestate.domains.Location;
import com.company.realestate.repos.LocationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationService {

    @Autowired
    LocationRepo locationRepo;

    @Autowired
    CityService cityService;

    public Location createLocation(String locationName) {
        Location location = new Location();
        location.setName(locationName);
        location.setCity(cityService.getFirstCity());
        locationRepo.save(location);
        return location;
    }
}
