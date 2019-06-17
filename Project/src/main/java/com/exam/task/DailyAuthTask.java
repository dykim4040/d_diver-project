package com.exam.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.exam.controller.MemberController;
import com.exam.domain.AuthVO;
import com.exam.domain.MemberVO;
import com.exam.mapper.AuthMapper;
import com.exam.mapper.MemberMapper;

import lombok.Setter;

@Component
public class DailyAuthTask {
	
	@Setter(onMethod_ = @Autowired)
	public AuthMapper authMapper;
	
	@Setter(onMethod_ = @Autowired)
	public MemberMapper memberMapper;

	// http://www.cronmaker.com/
	@Scheduled(cron = "0 0 0 * * *")
	public void authTask() {
		System.out.println("\"시청 연령\" 권한 갱신");
		
//		List<String> idList = new ArrayList<String>();
		List<MemberVO> memberList = memberMapper.getMemberList(); // 전체 회원 목록
		int count = 0;
		
		for (MemberVO member : memberList) {
			List<AuthVO> authList = authMapper.selectAuthListById(member.getId()); // 해당 회원의 권한 리스트(1개 이상일 수 있으므로 List)
			
			for (AuthVO auth : authList) {
				if (auth.getAuth().equals("ROLE_UNDER12")) {
					int age = MemberController.countAge(member.getBirthday());
					
					if (age >= 12) {
						authMapper.deleteAuthById(member.getId(), "ROLE_UNDER12");
						authMapper.insertAuth(member.getId(), "ROLE_UNDER15");
						count++;
						System.out.println(member.getId() + "의 연령이 " + age + "로 변경됨에 따라 'ROLE_UNDER12' 권한에서 'ROLE_UNDER15' 권한으로 변경");
					}
				} else if (auth.getAuth().equals("ROLE_UNDER15")) {
					int age = MemberController.countAge(member.getBirthday());
					
					if (age >= 15) {
						authMapper.deleteAuthById(member.getId(), "ROLE_UNDER15");
						authMapper.insertAuth(member.getId(), "ROLE_UNDER19");
						count++;
						System.out.println(member.getId() + "의 연령이 " + age + "로 변경됨에 따라 'ROLE_UNDER15' 권한에서 'ROLE_UNDER19' 권한으로 변경");
					}
				} else if (auth.getAuth().equals("ROLE_UNDER19")) {
					int age = MemberController.countAge(member.getBirthday());
					
					if (age >= 19) {
						authMapper.deleteAuthById(member.getId(), "ROLE_UNDER19");
						authMapper.insertAuth(member.getId(), "ROLE_ADULT");
						count++;
						System.out.println(member.getId() + "의 연령이 " + age + "로 변경됨에 따라 'ROLE_UNDER19' 권한에서 'ROLE_ADULT' 권한으로 변경");
					}
				}
				
			}
			
		}
		
		System.out.println("\n만 나이에 따른 권한 최신화 작업 총 " + count + "회 수행!\n");
		
		
	}
	
	
	
	
}
