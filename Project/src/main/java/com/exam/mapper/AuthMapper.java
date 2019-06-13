package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.AuthVO;

public interface AuthMapper {
    public List<AuthVO> selectAuthListById(String id);
    
    public int insertAuth(@Param("id") String id, @Param("auth") String auth);
    
    // auth에 null이 들어가면 해당 id의 권한을 "모두" 삭제
    public int deleteAuthById(@Param("id") String id, @Param("auth") String auth);
    
}
