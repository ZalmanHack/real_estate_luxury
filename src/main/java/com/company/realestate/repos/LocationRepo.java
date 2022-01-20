package com.company.realestate.repos;

import com.company.realestate.domains.Location;
import org.springframework.data.repository.CrudRepository;

public interface LocationRepo extends CrudRepository<Location, Long> {
}
