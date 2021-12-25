package com.company.realestate.repos;

import com.company.realestate.domains.User;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.CrudRepository;

public interface UserRepo extends CrudRepository<User, Long> {

}
