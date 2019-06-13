package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.domain.GetMemberScoreDTO;
import com.exam.domain.MovieInfoVO;
import com.exam.domain.MovieVO;
import com.exam.mapper.MovieMapper;

import lombok.Setter;

@Service("MovieService")
public class MovieServiceImpl implements MovieService {
    
    @Setter(onMethod_ = @Autowired)
    private MovieMapper mapper;
    
    @Override
    public List<MovieVO> getMovies(int startRow, int amount, String search, String repNationNm) throws Exception {
        System.out.println("search, rep : " + search + " : " + repNationNm);
        return mapper.getMovies(startRow, amount, search, repNationNm);
    }

    @Override
    public int getMovieCount(String search, String repNationNm) {
        return mapper.getMovieCount(search, repNationNm);
    }

    @Override
    public MovieVO getMovie(int movieCd) {
        return mapper.getMovie(movieCd);
    }

    @Override
    public List<MovieVO> newGetMovie(int amount) throws Exception{
        return mapper.newGetMovie(amount);
    }
    @Override
    public List<MovieVO> gradeGetMovie(int amount) throws Exception{
        return mapper.gradeGetMovie(amount);
    }
    @Override
    public List<MovieVO> viewsGetMovie(int amount) throws Exception{
        return mapper.viewsGetMovie(amount);
    }
    
    public List<MovieVO> categoryGetMovie(String category , int amount ) throws Exception {
    	return mapper.categoryGetMovie(category,amount);
    }
    
    
    
    
	/* 내 컨텐츠 */

    @Transactional
	@Override
	public void insertWatchList(String id, int movieCd) {
    	int watchListSize = 20; // 시청 목록 크기
    	
		int count = mapper.countWatchListByIdAndMovieCd(id, movieCd);
		if (count == 1) {
			mapper.deleteWatchList(id, movieCd);
			System.out.println("<< 중복된 시청 목록 삭제! >>");
		}
		
		int countAll = mapper.countWatchListByIdAndMovieCd(id, 0);
		System.out.println("Watch List By " + id + " : " + countAll);
		
		for (int i = 0; i <= countAll - watchListSize; i++) {
			mapper.deleteFullWatchList(id);
			System.out.println("<< 가장 오래된 시청 목록 삭제! >>");
		} // 시청 목록은 최대 watchListSize 크기까지 DB에 저장되며, 넘어가면 오래된 순으로 삭제됨
		
		mapper.insertWatchList(id, movieCd);
	}
	
	@Override
	public List<MovieVO> getWatchList(String id, int amount) {
		return mapper.getWatchList(id, amount);
	}

	@Override
	public void wishListProcess(String id, int movieCd) {
		int count = mapper.countWishListByIdAndMovieCd(id, movieCd);
		if (count >= 1) { // 즐겨찾기에 이미 존재하는 경우 그 존재하는 값 삭제
			mapper.deleteWishList(id, movieCd);
			System.out.println("즐겨찾기 삭제 완료!");
		} else { // 존재하지 않는 경우 새 값을 즐겨찾기 테이블에 입력
			mapper.insertWishList(id, movieCd);
			System.out.println("즐겨찾기 추가 완료!");
		}
	}
	
	@Override
	public int countWishListByIdAndMovieCd(String id, int movieCd) {
		return mapper.countWishListByIdAndMovieCd(id, movieCd);
	}
	
	@Override
	public List<MovieVO> getWishList(String id, int amount) {
		return mapper.getWishList(id, amount);
	}

	/* 내 컨텐츠 */
	@Transactional
    @Override
    public MovieInfoVO getMovieInfo(int movieCd) {
        mapper.upViews(movieCd);
        return mapper.getMovieInfo(movieCd);
    }

	@Override
	public Integer getMemberScore(GetMemberScoreDTO getMemberScoreDTO) {
	    return mapper.getMemberScore(getMemberScoreDTO);
	}

	@Override
	public String getWatchGrade(int movieCd) {
		return mapper.getWatchGrade(movieCd);
	}

	
	

}
