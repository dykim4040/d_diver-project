package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.BoardVO;
import com.exam.domain.MemberVO;
import com.exam.domain.MovieInfoVO;
import com.exam.domain.MovieVO;
import com.exam.service.BoardService;
import com.exam.service.MemberService;
import com.exam.service.MovieService;

import lombok.Setter;

@Controller
public class HomeController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@Setter(onMethod_ = @Autowired)
	private MovieService movieService;
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@GetMapping("/")
	public String main(Model model) throws Exception {
		System.out.println("<< main 호출 >>");
		
		List<MovieVO> list = movieService.newGetMovie(6);
		model.addAttribute("list", list);
		
		return "index";
	}//main()
	
	@GetMapping("/myContents")
	public String myContents(HttpSession session, Model model) throws Exception {
		System.out.println("<< myContents 호출 >>");
		
		String id = (String) session.getAttribute("sessionID");
		
		List<MovieVO> watchList = movieService.getWatchList(id, 6);
		List<MovieVO> wishList = movieService.getWishList(id, 0);
		
		model.addAttribute("watchList", watchList);
		model.addAttribute("wishList", wishList);
		
		return "myContents";
	}//myContents()
	
	@GetMapping("/contact")
	public String contact(@RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(required = false) String search, 
            Model model) {
		System.out.println("<< contact 호출 >>");
		
		// =========================================
        // 한 페이지에 해당하는 글목록 구하기 작업
        // =========================================
        int amount = 10; // 한 페이지 당 보여줄 글(레코드) 갯수
        int startRow = (pageNum - 1) * amount; // 시작행번호
        
        List<BoardVO> list = boardService.getBoards(startRow, amount, search);
        
        // =========================================
        //  페이지 블록 구하기 작업
        // =========================================
        int allRowCount = 0; // 전체 행 갯수
        
        allRowCount = boardService.getBoardCount(search);
        
        int maxPage = allRowCount / amount + (allRowCount % amount == 0 ? 0 : 1);
        // 1페이지 ~ maxPage 페이지까지 존재함.
        // -> 페이지 블록단위로 끊어줌

        // 시작페이지번호(1)             끝페이지번호(10)
        // 1 2 3 4 5 6 7 8 9 10             -- [블록구성 10개]
        
        // 시작페이지번호(11)             끝페이지번호(20)
        // 11 12 13 14 15 16 17 18 19 20   -- [블록구성 10개]
        
        // 시작페이지번호(21)             끝페이지번호(23)
        // 21 22 23                         -- [블록구성 3개]
        
        // 한 페이지블록을 구성하는 페이지갯수
        int pageBlockSize = 5;
        
        // 시작페이지번호 구하기
        int startPage = ((pageNum/pageBlockSize) - (pageNum%pageBlockSize==0 ? 1 : 0)) * pageBlockSize + 1;
        // 끝페이지번호 구하기
        int endPage = startPage + pageBlockSize - 1;
        if (endPage > maxPage) { // 마지막 블록에서 끝페이지번호 구하기
            endPage = maxPage;
        }
        
        
        Map<String, Integer> pageInfoMap = new HashMap<>();
        pageInfoMap.put("startPage", startPage); // 시작페이지번호
        pageInfoMap.put("endPage", endPage);     // 끝페이지번호
        pageInfoMap.put("pageBlockSize", pageBlockSize);//페이지블록크기
        pageInfoMap.put("maxPage", maxPage);     // 전체 페이지수
        pageInfoMap.put("allRowCount", allRowCount); // 전체 행갯수
        pageInfoMap.put("pageNum", pageNum); // 사용자가 요청한 페이지번호
        
        // model에 저장하면 스프링이 request 영역객체에 옮겨담아줌
        model.addAttribute("list", list); // 글목록 list 
        model.addAttribute("pageInfoMap", pageInfoMap); // 페이지블록 출력관련 데이터
        
        
        model.addAttribute("search", search); // 검색어
		
		return "contact";
	}//contact()
	
	@GetMapping("/movie")
	public String movie(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(required = false) String search, @RequestParam(required = false) String repNationNm, Model model) throws Exception {
		System.out.println("<< movie 호출 >>");
		
        int amount = 12; // 한 페이지 당 보여줄 글(레코드) 갯수
        int startRow = (pageNum - 1) * amount; // 시작행번호
        
        List<MovieVO> list = movieService.getMovies(startRow, amount, search, repNationNm);
        
        int allRowCount = 0; // 전체 행 갯수
        
        allRowCount = movieService.getMovieCount(search, repNationNm);
        
        int maxPage = allRowCount / amount + (allRowCount % amount == 0 ? 0 : 1);
        
        // 한 페이지블록을 구성하는 페이지갯수
        int pageBlockSize = 5;
        
        // 시작페이지번호 구하기
        int startPage = ((pageNum/pageBlockSize) - (pageNum%pageBlockSize==0 ? 1 : 0)) * pageBlockSize + 1;
        // 끝페이지번호 구하기
        int endPage = startPage + pageBlockSize - 1;
        if (endPage > maxPage) { // 마지막 블록에서 끝페이지번호 구하기
            endPage = maxPage;
        }
        
        Map<String, Integer> pageInfoMap = new HashMap<>();
        pageInfoMap.put("startPage", startPage); // 시작페이지번호
        pageInfoMap.put("endPage", endPage);     // 끝페이지번호
        pageInfoMap.put("pageBlockSize", pageBlockSize);//페이지블록크기
        pageInfoMap.put("maxPage", maxPage);     // 전체 페이지수
        pageInfoMap.put("allRowCount", allRowCount); // 전체 행갯수
        pageInfoMap.put("pageNum", pageNum); // 사용자가 요청한 페이지번호
        
        // model에 저장하면 스프링이 request 영역객체에 옮겨담아줌
        model.addAttribute("list", list); // list 
        model.addAttribute("pageInfoMap", pageInfoMap); // 페이지블록 출력관련 데이터
        
        model.addAttribute("category", repNationNm);
        model.addAttribute("search", search); // 검색어
        
        return "movie";
	}//movie()
	
	@GetMapping("/movieDetail")
	public String detail(int movieCd, Model model, HttpSession session){
		System.out.println("<< movieDetail >>");
		
		MovieInfoVO movieInfo = movieService.getMovieInfo(movieCd);
		model.addAttribute("movieInfo", movieInfo);
		
		String id = (String) session.getAttribute("sessionID");
		if (!(id == null || "".equals(id))) {
			movieService.insertWatchList(id, movieCd);
			System.out.println(id + " 시청 목록에 " + movieCd + " 영화 추가!");
			
			int count = movieService.countWishListByIdAndMovieCd(id, movieCd);
			if (count >= 1) {
				model.addAttribute("wishList", "selected");
			}
		}
		model.addAttribute("movieInfo", movieInfo);
		
	    return "movieDetail";
	}
	
	@GetMapping("/movieDetailJson")
	@ResponseBody
	public void detail(String id, int starInput, int movieCd) {
		System.out.println("<< movieStar >>");
		
		memberService.insertScore(id, starInput, movieCd);
		
//		memberService.updateAvg(movieCd);
		
	}
	
	@GetMapping("/wishList")
	public void wishList(String id, int movieCd) {
		System.out.println("<< wishList, GET >>");
		movieService.wishListProcess(id, movieCd);
	}
	

	// 각각 패키지 금액
	public final static int gold = 35000, silver = 20000, bronze = 8000;	

	@GetMapping("/purchase")
	public String purchase(HttpSession session, Model model) {
		System.out.println("<< purchase, GET >>");
		
		String id = (String) session.getAttribute("sessionID");
		
		MemberVO member = memberService.getMember(id);
		
		Map<String, Integer> packList = new HashMap<String, Integer>();
		packList.put("gold", gold);
		packList.put("silver", silver);
		packList.put("bronze", bronze);
		
		model.addAttribute("member", member);
		model.addAttribute("packList", packList);
		
		return "purchase/purchase";
	}
	
	
	

}
