package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.controller.HomeController;
import com.exam.domain.MemberVO;
import com.exam.domain.MovieVO;
import com.exam.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

	@Override
	public int join(MemberVO member) {
		return mapper.insert(member);
	}

	@Override
	public int loginCheck(String id, String password) {
		int check = -1;
		MemberVO memberVO = mapper.getMemberById(id);
		if (memberVO != null) {
			if (memberVO.getPassword().equals(password)) {
				check = 1;
			} else {
				check = 0;
			}
		} else {
			check = -1;
		}
		
		return check;
	}

	@Override
	public boolean isIdDupChecked(String id) {
		int count = mapper.countById(id);
		
		boolean isDup = false;
		if (count > 0) {
			isDup = true;
		}
		
		return isDup;
	}
	
//	@Override
//    public List<MemberVO> getAllMembers() {
//        return mapper.getList();
//    }
	
	@Override
	public MemberVO getMember(String id) {
		return mapper.getMemberById(id);
	}

	@Override
	public void upDateMember(MemberVO member) {
		mapper.upDateMember(member);
	}
	
	@Transactional
	@Override
	public void deleteMember(String id) {
		mapper.deleteMember(id);
		mapper.deleteAllPackageById(id);
	}
	
	
	@Override
    public boolean checkPw(String id, String password) {
	    boolean result = false;
	      
	    if(password.equals(mapper.checkPw(id))) {
             result = true;
          } 
	      
	    return result;
	}
	
	@Override
	public void hintID(String id) {
		mapper.hintID(id);
	}
	
	@Override
	public void hintUser(String id) {
		mapper.hintUser(id);
	}
	
	@Override
	public int updatePassword(String id ,String password) {
		return mapper.updatePassword(id,password);
	}
	
	@Override
	public int countById(String id) {
		return mapper.countById(id);
	}
	@Override
	public String getHintById(String hint) {
		return mapper.getHintById(hint);
	}
	@Override
	public int countByhint(String hint) {
		// TODO Auto-generated method stub
		return 0;
	}
		
	
	
	
	
	
	
	
	
	
	/* 구매 관련 */
	
	@Override
	public String getCurrPackage(String id) {
		return mapper.getCurrPackageById(id);
	}

	@Override
	public int updateCash(int cash, String id) {
		MemberVO memberVO = mapper.getMemberById(id);
		int newCash = memberVO.getCash() + cash;
		return mapper.updateCash(newCash, id);
	}

	@Transactional
	@Override
	public int buyPackageUseCash(int price, String id) {
		MemberVO memberVO = mapper.getMemberById(id);
		int cash = memberVO.getCash() - price;
		System.out.println("MemberServiceImpl : " + cash);
		
		if (cash < 0) {
			return 0;
		}
		mapper.updateCash(cash, id);
		
		int month = 0;
		String pack = "";
		if (price == HomeController.gold) {
			pack = "G";
			month = 6;
		} else if (price == HomeController.silver) {
			pack = "S";
			month = 3;
		} else if (price == HomeController.bronze) {
			pack = "B";
			month = 1;
		}
		
		return mapper.insertPackage(id, pack, month);
	}

	

	/* 구매 관련 */
	
	/*별 관련*/
	
	@Transactional
	@Override
	public int insertScore(String id, int starInput, int movieCd) {
		  mapper.insertScore(id, starInput, movieCd);
		
		 return mapper.updateAvg(movieCd);
	}


//	@Override
//	public int countByScore(int movieCd) {
//		return mapper.countByScore(movieCd);
//	}

//	@Override
//	public int updateAvg(int movieCd) {
//		// TODO Auto-generated method stub
//		return mapper.updateAvg(movieCd);
//	}

	

	


	
	
	
	
	
	
}
