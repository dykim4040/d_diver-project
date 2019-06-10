package com.exam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.domain.MemberVO;
import com.exam.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@GetMapping("/login")
	public String login() {
		System.out.println("<< login 호출 >>");
		return "member/login";
	}

	@PostMapping("/login")
	public ResponseEntity<String> login(MemberVO member, HttpSession session) {
		System.out.println("<< login, POST >>");
		int check = service.loginCheck(member.getId(), member.getPassword());

		if (check != 1) { // 로그인 실패
			String message = null;
			if (check == -1) {
				message = "해당하는 아이디가 없습니다.";
			} else if (check == 0) {
				message = "비밀번호가 다릅니다.";
			} else {
				message = "로그인 에러 발생, 다시 입력해주세요.";
			}
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");

			StringBuffer msg = new StringBuffer();
			msg.append("<script>");
			msg.append("alert('" + message + "');");
			msg.append("history.back();");
			msg.append("</script>");

			return new ResponseEntity<>(msg.toString(), headers, HttpStatus.OK);
		}
		session.setAttribute("sessionID", member.getId());
		String pack = service.getCurrPackage(member.getId());
		session.setAttribute("pack", pack);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/"); // redirect 경로 위치
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("<< logout, GET >>");
		session.invalidate();

		return "index";
	}

	@GetMapping("/join")
	public String join() {
		System.out.println("<< join 호출 >>");
		return "member/join";
	}

	@PostMapping("/join")
	public ResponseEntity<String> join(MemberVO member) {
		System.out.println("<< joinProcess 호출 >>");

		service.join(member);

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
	public String myInfo(String id, Model model) {
		System.out.println("<< myInfo 호출 >>");

		MemberVO member = service.getMember(id);
		String pack = service.getCurrPackage(id);
		
		if ("G".equals(pack)) {
			pack += "old";
		} else if ("S".equals(pack)) {
			pack += "ilver";
		} else if ("B".equals(pack)) {
			pack += "ronze";
		}

		model.addAttribute("pack", pack);
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

	@PostMapping("/memberDelete")
	public String memberDelete(String id, String password, HttpSession session, Model model) {
		System.out.println("<< delete 호출 >>");

		boolean result = service.checkPw(id, password);
		if (result) {
			service.deleteMember(id);
			session.invalidate();
			return "redirect:/";
		}
		model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
		return "member/delete";
	}

	// 회원정보수정하게만들기
	@PostMapping("/upDate")
	public String upDateMember(String id, Model model) {
		System.out.println("<< upDate 호출 >>");

		MemberVO member = service.getMember(id);
		model.addAttribute("member", member);
		System.out.println("아이디 : " + id);

		return "member/upDate";
	}

	// 회원정보수정페이지완료
	@PostMapping("/upDateInfo")
	public String upDateMember(MemberVO memberVO) {
		System.out.println("<< upDate 됬어요 호출 >>");
		service.upDateMember(memberVO);
		
		return "member/login";
	}
	

	// 아이디찾기
	@GetMapping("/hintID")
	public String hintID() {
		System.out.println("<< hintID 호출 >>");
		return "member/hintID";
	}
	
	@PostMapping("/hintID")
	public String hintID(MemberVO member, Model model) {
		System.out.println("<< hintID, POST >>"); 
		int check = service.countById(member.getId());
		HttpHeaders headers = new HttpHeaders();
		StringBuffer msg = new StringBuffer();

		
		/*
		 * String message = ""; if (check != 1) { // 로그인 실패 String message = null; if
		 * (check == -1) { message message = "아이디를 정확하게 입력해주세요."; }
		 * headers.add("Content-Type", "text/html; charset=UTF-8");
		 * msg.append("<script>"); msg.append("alert('" + message + "');");
		 * msg.append("history.back();"); msg.append("</script>"); } else if (check ==
		 * 1) { message = "아이디를 확인하였습니다."; headers.add("Content-Type",
		 * "text/html; charset=UTF-8"); msg.append("<script>"); msg.append("alert('" +
		 * message + "');"); msg.append("location.href = '/member/hintUser';");
		 * msg.append("</script>"); }
		 */

		model.addAttribute("id", member.getId());
		return "member/hintUser";

	} //내일 위에처럼 String 으로 다바꿔주세요
	
	
	
	
	  //아이디찾기 완료했을때 힌트로넘어감
	  
	  @GetMapping("/hintUser") 
	  public String hintUser() {
	  System.out.println("<< hintUser 호출 >>"); 
	  return "member/hintUser";
	  
	  }
	  
	  @PostMapping("/hintUser") 
	  public String hintUser(MemberVO member, Model model) { 
		  System.out.println("<< hintUser, POST >>");
	  System.out.println(member); 
	  String hint = service.getHintById(member.getId()); HttpHeaders headers = new HttpHeaders();
	  StringBuffer msg = new StringBuffer();
	  
	  if(hint.equals(member.getHint())) {
		  }
	  		else {
	  			return "member/hintID";
	  }
	  
	  
	  model.addAttribute("id", member.getId());
	  
	  
	 return "member/hintPassword"; }
	 
	//아이디찾기 완료했을때 힌트로넘어감
	/*
	 * @GetMapping("/hintUser") public String hintUser() {
	 * System.out.println("<< hintUser 호출 >>"); return "member/hintUser"; }
	 * 
	 * @PostMapping("/hintUser") public ResponseEntity<String> hintUser(MemberVO
	 * member, HttpSession session) { System.out.println("<< hintUser, POST >>");
	 * int check = service.countByhint(member.getHint()); HttpHeaders headers = new
	 * HttpHeaders(); StringBuffer msg = new StringBuffer();
	 * 
	 * String message = ""; if (check != 1) { // message = "해당하는 힌트가 없습니다.";
	 * headers.add("Content-Type", "text/html; charset=UTF-8");
	 * msg.append("<script>"); msg.append("alert('" + message + "');");
	 * msg.append("history.back();"); msg.append("</script>"); } else if (check ==
	 * 1) { message = "비밀번호확인"; headers.add("Content-Type",
	 * "text/html; charset=UTF-8"); msg.append("<script>"); msg.append("alert('" +
	 * message + "');"); msg.append("location.href = '/member/hintUser';");
	 * msg.append("</script>"); } return new ResponseEntity<>(msg.toString(),
	 * headers, HttpStatus.OK);
	 * 
	 * }
	 */
	
	
	@GetMapping("/hintPassword")
	public String hintPassword() {
		System.out.println("<< hintPassword 호출 >>");
		return "member/hintPassword";
	}
	@PostMapping("/hintPassword")
	public String hintPassword(MemberVO member, Model model) {
		System.out.println("<< hintPassword, POST >>"); 
		System.out.println(member);
		int check = service.updatePassword(member.getId() , member.getPassword());
		HttpHeaders headers = new HttpHeaders();
		StringBuffer msg = new StringBuffer();
		

		/*
		 * String message = ""; if (!id.equals(member.getHint())) { message = "비밀번호 실패";
		 * headers.add("Content-Type", "text/html; charset=UTF-8");
		 * msg.append("<script>"); msg.append("alert('" + message + "');");
		 * msg.append("history.back();"); msg.append("</script>"); } else { message =
		 * "비밀번호 수정"; headers.add("Content-Type", "text/html; charset=UTF-8");
		 * msg.append("<script>"); msg.append("alert('" + message + "');");
		 * msg.append("location.href = '/member/hintPassword';");
		 * msg.append("</script>"); }
		 */
		model.addAttribute("id", member.getId());
	
		return "member/login";

	}

	
}
