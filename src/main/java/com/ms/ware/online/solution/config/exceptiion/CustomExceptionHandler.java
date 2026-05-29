package com.ms.ware.online.solution.config.exceptiion;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.ArrayList;
import java.util.List;

@Order(Ordered.HIGHEST_PRECEDENCE)
@RestControllerAdvice
@Slf4j
public class CustomExceptionHandler {

    @ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<MethodArgumentNotValid> methodArgumentNotValidException(MethodArgumentNotValidException ex) {
        BindingResult result = ex.getBindingResult();
        List<FieldError> list = new ArrayList<>();
        result.getFieldErrors().forEach(e -> list.add(FieldError.builder().name(e.getField()).message(e.getDefaultMessage()).build()));
        MethodArgumentNotValid error = MethodArgumentNotValid.builder().message("validation error").fieldErrors(list).build();
        return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body(error);
    }

    @ExceptionHandler(value = BadCredentialsException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<ErrorMessage> handleException(BadCredentialsException e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new CustomException(e.getMessage()).getDto());
    }

    @ExceptionHandler(value = CustomException.class)
    @ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
    public ResponseEntity<ErrorMessage> handleException(CustomException e) {
        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(e.getDto());
    }

    @ExceptionHandler(value = PermissionDeniedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public ResponseEntity<ErrorMessage> permissionDeniedExceptionException(PermissionDeniedException e) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(e.getDto());
    }

    @ExceptionHandler(value = UnauthorizedException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public ResponseEntity<ErrorMessage> handleUnauthorized(UnauthorizedException e) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getDto());
    }


    @ExceptionHandler(value = AccessDeniedException.class)
    @ResponseStatus(HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE)
    public ResponseEntity<ErrorMessage> handleException(AccessDeniedException e) {
        return ResponseEntity.status(HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE).body(new CustomException(e.getCause().getMessage()).getDto());
    }


    @ExceptionHandler(value = PasswordChangeException.class)
    @ResponseStatus(HttpStatus.UPGRADE_REQUIRED)
    public ResponseEntity<ErrorMessage> passwordChangeException(PasswordChangeException e) {
        return ResponseEntity.status(HttpStatus.UPGRADE_REQUIRED).body(e.getDto());
    }



    @ExceptionHandler(value = Exception.class)
    @ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
    public ResponseEntity<ErrorMessage> handleException(Exception e) {
        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(ErrorMessage.builder().message(e.getMessage() == null ? "InternalServer Error." : e.getMessage()).code(1005).build());
    }

}
