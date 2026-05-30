package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.res.ApplicationUserRes;

import java.util.List;

public interface ApplicationUserService {

    void save(ApplicationUser user);

    List<ApplicationUserRes> findAll();


    void deleteById(Integer id);

    void resetPassword(Integer id);
}