package com.exam.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
    private int num;         // 글번호
    private String name;     // 작성자명
    private String subject;  // 글제목
    private String content;  // 글내용
    private int reRef;      // 글그룹 번호
    private int reLev;      // 글 들여쓰기(답글) 레벨
    private int reSeq;      // 글그룹 내에서의 순서
    private int readCount;   // 조회수
    private Date regDate;  // 글 작성(등록) 날짜시간
    private String ip;       // 작성자 IP주소  
}
