
package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.AuthVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.AuthMapper;
import com.exam.mapper.MemberMapper;
import com.exam.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
    
    @Setter(onMethod_ = @Autowired)
    private BCryptPasswordEncoder passwordEncoder;
    
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = @Autowired)
	private AuthMapper authMapper;
	
	@GetMapping("/login")
	public String login(String error, String logout, Model model, Principal principal) {
		System.out.println("<< login 호출 >>");
		
		if (error != null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 맞지 않습니다.");
        }
        
        if (logout != null) {
            model.addAttribute("logout", "로그아웃 완료!");
        }
        if (principal == null) {
        	return "member/login";
        }
        List<AuthVO> list = authMapper.selectAuthListById(principal.getName());
        System.out.println(list.size());
        System.out.println(list);
        
        
		return "member/login";
	}

//	@PostMapping("/login")
//	public ResponseEntity<String> login(MemberVO member, HttpSession session) {
//		System.out.println("<< login, POST >>");
//		int check = service.loginCheck(member.getId(), member.getPassword());
//
//		if (check != 1) { // 로그인 실패
//			String message = null;
//			if (check == -1) {
//				message = "해당하는 아이디가 없습니다.";
//			} else if (check == 0) {
//				message = "비밀번호가 다릅니다.";
//			} else {
//				message = "로그인 에러 발생, 다시 입력해주세요.";
//			}
//			HttpHeaders headers = new HttpHeaders();
//			headers.add("Content-Type", "text/html; charset=UTF-8");
//
//			StringBuffer msg = new StringBuffer();
//			msg.append("<script>");
//			msg.append("alert('" + message + "');");
//			msg.append("history.back();");
//			msg.append("</script>");
//
//			return new ResponseEntity<>(msg.toString(), headers, HttpStatus.OK);
//		}
//		session.setAttribute("sessionID", member.getId());
//		String pack = service.getCurrPackage(member.getId());
//		session.setAttribute("pack", pack);
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Location", "/"); // redirect 경로 위치
//		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
//	}

//	@GetMapping("/logout")
//	public String logout() {
//		System.out.println("<< logout, GET >>");
//
//		return "member/logout";
//	}
	
	
	// 만 나이 계산하는 메소드
	@SuppressWarnings("deprecation")
	public static int countAge(Date date) {
		Date now = new Date();
		int difYear = now.getYear() - date.getYear();
		int difMonth = now.getMonth() - date.getMonth();
		int difDate = now.getDate() - date.getDate();
		
		if (difDate < 0) {
			difMonth -= 1;
		}
		
		if (difMonth < 0) {
			difYear -= 1;
		}
		
		System.out.println(difYear + ", " + difMonth + ", " + difDate);
		
		return difYear;
	}
	

	@GetMapping("/join")
	public String join() {
		System.out.println("<< join 호출 >>");
		return "member/join";
	}

	@PostMapping("/join")
	public ResponseEntity<String> join(MemberVO memberVO) {
		System.out.println("<< joinProcess 호출 >>");
		
		String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
        memberVO.setPassword(encodedPassword);
        log.info(memberVO);
		
		service.join(memberVO);
		
		// 만 나이 계산해서 나이별로 권한 입력
		int age = countAge(memberVO.getBirthday());
		System.out.println(age);
		
		if (age < 12) {
			authMapper.insertAuth(memberVO.getId(), "ROLE_UNDER12");
			// 12세 미만, 전체관람가만 시청 가능
		} else if (age < 15) {
			authMapper.insertAuth(memberVO.getId(), "ROLE_UNDER15");
			// 15세 미만, 전체관람가, 12세이상관람가만 시청 가능 
		} else if (age < 19) {
			authMapper.insertAuth(memberVO.getId(), "ROLE_UNDER19");
			// 19세 미만, 전체관람가, 12세이상관람가, 15세이상관람가만 시청 가능
		} else {
			authMapper.insertAuth(memberVO.getId(), "ROLE_ADULT");
			// 성인, 모든 영화 시청 가능
		}
		
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");

		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('회원가입이 완료되었습니다.');");
		sb.append("location.href = '/member/login';");
		sb.append("</script>");

		ResponseEntity<String> responseEntity = new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);

		return responseEntity;
	}// join

	@GetMapping("/joinIdCheckJson")
	@ResponseBody
	public boolean joinIdCheckJson(String userId) {
		System.out.println("<< joinIdCheckJson 호출 >>");
		System.out.println(userId);
		return service.isIdDupChecked(userId);
	}

	@GetMapping("/myInfo")
	public String myInfo(Model model, Principal principal, HttpServletResponse response) throws Exception {
		System.out.println("<< myInfo 호출 >>");
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		if (principal == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='/';");
			out.println("</script>");
			out.close();
			return null;
		}
		String id = principal.getName();
		MemberVO member = service.getMember(id);
		String pack = service.getCurrPackage(id);
		
		if ("G".equals(pack)) {
			pack += "old";
		} else if ("S".equals(pack)) {
			pack += "ilver";
		} else if ("B".equals(pack)) {
			pack += "ronze";
		} else if (pack == null) {
			pack = "없음";
		}
		System.out.println("pack : [" + pack + "]");

		model.addAttribute("myPack", pack);
		model.addAttribute("member", member);
		System.out.println("아이디 : " + id);
		System.out.println("RegDate : " + member.getRegDate());

		return "member/myInfo";
	}

	@GetMapping("/memberDelete")
	public String delete() {
		System.out.println("<< delete 호출 >>");
	    
		return "member/delete";
	}

	@Transactional
	@PostMapping("/memberDelete")
	public String memberDelete(Model model, String id, String password, MemberVO memberVO, Principal principal, HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("<< delete 호출 >>");
		System.out.println("id : " + id);
		memberVO=memberMapper.getMemberById(id);
		
		String encodedPassword = memberVO.getPassword();;
		
		MemberVO member = service.getMember(id);
		model.addAttribute("member", member);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		if (passwordEncoder.matches(password, encodedPassword)) {
		    System.out.println("계정정보 일치");
		    service.deleteMember(id);
		    memberMapper.deleteAllPackageById(id);
		    authMapper.deleteAuthById(id, null);
		    
            out.println("<script>");
            out.println("alert('성공적으로 탈퇴하였습니다.');");
            out.println("location.href='/';");
            session.invalidate();
            out.println("</script>");
            out.close();
            return null;
	    } else {
	    	out.println("<script>");
            out.println("alert('비밀번호가 일치하지 않습니다.');");
            out.println("location.href='/member/memberDelete';");
            out.println("</script>");
            out.close();
	        System.out.println("계정정보 불일치");
	        model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
	        return null;
	    }
	}

	// 회원정보 수정하게 만들기
	@PostMapping("/upDate")
	public String upDateMember(String id, Model model) {
		System.out.println("<< upDate 호출 >>");

		MemberVO member = service.getMember(id);
		model.addAttribute("member", member);
		System.out.println("아이디 : " + id);

		return "member/upDate";
	}

	// 회원정보 수정 페이지 완료
	@PostMapping("/upDateInfo" )
	public String upDateMember(MemberVO memberVO , HttpServletResponse response) throws IOException {
		System.out.println("<< upDate 됬어요 호출 >>");
		
        String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
        memberVO.setPassword(encodedPassword);
		service.upDateMember(memberVO);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('정보가 수정 되었습니다.');");
		out.println("location.href='/'");
		out.println("</script>");
		out.close();
		return "/index";
	}
	

	// 아이디 찾기
	@GetMapping("/hintID")
	public String hintID() {
		System.out.println("<< hintID 호출 >>");
		return "member/hintID";
	}
	
	@PostMapping("/hintID")
	public String hintID(MemberVO member, Model model ) {
		System.out.println("<< hintID, POST >>"); 
//		int check = service.countById(member.getId());

		model.addAttribute("id", member.getId());
		return "member/hintUser";

	} 
	
	
	// 아이디찾기 완료했을때 힌트로넘어감
	@GetMapping("/hintUser")
	public String hintUser() {
		System.out.println("<< hintUser 호출 >>");
		return "member/hintUser";
	}

	@PostMapping("/hintUser")
	public String hintUser(MemberVO member, Model model ,HttpServletResponse response) throws IOException {
		System.out.println("<< hintUser, POST >>");
		System.out.println(member);
		String hint = service.getHintById(member.getId());

		if (!hint.equals(member.getHint())) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('답변이 맞지 않습니다.');");
            out.println("location.href='/member/hintID';");
            out.println("</script>");
            out.close();
            return null;
		}

		model.addAttribute("id", member.getId());

		return "member/hintPassword";
	}	 
	
	
	
	@GetMapping("/hintPassword")
	public String hintPassword() {
		System.out.println("<< hintPassword 호출 >>");
		return "member/hintPassword";
	}
	
	@PostMapping("/hintPassword")
	public String hintPassword(MemberVO member, Model model, HttpServletResponse response) throws IOException {
		System.out.println("<< hintPassword, POST >>"); 
		System.out.println(member);
		String encodedPassword = passwordEncoder.encode(member.getPassword());
		member.setPassword(encodedPassword);
		int check = service.updatePassword(member.getId() , member.getPassword());

		if (check >= 1) {
			System.out.println("비밀번호 " + check + " 수정 완료!");
			model.addAttribute("id", member.getId());
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('성공적으로 반영되었습니다.');");
            out.println("location.href='/member/login';");
            out.println("</script>");
            out.close();
            return null;
		}
	
		return "member/login";

	}

	
}
