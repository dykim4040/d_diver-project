package com.exam.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.exam.domain.AuthVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.AuthMapper;
import com.exam.mapper.MemberMapper;
import com.exam.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
    
    @Setter(onMethod_ = @Autowired)
    private MemberMapper memberMapper;
    
    @Setter(onMethod_ = @Autowired)
    private AuthMapper authMapper;
    
    // 로그인하면 loadUserByUsername() 메소드 자동호출됨.
    // 로그인 아이디가 username 입력 파라미터로 전달됨.
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 스프링 시큐리티에서 username은 아이디를 가리킴
        log.warn("username : " + username);
        
        // 조인쿼리로 아이디에 해당하는 member레코드와 auth 리스트 가져오기
//        MemberVO member = memberMapper.getMemberAndAuthById(username); 
        
        MemberVO member = memberMapper.getMemberById(username);
        List<AuthVO> authList = authMapper.selectAuthListById(username);
        
        member.setAuthList(authList);
        
        
        log.warn("member : " + member);
        
        String id = member.getId();
        String password = member.getPassword();
//        List<AuthVO> authList = member.getAuthList();
        
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        
        for (AuthVO auth : authList) {
            list.add(new SimpleGrantedAuthority(auth.getAuth()));
        }
        
        // principal
        CustomUser customUser = new CustomUser(id, password, list, member);
        return customUser;
    }

}
