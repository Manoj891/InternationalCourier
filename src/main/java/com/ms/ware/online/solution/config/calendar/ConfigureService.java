package com.ms.ware.online.solution.config.calendar;

import com.ms.ware.online.solution.entity.Branch;
import com.ms.ware.online.solution.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Optional;

@Service
public class ConfigureService {
    @Autowired
    private BranchRepository branchRepository;

    @PostConstruct
    public void init() {
        Optional<Branch> branch = branchRepository.findById(1);
        if (branch.isEmpty()) {
            branchRepository.save(Branch.builder()
                    .id(1)
                    .name("KATHMANDU")
                    .code("H-O")
                    .address("KATHMANDU")
                    .email("")
                    .contactNo("")
                    .build());
        }
    }
}
