package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.domain.BoardVO;
import com.exam.mapper.BoardMapper;
import com.exam.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
    
    @Setter(onMethod_ = @Autowired)
    private BoardMapper boardMapper;
    
    @Setter(onMethod_ = @Autowired)
    private BoardService service;
    
    @GetMapping("/write")
    public String write() {
        log.info(" << write() >> "); 
        return "center/write";
    }
    
    @PostMapping("/write")
    public String write(BoardVO board, HttpServletRequest request, Principal principal, HttpServletResponse response) throws IOException {
        log.info(" << write(), POST >> ");
        
        if (principal == null) {
        	response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인이 필요합니다.');");
            out.println("location.href='/member/login';");
            out.println("</script>");
            out.close();
            
            return null
            		;
        }
        
        // 시퀀스로부터 글번호 구하기
        int num = service.getSeqBoardNum();
        board.setName(principal.getName());
        board.setNum(num);  // 주글번호
        board.setReRef(num); // re_ref == num 주글일때는 글그룹번호와 글번호가 같음.
        board.setReLev(0);  // re_lev 들여쓰기 레벨
        board.setReSeq(0);  // re_seq 글그룹 내에서는 오름차순 정렬. 최상단에 주글이 옴.
        board.setReadCount(0); // readCount 조회수 0
        
        // 글작성자 IP주소 값 저장
        board.setIp(request.getRemoteAddr());
        
        service.insert(board);
        return "redirect:/contact";
    }
    
    @GetMapping("/detail")
    public String detail(int num, Model model) {
        // 조회수 1증가
        service.updateReadcount(num);
        
        // 글번호에 해당하는 글 전체(상세)내용 가져오기
        BoardVO board = service.getBoard(num);
        log.info("detail board : " + board);
        System.out.println("detail board : " + board);
        
        // *글내용 줄바꿈 처리방법
        // (1) <pre>태그처리
        // (2) \r\n -> <br> 바꾸기
        String content = "";
        if (board.getContent() != null) {
            content = board.getContent().replace("\r\n", "<br>");
            board.setContent(content);
        }
        
        model.addAttribute("board", board); // 글번호 해당되는 글내용
        
        return "center/content";
    }
    
    
    @GetMapping("/modify")
    public String modify(int num, Model model, HttpSession session) {
        System.out.println("<< Modify 호출 >>");
        
        BoardVO board = service.getBoard(num);
        model.addAttribute("board", board);
        
        return "center/update";
    } //modify GET
    
    @PostMapping("/modify")
    public ResponseEntity<String> modify(Model model, BoardVO board, int num, Principal principal, String pageNum) {
        System.out.println("<< update, POST >>");
        System.out.println(board);
        
        HttpHeaders headers = new HttpHeaders();
        if (principal == null) {
        	headers.add("Content-Type", "text/html; charset=UTF-8"); 
        	StringBuilder sb = new StringBuilder();
            sb.append("<script>");
            sb.append("alert('잘못된 접근입니다.');");
            sb.append("history.back();");
            sb.append("</script>");
            
            return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
        }
        board.setName(principal.getName());
        
        boolean isSuccess = service.updateBoard(board);
        
        if(!isSuccess) { //글 수정 실패
        	headers.add("Content-Type", "text/html; charset=UTF-8");
            StringBuilder sb = new StringBuilder();
            sb.append("<script>");
            sb.append("alert('글 작성자가 다릅니다!');");
            sb.append("history.back();");
            sb.append("</script>");
            
            return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
        }
        
        //글 수정 성공 이후 글목록으로 리다이렉트
        headers.add("Location", "/contact?#board&pageNum="+pageNum); //redirect 경로 위치
        return new ResponseEntity<String>(headers, HttpStatus.FOUND);
    }// modify POST
    
    
//    @GetMapping("/delete")
//    public String delete() {
//        System.out.println("<< delete 호출 >>");
//        
//        return "center/delete";
//    }
    
    @GetMapping("/delete")
    public void delete(int num, String pageNum, Principal principal, HttpServletResponse response) throws IOException {
        System.out.println("<< delete 호출 >>");
        System.out.println(num + " : " + principal.getName());
        
        boolean isSuccess = service.deleteBoard(num, principal.getName());
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String msg = null;
        if (isSuccess) {
        	msg = "삭제되었습니다.";
        } else {
        	msg = "잘못된 접근입니다.";
        }
        out.println("<script>");
        out.println("alert('" + msg + "');");
        out.println("location.href='/contact?#board';");
        out.println("</script>");
        out.close();
        return;
    }
    
//    @PostMapping("/delete")
//    public ResponseEntity<String> delete(Model model, int num, String pageNum, BoardVO boardVO, Principal principal) {
//        System.out.println("<< delete 호출 >>");
//        
//        boolean isSuccess = service.deleteBoard(num, principal.getName());
//        
//        //삭제 성공 이후 글목록으로 리다이렉트
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Location", "/contact?pageNum="+ pageNum); // redirect 경로 위치
//        return new ResponseEntity<String>(headers, HttpStatus.FOUND);
//    } //delete POST
    
    
    @GetMapping("/reply")
    public String reply() {
        return "center/replyWrite";
    }
    
    @PostMapping("/reply")
    public String reply(BoardVO board, HttpServletRequest request, String pageNum, RedirectAttributes rttr, Principal principal) {
        // 사용자 직접 입력값(답글내용) 파라미터 가져와서 저장
        // [답글을 다는 대상글]의 답글관련 정보 파라미터 가져와서 저장
        
        // 답글 작성자의 IP주소 가져와서 저장
        board.setIp(request.getRemoteAddr());
        board.setName(principal.getName());
        
        service.replyInsert(board); // 답글등록
        
        rttr.addAttribute("pageNum", pageNum);
        
        return "redirect:/contact";
    }
    
    
    
    
    
}
