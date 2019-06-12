package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.BoardVO;

public interface BoardMapper {
    
    public int getSeqBoardNum();
    
    public BoardVO getBoardByNum(int num);
    
    public int insertBoard(BoardVO boardVO);
    
    public BoardVO getBoard(int num);
    
    public List<BoardVO> getBoards(@Param("startRow") int startRow, 
            @Param("amount") int amount, 
            @Param("search") String search);
    
    public int getBoardCount(@Param("search") String search);
    
    public int updateReadcount(int num);
    
    public int updateBoard(BoardVO board);
    
    public void deleteBoard(int num);
    
    public int updateReplyGroupSeq(@Param("reRef") int re_ref, @Param("reSeq") int re_seq);

}
