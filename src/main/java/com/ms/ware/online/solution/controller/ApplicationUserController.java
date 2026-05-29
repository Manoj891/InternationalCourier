package com.ms.ware.online.solution.controller;


import com.ms.ware.online.solution.entity.ApplicationUser;
import com.ms.ware.online.solution.service.ApplicationUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/application-user")
public class ApplicationUserController {

    @Autowired
    private ApplicationUserService service;

    @PostMapping
    public ResponseEntity<String> save(@RequestBody ApplicationUser user) {
        service.save(user);
        return ResponseEntity.status(HttpStatus.OK).body("{\"message\":\"success\"}");
    }

    @GetMapping
    public List<ApplicationUser> findAll() {
        return service.findAll();
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Integer id) {
        service.deleteById(id);
        return ResponseEntity.status(HttpStatus.OK).body("{\"message\":\"success\"}");
    }
}