package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.exam.domain.MovieInfoVO;
import com.exam.domain.MovieVO;

public interface MovieMapper {

    public List<MovieVO> getMovies(@Param("startRow") int startRow, @Param("amount") int amount, @Param("search") String search, @Param("repNationNm") String repNationNm);
    
    public int getMovieCount(@Param("search") String search, @Param("repNationNm") String repNationNm);
    
    public MovieVO getMovie(int movieCd);
    
    public List<MovieVO> newGetMovie(int amount);
    
    
    
    
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
    
    
}
