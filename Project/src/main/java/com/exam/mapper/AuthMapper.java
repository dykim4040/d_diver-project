package com.exam.mapper;

import java.util.List;

import com.exam.domain.AuthVO;

public interface AuthMapper {
    public List<AuthVO> selectAuthListById(String id);
}
