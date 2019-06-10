<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="rating">
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star is-fade"></i>
				</div>
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
				<div class="rating">
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star is-fade"></i>
				</div>
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