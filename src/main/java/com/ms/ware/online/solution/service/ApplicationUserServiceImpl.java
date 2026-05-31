package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.config.EmailService;
import com.ms.ware.online.solution.config.exceptiion.PermissionDeniedException;
import com.ms.ware.online.solution.config.security.AuthenticatedUser;
import com.ms.ware.online.solution.config.security.AuthenticationFacade;
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
    @Autowired
    private AuthenticationFacade facade;

    @Override
    public void save(ApplicationUser obj) {
        AuthenticatedUser user = facade.getAuthentication();
        if (user.getBranch() != 1 || !user.getUsertype().equalsIgnoreCase("ADM")) throw new PermissionDeniedException();
        String password = null;
        if (user.getId() == null) {
            obj.setId(repository.findNextId());
            password = String.valueOf(Math.random()).substring(3, 9);
            obj.setPassword(passwordEncoder.encode(password));
        }
        repository.saveAndFlush(obj);
        if (password != null) {
          EmailService.Res res= emailService.sendmail(obj.getEmail(), "Password generated", "Dear " + user.getUsername() + " Your username: " + user.getUsername() + " and password: " + password + " has been created");
            System.out.println(res.getMessage());
       }
    }

    @Override
    public List<ApplicationUserRes> findAll() {
        return repository.findByBranchIsNotNull();
    }


    @Override
    public void deleteById(Integer id) {
        AuthenticatedUser user = facade.getAuthentication();
        if (user.getBranch() != 1 || !user.getUsertype().equalsIgnoreCase("ADM")) throw new PermissionDeniedException();
        else if (id == 1) throw new PermissionDeniedException();
        repository.deleteById(id);
    }

    @Override
    public void resetPassword(Integer id) {
        AuthenticatedUser user = facade.getAuthentication();
        if (user.getBranch() != 1 || !user.getUsertype().equalsIgnoreCase("ADM")) throw new PermissionDeniedException();
        String password = String.valueOf(Math.random()).substring(3, 9);
        repository.resetPassword(passwordEncoder.encode(password), id);
    }
}