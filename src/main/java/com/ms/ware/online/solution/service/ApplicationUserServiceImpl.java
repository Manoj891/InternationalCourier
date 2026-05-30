package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.config.EmailService;
import com.ms.ware.online.solution.config.exceptiion.PermissionDeniedException;
import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.repository.ApplicationUserRepository;
import com.ms.ware.online.solution.res.ApplicationUserRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplicationUserServiceImpl implements ApplicationUserService {

    @Autowired
    private ApplicationUserRepository repository;
    @Autowired
    private EmailService emailService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void save(ApplicationUser user) {
        String password = null;
        if (user.getId() == null) {
            user.setId(repository.findNextId());
            password = String.valueOf(Math.random()).substring(3, 9);
            user.setPassword(passwordEncoder.encode(password));
        }
        repository.saveAndFlush(user);
        if (password != null) {
            emailService.sendmail(user.getEmail(), "Password generated", "Dear " + user.getUsername() + " Your username: " + user.getUsername() + " and password: " + password + " has been created");
        }
    }

    @Override
    public List<ApplicationUserRes> findAll() {
        return repository.findByBranchIsNotNull();
    }


    @Override
    public void deleteById(Integer id) {
        if (id == 1) throw new PermissionDeniedException();
        repository.deleteById(id);
    }
}