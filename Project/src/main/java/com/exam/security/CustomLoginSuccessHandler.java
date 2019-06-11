package com.exam.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.exam.security.domain.CustomUser;
import com.exam.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication auth) throws IOException, ServletException {
    	log.warn("Login Success");
    	System.out.println("Login Success!");
    	
    	CustomUser customUser = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	String id = customUser.getUsername(); // customUser.getMember().getId();
    	System.out.println(id);
    	
    	String pack = memberService.getCurrPackage(id);
    	
        HttpSession session = request.getSession();
        session.setAttribute("pack", pack);

        List<String> roleNames = new ArrayList<>();
        
        Collection<GrantedAuthority> collection 
            = (Collection<GrantedAuthority>) auth.getAuthorities();
        
        for (GrantedAuthority authority : collection) {
            roleNames.add(authority.getAuthority());
        }
        
        log.warn("ROLE NAMES: " + roleNames);
        System.out.println("ROLE NAMES: " + roleNames);
        
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
