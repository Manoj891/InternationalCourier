package com.ms.ware.online.solution.repository;


import com.ms.ware.online.solution.entity.ApplicationUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ApplicationUserRepository extends JpaRepository<ApplicationUser, Integer> {

    ApplicationUser findByUsername(String username);

}