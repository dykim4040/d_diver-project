package com.exam.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.domain.BoardVO;
import com.exam.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;
    
    @Override
    public int getSeqBoardNum() {
        return mapper.getSeqBoardNum();
    }
    
    @Override
    public int insert(BoardVO boardVO) {
        return mapper.insertBoard(boardVO); //주글 등록
    }
    
    @Override
    public BoardVO getBoard(int num) {
        return mapper.getBoardByNum(num);
    }

    @Override
    public List<BoardVO> getBoards(int startRow, int amount, String search) {
        return mapper.getBoards(startRow, amount, search);
    }

    @Override
    public int getBoardCount(String search) {
        return mapper.getBoardCount(search);
    }
    
    @Override
    public int updateReadcount(int num) {
        return mapper.updateReadcount(num);
    }

    @Override
    public boolean updateBoard(BoardVO board) {
        boolean isSuccess = false;
        
        BoardVO dbBoard = mapper.getBoard(board.getNum());
        
        if (board.getName().equals(dbBoard.getName())) {
            mapper.updateBoard(board);
            isSuccess = true;
        } else {
            isSuccess = false;
        }
        return isSuccess;
    } //updateBoard()

    @Override
    public boolean deleteBoard(int num, String name) {
        boolean isSuccess = false;
        
        BoardVO dbBoard = mapper.getBoard(num);
        
        if(name.equals(dbBoard.getName())) {
            mapper.deleteBoard(num);
            isSuccess = true;
        } else {
            isSuccess = false;
        }
        
        return isSuccess;
    } //deleteBoard()
    
    @Transactional
    @Override
    public void replyInsert(BoardVO board) {
        // 1) 기존 답글들의 순서(re_seq) 재배치
        mapper.updateReplyGroupSeq(board.getReRef(), board.getReSeq());
        
        
        int num = mapper.getSeqBoardNum(); // 글번호
        board.setNum(num);
        // re_lev 는 [답글을 다는 대상글]의 들여쓰기값 + 1
        board.setReLev(board.getReLev() + 1);
        // re_seq 는 [답글을 다는 대상글]의 글그룹 내 순번값 + 1
        board.setReSeq(board.getReSeq() + 1);
        // 답글 조회수 0
        board.setReadCount(0);
        
        mapper.insertBoard(board);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
