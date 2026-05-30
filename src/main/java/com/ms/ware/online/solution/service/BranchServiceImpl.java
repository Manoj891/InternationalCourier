package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.config.exceptiion.CustomException;
import com.ms.ware.online.solution.config.exceptiion.PermissionDeniedException;
import com.ms.ware.online.solution.config.security.AuthenticatedUser;
import com.ms.ware.online.solution.config.security.AuthenticationFacade;
import com.ms.ware.online.solution.entity.Branch;
import com.ms.ware.online.solution.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchServiceImpl implements BranchService {

    @Autowired
    private BranchRepository repository;
    @Autowired
    private AuthenticationFacade facade;

    @Override
    public void save(Branch obj) {
        AuthenticatedUser user = facade.getAuthentication();
        if (user.getBranch() != 1 || !user.getUsertype().equalsIgnoreCase("ADM")) throw new PermissionDeniedException();
        if (obj.getId() == null) {
            obj.setId(repository.findNextId());
        }
        repository.save(obj);
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
        AuthenticatedUser user = facade.getAuthentication();
        if (user.getBranch() != 1 || !user.getUsertype().equalsIgnoreCase("ADM")) throw new PermissionDeniedException();
        if (id == 1) throw new PermissionDeniedException();
        repository.deleteById(id);
    }
}