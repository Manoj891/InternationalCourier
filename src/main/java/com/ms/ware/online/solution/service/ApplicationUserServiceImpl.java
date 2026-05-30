package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.repository.ApplicationUserRepository;
import com.ms.ware.online.solution.res.ApplicationUserRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplicationUserServiceImpl implements ApplicationUserService {

    @Autowired
    private ApplicationUserRepository repository;

    @Override
    public void save(ApplicationUser user) {
        if (user.getId() == null) {
            user.setId(repository.findNextId());
        }
        repository.save(user);
    }

    @Override
    public List<ApplicationUserRes> findAll() {
        return repository.findByBranchIsNotNull();
    }


    @Override
    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}