package com.ms.ware.online.solution.entity;


import lombok.*;

import javax.persistence.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "application_user")
public class ApplicationUser {

    @Id
    private Integer id;
    @Column(name = "username", length = 15, unique = true)
    private String username;

    @Column(name = "usertype", length = 3)
    private String usertype;

    @Column(name = "email", length = 150)
    private String email;

    @Column(name = "mobile_no", length = 10)
    private String mobileNo;

    @Column(name = "branch")
    private Integer branch;
    @Setter(AccessLevel.NONE)
    @Getter(AccessLevel.NONE)
    @Column(name = "password", updatable = false)
    private String password;

}