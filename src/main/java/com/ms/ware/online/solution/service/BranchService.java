package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.entity.Branch;

import java.util.List;

public interface BranchService {

    void save(Branch user);

    List<Branch> findAll();

    Branch findById(Integer id);

    void deleteById(Integer id);

}