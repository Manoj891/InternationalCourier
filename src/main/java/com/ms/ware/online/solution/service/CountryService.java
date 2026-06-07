package com.ms.ware.online.solution.service;


import com.ms.ware.online.solution.entity.Country;

import java.util.List;

public interface CountryService {

    void save(Country user);

    List<Country> findAll();

    void deleteById(Integer id);

}