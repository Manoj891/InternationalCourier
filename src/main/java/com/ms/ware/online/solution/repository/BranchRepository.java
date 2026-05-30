package com.ms.ware.online.solution.repository;



import com.ms.ware.online.solution.entity.Branch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BranchRepository extends JpaRepository<Branch, Integer> {
    @Query(value = "select ifnull(max(id), 0)+1 from branch", nativeQuery = true)
    int findNextId();


}