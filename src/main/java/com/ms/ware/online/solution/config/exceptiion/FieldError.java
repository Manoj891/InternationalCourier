package com.ms.ware.online.solution.config.exceptiion;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FieldError {
    private String name;
    private String message;
}
