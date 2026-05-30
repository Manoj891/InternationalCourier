package com.ms.ware.online.solution.repository;


import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.res.ApplicationUserRes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ApplicationUserRepository extends JpaRepository<ApplicationUser, Integer> {
    @Query(value = "select ifnull(max(id), 0)+1 from application_user", nativeQuery = true)
    int findNextId();
    Optional<ApplicationUser> findByUsername(String username);

    List<ApplicationUserRes> findByBranchIsNotNull();

}