package com.ms.ware.online.solution.repository;


import com.ms.ware.online.solution.entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository extends JpaRepository<Country, Integer> {
    @Query(value = "select ifnull(max(id), 0)+1 from country", nativeQuery = true)
    int findNextId();
}