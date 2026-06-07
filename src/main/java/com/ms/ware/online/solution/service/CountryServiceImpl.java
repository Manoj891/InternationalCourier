package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.config.exceptiion.PermissionDeniedException;
import com.ms.ware.online.solution.config.security.AuthenticatedUser;
import com.ms.ware.online.solution.config.security.AuthenticationFacade;
import com.ms.ware.online.solution.entity.Country;
import com.ms.ware.online.solution.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryRepository repository;
    @Autowired
    private AuthenticationFacade facade;

    @Override
    public void save(Country obj) {
        AuthenticatedUser user = facade.getAuthentication();
        if (user.getBranch() != 1 || !user.getUsertype().equalsIgnoreCase("ADM")) throw new PermissionDeniedException();
        if (obj.getId() == null) {
            obj.setId(repository.findNextId());
        }
        repository.save(obj);
    }

    @Override
    public List<Country> findAll() {
        return repository.findAll();
    }



    @Override
    public void deleteById(Integer id) {
        AuthenticatedUser user = facade.getAuthentication();
        if (user.getBranch() != 1 || !user.getUsertype().equalsIgnoreCase("ADM")) throw new PermissionDeniedException();
        if (id == 1) throw new PermissionDeniedException();
        repository.deleteById(id);
    }
}