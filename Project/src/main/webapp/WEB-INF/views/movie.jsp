<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Food Blog - Web Template</title>
<meta charset="UTF-8">
<meta name="description" content="Food Blog Web Template">
<meta name="keywords" content="food, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->   
<link href="/resources/img/w.png" rel="shortcut icon"/>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,500,500i,600,600i,700" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"/>
<link rel="stylesheet" href="/resources/css/owl.carousel.css"/>
<link rel="stylesheet" href="/resources/css/animate.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link rel="stylesheet" href="/resources/css/custom.css" />

<script src="/resources/script/jquery-3.3.1.min.js"></script>
<script>
$(function() {
	
	var category = $('#category').html();
	console.log(category);
	
	for (i = 0; i < 18; i++) {
		var option = $('#c' + i).html();
		if (option == category) {
			$('#select option').removeAttr("selected");
			$('#c' + i).attr("selected", "selected");
		}
	}
	
});
</script>
<style>
 .ratt{
		background-image: url('/resources/img/grade_img.png');
        background-repeat: no-repeat;
        vertical-align: middle;
        display: inline-block;
        width: 80px;
        height: 16px;
        background-size: 80px 32px;
        white-space: nowrap;
        position: relative;
       
   }
   .rat{
       display: inline-block;
       background-size: 80px 32px;
       background-position: 0 bottom;
       height: 16px;
       position: absolute;
       background-image: url('/resources/img/grade_img.png');
       background-repeat: no-repeat;
       vertical-align: middle;
       
   }
</style>
</head>
<body>
	<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>

<!-- Header section -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
<!-- Header section end -->


<!-- Hero section -->
<section class="page-top-section set-bg" data-setbg="/resources/img/page-top-bg.jpg">
	<div class="container">
		<h2>영화</h2>
	</div>
</section>
<!-- Hero section end -->


<!-- Search section -->
<div id="category" style="display: none;">${category }</div>
<div class="search-form-section">
<div class="sf-warp">
	<div class="container">
		<form class="big-search-form">
			<select id="select" name="repNationNm">
				<option id="c0" value="">영화 카테고리</option>
				<option id="c1">드라마</option>
	            <option id="c2">멜로/로맨스</option>
	            <option id="c3">SF</option>
	            <option id="c4">애니메이션</option>
	            <option id="c5">판타지</option>
	            <option id="c6">액션</option>
	            <option id="c7">가족</option>
	            <option id="c8">스릴러</option>
	            <option id="c9">코미디</option>
	            <option id="c10">공포(호러)</option>
	            <option id="c11">범죄</option>
	            <option id="c12">사극</option>
	            <option id="c13">전쟁</option>
	            <option id="c14">미스터리</option>
	            <option id="c15">뮤지컬</option>
	            <option id="c16">어드벤처</option>
	            <option id="c17">기타</option>
			</select>
			<input type="text" name="search" class="input_box" value="${search}" placeholder="검색">
			<button class="bsf-btn">검색</button>
		</form>
	</div>
</div>
</div>
<!-- Search section end -->


<!-- 추천영화 section -->
<section class="recipes-page spad">
<div class="container" id="list">
	<div class="row">
		<div class="col-md-8">
			<div class="section-title">
			<c:choose>
			<c:when test="${category == null || category == '' }">
				<c:choose>
				<c:when test="${search == null || search == '' }">
					<h2>All Movies</h2>
				</c:when>
				<c:otherwise>
					<h2>"${search }" 검색결과</h2>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${search == null || search == '' }">
				<h2>${category } 검색결과</h2>
			</c:when>
			<c:otherwise>
				<h2>${category } "${search }" 검색결과</h2>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
<!-- 		<div class="col-md-4"> -->
<!-- 			<div class="recipe-view"> -->
<!-- 				<i class="fa fa-bars"></i> -->
<!-- 				<i class="fa fa-th active"></i> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<div class="row">
	<c:choose>
	<c:when test="${not empty list}">
		<c:forEach var="movie" items="${list}">		
		<div class="col-lg-4 col-md-6">
			<div class="recipe">
				<a href="/movieDetail?movieCd=${movie.movieCd}"><img src="${movie.covThUrl}" width="350px" height="500px"></a>
				<div class="recipe-info-warp">
					<div class="recipe-info">
						<h3>${movie.movieNm}</h3>
						<c:choose>
							<c:when test="${movie.avgScore == null}">
							<div class="ratt"></div>
							</c:when>
							<c:when test="${movie.avgScore > 0 &&  movie.avgScore <= 1}">
							<div class="ratt">
							<div class="rat" style="width: 8px; z-index: 10;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 1 &&  movie.avgScore <= 2}">
							<div class="ratt">
							<div class="rat" style="width: 16px; z-index: 9;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 2 &&  movie.avgScore <= 3}">
							<div class="ratt">
							<div class="rat" style="width: 24px; z-index: 8;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 3 &&  movie.avgScore <= 4}">
							<div class="ratt">
							<div class="rat" style="width: 32px; z-index: 7;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 4 &&  movie.avgScore <= 5}">
							<div class="ratt">
							<div class="rat" style="width: 40px; z-index: 6;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 5 &&  movie.avgScore <= 6}">
							<div class="ratt">
							<div class="rat" style="width: 48px; z-index: 5;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 6 &&  movie.avgScore <= 7}">
							<div class="ratt">
							<div class="rat" style="width: 56px; z-index: 4;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 7 &&  movie.avgScore <= 8}">
							<div class="ratt">
							<div class="rat" style="width: 64px; z-index: 3;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 8 &&  movie.avgScore <= 9}">
							<div class="ratt">
							<div class="rat" style="width: 72px; z-index: 2;"></div>
							</div>
							</c:when>
							<c:when test="${movie.avgScore > 9 &&  movie.avgScore <= 10}">
							<div class="ratt">
							<div class="rat" style="width: 80px; z-index: 1;"></div>
							</div>
							</c:when>
						</c:choose>
						
						${movie.avgScore}
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</c:when>
	<c:otherwise>		
		<div><h3>영화가 없습니다.</h3></div>
	</c:otherwise>
	</c:choose>
   </div>


	<div class="site-pagination">
		<c:if test="${pageInfoMap.allRowCount gt 0}">
		<!-- 이전 블록이 존재하는지 확인 -->
		<c:if test="${pageInfoMap.startPage gt pageInfoMap.pageBlockSize}">
			<a href="/movie?repNationNm=${category }&search=${search }&pageNum=1&#list">1</a><span class="more-page">...</span>
			<a href="/movie?repNationNm=${category }&search=${search}&pageNum=${pageInfoMap.startPage - 1}&#list">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pageInfoMap.startPage}" end="${pageInfoMap.endPage}" step="1">
			<c:choose>
			<c:when test="${i eq pageInfoMap.pageNum}">
				<span>${i }</span>
			</c:when>
			<c:otherwise>
				<a href="/movie?repNationNm=${category }&search=${search}&pageNum=${i}&#list">${ i }</a>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 다음 블록이 존재하는지 확인 -->
		<c:if test="${pageInfoMap.endPage lt pageInfoMap.maxPage}">
			<a href="/movie?repNationNm=${category }&search=${search}&pageNum=${pageInfoMap.startPage + pageInfoMap.pageBlockSize}&#list">다음</a>
			<span class="more-page">...</span>
			<a href="/movie?repNationNm=${category }&search=${search }&pageNum=${pageInfoMap.maxPage }&#list">${pageInfoMap.maxPage }</a>
		</c:if>
		</c:if>
	</div>
	</div>
</section>
<!-- Recipes section end -->



<!-- Gallery section -->
<div class="gallery">
<div class="gallery-slider owl-carousel">
	<div class="gs-item set-bg" data-setbg="/resources/img/instagram/1.jpg"></div>
	<div class="gs-item set-bg" data-setbg="/resources/img/instagram/2.jpg"></div>
	<div class="gs-item set-bg" data-setbg="/resources/img/instagram/3.jpg"></div>
	<div class="gs-item set-bg" data-setbg="/resources/img/instagram/4.jpg"></div>
	<div class="gs-item set-bg" data-setbg="/resources/img/instagram/5.jpg"></div>
	<div class="gs-item set-bg" data-setbg="/resources/img/instagram/6.jpg"></div>
</div>
</div>
<!-- Gallery section end -->


<!-- Footer section  -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
<!-- Footer section end -->


<!--====== Javascripts & Jquery ======-->
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>