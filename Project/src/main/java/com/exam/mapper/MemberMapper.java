package com.exam.mapper;

import java.util.List;



import org.apache.ibatis.annotations.Param;

import com.exam.domain.MemberVO;
import com.exam.domain.MovieScoreDTO;
import com.exam.domain.MovieVO;

public interface MemberMapper {
	public int insert(MemberVO member);

	public MemberVO getMemberById(String id);

	public int countById(String id);

	public List<MemberVO> getList();

	public String checkPw(String id);

	public void upDateMember(MemberVO member);
	
	public void deleteMember(String id);
	
	public void hintID(String id);
	
	public void hintUser(String id);
	
	public String getHintById(String hint);	
	
	public int updatePassword(@Param("id") String id , @Param("password")String password);

	
	
	
	
	
	/* 구매 관련 */
	
	public String getCurrPackageById(String id);
	 
	public int updateCash(@Param("cash") int cash, @Param("id") String id);
	
	public int insertPackage(@Param("id") String id, @Param("pack") String pack, @Param("month") int month);

	/* 구매 관련 */
	
	
	/* 별 점 Score*/
	public int insertScore(@Param("id") String id,@Param("starInput") int starInput,@Param("movieCd") int movieCd);

	
//	public int countByScore(int movieCd);
	
	public int updateAvg(int movieCd);
}

