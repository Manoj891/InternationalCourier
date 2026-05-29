package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.config.exceptiion.CustomException;
import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.repository.ApplicationUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplicationUserServiceImpl implements ApplicationUserService {

    @Autowired
    private ApplicationUserRepository repository;

    @Override
    public void save(ApplicationUser user) {
        repository.save(user);
    }

    @Override
    public List<ApplicationUser> findAll() {
        return repository.findAll();
    }

    @Override
    public ApplicationUser findById(Integer id) {
        return repository.findById(id).orElseThrow(() -> new CustomException("Record not found"));
    }

    @Override
    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}