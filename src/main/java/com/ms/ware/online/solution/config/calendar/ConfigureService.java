package com.ms.ware.online.solution.config.calendar;

import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.entity.Branch;
import com.ms.ware.online.solution.repository.ApplicationUserRepository;
import com.ms.ware.online.solution.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Optional;

@Service
public class ConfigureService {
    @Autowired
    private BranchRepository branchRepository;
    @Autowired
    private ApplicationUserRepository applicationUserRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

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

        Optional<ApplicationUser> user = applicationUserRepository.findById(1);
        if (user.isEmpty()) {
            applicationUserRepository.save(ApplicationUser.builder()
                            .id(1)
                            .branch(1)
                            .username("ADMIN")
                            .email("admin@admin.com")
                            .mobileNo("")
                            .usertype("ADM")
                            .password(passwordEncoder.encode("IC@ADMIN12"))
                    .build());
        }
    }
}
