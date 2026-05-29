package com.ms.ware.online.solution.login;

import com.ms.ware.online.solution.config.exceptiion.CustomException;
import com.ms.ware.online.solution.config.security.JwtHelper;
import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.repository.ApplicationUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/public/api/login")
public class LoginController {
    @Autowired
    private ApplicationUserRepository repository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JwtHelper jwtHelper;

    @PostMapping
    public String login(@RequestBody LoginReq body) {
        ApplicationUser user = repository.findByUsername(body.getUsername()).orElseThrow(() -> new CustomException("Invalid credentials!"));
        if (!passwordEncoder.matches(body.getPassword(), user.getPassword())) {
            throw new CustomException("Invalid credentials!");
        }
        return "{\"token\":\"" + jwtHelper.create(user.getId().toString(), user.getUsername(), user.getUsertype(), user.getBranch().toString()) + "\"}";

    }
}
