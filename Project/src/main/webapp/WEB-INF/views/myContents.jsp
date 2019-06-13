<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Webfilx - 내 컨텐츠</title>
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
<section class="page-top-section set-bg" data-setbg="/resources/img/movie.jpg">
	<div class="container">
		<h2>내 컨텐츠</h2>
	</div>
</section>
<!-- Hero section end -->



<!-- About section -->
<section class="about-section spad">
<div class="container">
	<div class="section-title">
		<h2>시청 목록</h2>
	</div>
	<div class="row">
	<c:choose>
	<c:when test="${not empty watchList}">
	<c:forEach var="movie" items="${watchList}">
		<div class="col-lg-4 col-md-6">
		<div class="recipe">
			<a href="/movieDetail?movieCd=${movie.movieCd}">
				<img src="${movie.covThUrl}" width="350px" height="500px">
			</a>
			<div class="recipe-info-warp">
			<div class="recipe-info">
			<h3>${movie.movieNm}</h3>
			<c:choose>
				<c:when test="${movie.avgScore == null}">
				<div class="ratt"></div>
				</c:when>
				<c:when test="${movie.avgScore == 0 }">
					<div class="ratt">
				<div class="rat" style="width: 0px;"></div>
				</div>
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
		<div class="col-lg-4 col-md-6"><div class="recipe">
		시청 목록이 없습니다.
		</div></div>
	</c:otherwise>
	</c:choose>
	</div>
</div>
</section>

<section class="about-section spad">
<div class="container">
	<div class="section-title">
		<h2>즐겨찾기</h2>
	</div>
	<div class="row">
	<c:choose>
	<c:when test="${not empty wishList}">
	<c:forEach var="movie" items="${wishList}">
		<div class="col-lg-4 col-md-6">
		<div class="recipe">
			<a href="/movieDetail?movieCd=${movie.movieCd}">
				<img src="${movie.covThUrl}" width="350px" height="500px">
			</a>
			<div class="recipe-info-warp">
			<div class="recipe-info">
			<h3>${movie.movieNm}</h3>
			<c:choose>
				<c:when test="${movie.avgScore == null}">
				<div class="ratt"></div>
				</c:when>
				<c:when test="${movie.avgScore == 0 }">
					<div class="ratt">
				<div class="rat" style="width: 0px;"></div>
				</div>
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
		<div class="col-lg-4 col-md-6"><div class="recipe">
		즐겨찾기로 저장한 목록이 없습니다.
		</div></div>
	</c:otherwise>
	</c:choose>	
	</div>
</div>
</section>
<!-- About section end -->



<!-- Gallery section -->
<jsp:include page="/WEB-INF/views/inc/slider.jsp"></jsp:include>
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