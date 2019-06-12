package com.exam.service;

import java.util.List;

import com.exam.domain.BoardVO;

public interface BoardService {
    
    public int getSeqBoardNum();
    
    public int insert(BoardVO boardVO);
    
    public List<BoardVO> getBoards(int startRow, int amount, String search);
    
    public BoardVO getBoard(int num);
    
    public int getBoardCount(String search);
    
    public int updateReadcount(int num);
    
    public boolean updateBoard(BoardVO board);
    
    public boolean deleteBoard(int num, String name);
    
    public void replyInsert(BoardVO board);
}
