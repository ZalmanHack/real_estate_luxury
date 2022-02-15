package com.company.realestate.repos;

import com.company.realestate.domains.User;
import com.company.realestate.domains.enums.PostStatus;
import com.company.realestate.domains.enums.RealEstateType;
import com.company.realestate.domains.enums.Role;
import com.company.realestate.domains.posts.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetails;

import javax.jws.soap.SOAPBinding;
import java.util.List;
import java.util.Optional;

public interface UserRepo extends CrudRepository<User, Long> {
    List<User> findAll();
    Page<User> findAll(Pageable pageable);
    Optional<User> findFirstByUsername(String username);
    Optional<User> findFirstByEmail(String email);
    Optional<User> findFirstByRestorePasswordCode(String code);
    Optional<User> findByActivationCode(String code);

    @Query(value = "SELECT * FROM _user as U WHERE LOWER(U.company_name) = LOWER(:companyName) LIMIT 1", nativeQuery = true)
    Optional<User> findFirstByCompanyName(String companyName);

    @Query(value = "SELECT DISTINCT U.companyName FROM User as U")
    List<String> findAllCompanyNamesUnique();
}
