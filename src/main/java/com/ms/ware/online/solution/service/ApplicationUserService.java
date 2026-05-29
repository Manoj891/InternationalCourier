package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.entity.ApplicationUser;

import java.util.List;

public interface ApplicationUserService {

    void save(ApplicationUser user);

    List<ApplicationUser> findAll();

    ApplicationUser findById(Integer id);

    void deleteById(Integer id);

}