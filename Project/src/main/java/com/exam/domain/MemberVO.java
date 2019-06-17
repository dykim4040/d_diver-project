package com.exam.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String password;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private int cash;
	private String email;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	
	private String hint;
	
	private List<AuthVO> authList;
}
