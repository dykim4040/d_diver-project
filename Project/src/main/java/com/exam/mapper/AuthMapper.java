package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.AuthVO;

public interface AuthMapper {
    public List<AuthVO> selectAuthListById(String id);
    
    public int insertAuth(@Param("id") String id, @Param("auth") String auth);
    
    public int deleteAuthById(String id);
    
}
