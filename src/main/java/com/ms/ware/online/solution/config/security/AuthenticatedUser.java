package com.ms.ware.online.solution.config.security;

import lombok.*;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuthenticatedUser {
    private String id;
    private String username;
    private String usertype;
    private String branch;


}

