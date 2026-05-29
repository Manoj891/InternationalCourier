package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.config.exceptiion.CustomException;
import com.ms.ware.online.solution.entity.Branch;
import com.ms.ware.online.solution.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchServiceImpl implements BranchService {

    @Autowired
    private BranchRepository repository;

    @Override
    public void save(Branch user) {
        repository.save(user);
    }

    @Override
    public List<Branch> findAll() {
        return repository.findAll();
    }

    @Override
    public Branch findById(Integer id) {
        return repository.findById(id).orElseThrow(() -> new CustomException("Record not found"));
    }

    @Override
    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}