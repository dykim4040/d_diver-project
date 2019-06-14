package com.exam.service;

import com.exam.domain.MemberVO;

public interface MemberService {
	
	public int join(MemberVO memberVO);

	public int loginCheck(String id, String password);
	
	public boolean isIdDupChecked(String id);
	
//	public List<MemberVO> getAllMembers();
	
	public MemberVO getMember(String id);

	public void upDateMember(MemberVO member);
	
	public boolean checkPw(String id, String password);
	
	public void deleteMember(String id);
	
	public void hintID(String id);
	
	public int countById(String id);
	
	
	
	public void hintUser(String id);
	
	public int updatePassword(String id , String password);
	
	public int countByhint(String hint);
	
	public String getHintById(String hint);
	
	
	/* 구매 관련 */
	
	public String getCurrPackage(String id);
	
	public int updateCash(int cash, String id);
	
	public int buyPackageUseCash(int price, String id);


	
	
	/* 구매 관련 */
	
	/* 별 스코어*/
	public int insertScore(String id, int starInput, int movieCd);
	
//	public int countByScore(int movieCd);
	
//	public int updateAvg(int movieCd);
	

}
