package com.ms.ware.online.solution.config.exceptiion;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ErrorMessage {
    private String message;
    private int code;
}
