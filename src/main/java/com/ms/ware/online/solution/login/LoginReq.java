package com.ms.ware.online.solution.login;

import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LoginReq {
    private String username;
    private String password;
}
