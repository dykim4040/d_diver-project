package com.exam.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.exam.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {
    private MemberVO member;

    public CustomUser(String username, String password, 
            Collection<? extends GrantedAuthority> authorities,
            MemberVO member) {
        super(username, password, authorities);
        
        this.member = member;
    }
}
