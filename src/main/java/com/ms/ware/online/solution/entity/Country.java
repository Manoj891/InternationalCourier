package com.ms.ware.online.solution.entity;


import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "country")
public class Country {

    @Id
    private Integer id;

    @Column(name = "name", unique = true, length = 50)
    private String name;

    @Column(name = "code", unique = true, length = 3)
    private String code;

}