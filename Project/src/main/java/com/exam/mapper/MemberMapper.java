package com.exam.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.MemberVO;

public interface MemberMapper {
	
	public int insert(MemberVO member);

	public MemberVO getMemberById(String id);

	public int countById(String id);

	public String checkPw(String id);

	public void upDateMember(MemberVO member);
	
	public void deleteMember(String id);
	
	public void hintID(String id);
	
	public void hintUser(String id);
	
	public String getHintById(String hint);	
	
	public int updatePassword(@Param("id") String id , @Param("password")String password);

	public List<MemberVO> getMemberList();
	
	
	
	
	
	/* 구매 관련 */
	
	public String getCurrPackageById(String id);
	
	public Date getExpireDateById(String id);
	 
	public int updateCash(@Param("cash") int cash, @Param("id") String id);
	
	public int insertPackage(@Param("id") String id, @Param("pack") String pack, @Param("month") int month);

	public int deleteAllPackageById(String id);
	
	/* 구매 관련 */
	
	
	/* 별 점 Score*/
	public int insertScore(@Param("id") String id,@Param("starInput") int starInput,@Param("movieCd") int movieCd);

	
//	public int countByScore(int movieCd);
	
	public int updateAvg(int movieCd);
}

