package com.exam.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PackageVO {
	private String id, pack;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date expireDate;

}
