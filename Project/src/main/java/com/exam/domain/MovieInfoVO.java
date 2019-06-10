package com.exam.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MovieInfoVO {
    int movieCd;
    String movieNm;
    String movieNmEn;
    String repGenreNm;
    String repNationNm;
    String synopsis;
    String covUrl;
    String covThUrl;
    String watchGradeNm;
    Date openDt;
    int showTm;
    int views;
    int price;
    double avgScore;
    List<StarsInVO> starsIn;
    List<DirectorsInVO> directorsIn;
    List<CompaniesInVO> companiesIn;
    List<MovieGenreVO> movieGenre;
    List<MovieStillCutVO> movieStillCut;

    
}
