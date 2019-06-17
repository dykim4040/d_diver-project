package com.exam.controller;


import java.io.PrintWriter;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.AuthVO;
import com.exam.domain.BoardVO;
import com.exam.domain.GetMemberScoreDTO;
import com.exam.domain.MemberVO;
import com.exam.domain.MovieInfoVO;
import com.exam.domain.MovieVO;
import com.exam.mapper.AuthMapper;
import com.exam.mapper.MemberMapper;
import com.exam.mapper.MovieMapper;
import com.exam.service.BoardService;
import com.exam.service.MemberService;
import com.exam.service.MovieService;

import lombok.Setter;

@Controller
public class HomeController {
	
	@Setter(onMethod_ = @Autowired)
	private AuthMapper authMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MovieMapper movieMapper;
	
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

		List<MovieVO> grade = movieService.gradeGetMovie(5);
		model.addAttribute("grade",grade);
		
		List<MovieVO> views = movieService.viewsGetMovie(5);
		model.addAttribute("views",views);
		
		String category = "애니메이션";
		List<MovieVO> catelist = movieService.categoryGetMovie(category, 5);
		model.addAttribute("catelist",catelist);
		model.addAttribute("category",category);
		
		return "index";
	}//main()
	
	@GetMapping("/myContents")
	public String myContents(Principal principal, Model model, HttpServletResponse response) throws Exception {
		System.out.println("<< myContents 호출 >>");
		
		if (principal == null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인이 필요합니다.');");
            out.println("location.href='member/login';");
            out.println("</script>");
            out.close();
            return null;
		}
		String id = principal.getName();
		
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
	   public String detail(int movieCd, Model model, Principal principal, HttpServletResponse response) throws Exception{
	      System.out.println("<< movieDetail >>");
	      
	      MovieInfoVO movieInfo = movieService.getMovieInfo(movieCd);
//	      model.addAttribute("movieInfo", movieInfo);
	      
	      if(principal == null) {
	          response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('로그인 후 이용해 주세요');");
	            out.println("location.href='member/login';");
	            out.println("</script>");
	            out.close();
	            return null;
	      }
	      
	      String id = principal.getName();
	      String packId = memberService.getCurrPackage(id);
	      
		System.out.println("packId :: " + packId);
		if (packId == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('패키지 구매 후 이용해 주세요');");
			out.println("location.href=history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		List<AuthVO> authList = authMapper.selectAuthListById(id);
		String watchGrade = movieService.getWatchGrade(movieCd);
		for (AuthVO auth : authList) {
			System.out.println("Auth : " + auth.getAuth());

			if (auth.getAuth().equals("ROLE_UNDER12")) {

				if (!watchGrade.equals("전체관람가")) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('시청 연령이 적절하지 않습니다.');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
					return null;
				}
			}

			if (auth.getAuth().equals("ROLE_UNDER15")) {

				if (watchGrade.equals("15세이상관람가") || watchGrade.equals("청소년관람불가")) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('시청 연령이 적절하지 않습니다.');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
					return null;
				}
	         }
	         
	         if (auth.getAuth().equals("ROLE_UNDER19")) {
	            
	            if (watchGrade.equals("청소년관람불가")) {
	               response.setContentType("text/html; charset=UTF-8");
	                  PrintWriter out = response.getWriter();
	                  out.println("<script>");
	                  out.println("alert('시청 연령이 적절하지 않습니다.');");
	                  out.println("history.back();");
	                  out.println("</script>");
	                  out.close();
	                  return null;
	            }
	         }
	      }
	      
	      
	      if (!(id == null || "".equals(id))) {
	         movieService.insertWatchList(id, movieCd);
	         System.out.println(id + " 시청 목록에 " + movieCd + " 영화 추가!");
	         
	         int count = movieService.countWishListByIdAndMovieCd(id, movieCd);
	         if (count >= 1) {
	            model.addAttribute("wishList", "selected");
	         }
	      }
	      GetMemberScoreDTO getMemberScoreDTO = new GetMemberScoreDTO();
	      getMemberScoreDTO.setId(id);
	      getMemberScoreDTO.setMovieCd(movieCd);
	      String url = movieMapper.movieUrl(movieCd);
	      if(url==null) {
	          url = "https://www.youtube.com/embed/pWemV6TiUZE";
	      }
	      
	      model.addAttribute("memberScore", movieService.getMemberScore(getMemberScoreDTO));
	      model.addAttribute("movieInfo", movieInfo);
	      model.addAttribute("url", url);
	      
	       return "movieDetail";
	   }
	
	@GetMapping("/movieDetailJson")
	@ResponseBody
	public void detail(int starInput, int movieCd, Principal principal) {
		System.out.println("<< movieStar >>");
		
		
		if (principal == null) {
			return;
		}
		String id = principal.getName();
		memberService.insertScore(id, starInput, movieCd);
	}
	
	@GetMapping("/wishList")
	@ResponseBody
	public void wishList(int movieCd, Principal principal) {
		System.out.println("<< wishList, GET >>");
		if (principal == null) {
			return;
		}
		movieService.wishListProcess(principal.getName(), movieCd);
	}
	

	// 각각 패키지 금액
	public final static int gold = 35000, silver = 20000, bronze = 8000;	

	@GetMapping("/purchase")
	public String purchase(Model model, Principal principal) {
		System.out.println("<< purchase, GET >>");
		if (principal == null) {
			return "purchase/purchase";
		}
		String id = principal.getName();
		System.out.println("id : " + id);
		
		MemberVO member = memberService.getMember(id);
		System.out.println("id : " + id);
		System.out.println(member);
		
		Date expireDate = memberMapper.getExpireDateById(id);
		System.out.println("Date : " + id);
		
		Map<String, Integer> packList = new HashMap<String, Integer>();
		packList.put("gold", gold);
		packList.put("silver", silver);
		packList.put("bronze", bronze);
		
		model.addAttribute("member", member);
		model.addAttribute("packList", packList);
		model.addAttribute("expireDate", expireDate);
		
		return "purchase/purchase";
	}
	
	
	

}
