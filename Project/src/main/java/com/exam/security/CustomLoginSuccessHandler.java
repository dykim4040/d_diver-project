package com.exam.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication auth) throws IOException, ServletException {
log.warn("Login Success");
        
        List<String> roleNames = new ArrayList<>();
        
        Collection<GrantedAuthority> collection 
            = (Collection<GrantedAuthority>) auth.getAuthorities();
        
        for (GrantedAuthority authority : collection) {
            roleNames.add(authority.getAuthority());
        }
        
        log.warn("ROLE NAMES: " + roleNames);
        
        if (roleNames.contains("ROLE_ADMIN")) {
            response.sendRedirect("/contact");
            return;
        }
        
        if (roleNames.contains("ROLE_MEMBER")) {
            response.sendRedirect("/movie");
            return;
        }
        
        response.sendRedirect("/");
    }

}
