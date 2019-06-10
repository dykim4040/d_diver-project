package com.exam.service;

import java.util.List;

import com.exam.domain.MovieInfoVO;
import com.exam.domain.MovieVO;

public interface MovieService {
    
    public List<MovieVO> getMovies(int startRow, int amount, String search, String repNationNm) throws Exception;
    
    public int getMovieCount(String search, String repNationNm);
    
    public MovieVO getMovie(int movieCd);
    
    public List<MovieVO> newGetMovie(int amount) throws Exception;
    

    
	/* 내 컨텐츠 */
	
	public void insertWatchList(String id, int movieCd);
	
	public List<MovieVO> getWatchList(String id, int amount);
	
	public void wishListProcess(String id, int movieCd);
	
	public int countWishListByIdAndMovieCd(String id, int movieCd);
	
	public List<MovieVO> getWishList(String id, int amount);
	
	/* 내 컨텐츠 */
    
    public MovieInfoVO getMovieInfo(int movieCd);
    
}

