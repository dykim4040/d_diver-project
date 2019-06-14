package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.GetMemberScoreDTO;
import com.exam.domain.MovieInfoVO;
import com.exam.domain.MovieVO;
import com.exam.domain.movieUrlVO;

public interface MovieMapper {

    public List<MovieVO> getMovies(@Param("startRow") int startRow, @Param("amount") int amount, @Param("search") String search, @Param("repNationNm") String repNationNm);
    
    public int getMovieCount(@Param("search") String search, @Param("repNationNm") String repNationNm);
    
    public MovieVO getMovie(int movieCd);
    
    public List<MovieVO> newGetMovie(int amount);
    
    public List<MovieVO> gradeGetMovie(int amount);
    
    public List<MovieVO> viewsGetMovie(int amount);
    
    public List<MovieVO> categoryGetMovie(@Param("category") String category,@Param("amount") int amount);
    
    public String movieUrl(int movieCd);
    
    /* 내 컨텐츠 */
	
	public void insertWatchList(@Param("id") String id, @Param("movieCd") int movieCd);
	
	public int countWatchListByIdAndMovieCd(@Param("id") String id, @Param("movieCd") int movieCd);
	
	public void deleteWatchList(@Param("id") String id, @Param("movieCd") int movieCd);
	
	public void deleteFullWatchList(String id);
	
	public List<MovieVO> getWatchList(@Param("id") String id, @Param("amount") int amount);
	
	
	public void insertWishList(@Param("id") String id, @Param("movieCd") int movieCd);
	
	public int countWishListByIdAndMovieCd(@Param("id") String id, @Param("movieCd") int movieCd);
	
	public void deleteWishList(@Param("id") String id, @Param("movieCd") int movieCd);
	
	public List<MovieVO> getWishList(@Param("id") String id, @Param("amount") int amount);
	
	/* 내 컨텐츠 */
	
	
    public MovieInfoVO getMovieInfo(int movieCd);
    
    public void upViews(int movieCd);
    
    public Integer getMemberScore(GetMemberScoreDTO getMemberScoreDTO);
    
    public String getWatchGrade(int movieCd);
	
    
}
