package com.ms.ware.online.solution.config.security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class OrganizationAuth implements AuthenticationFacade {
    @Override
    public AuthenticatedUser getAuthentication() {
        return (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
