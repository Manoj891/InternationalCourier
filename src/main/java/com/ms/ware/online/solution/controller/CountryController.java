package com.ms.ware.online.solution.controller;


import com.ms.ware.online.solution.entity.Country;
import com.ms.ware.online.solution.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/country")
public class CountryController {

    @Autowired
    private CountryService service;

    @PostMapping
    public ResponseEntity<String> save(@RequestBody Country user) {
        service.save(user);
        return ResponseEntity.status(HttpStatus.OK).body("{\"message\":\"success\"}");
    }

    @GetMapping
    public List<Country> findAll() {
        return service.findAll();
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Integer id) {
        service.deleteById(id);
        return ResponseEntity.status(HttpStatus.OK).body("{\"message\":\"success\"}");
    }
}