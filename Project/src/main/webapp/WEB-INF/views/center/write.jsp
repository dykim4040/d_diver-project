<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Food Blog - Web Template</title>
<meta charset="UTF-8">
<meta name="description" content="Food Blog Web Template">
<meta name="keywords" content="food, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="/resources/img/w.png" rel="shortcut icon" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,400i,500,500i,600,600i,700"
	rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/css/owl.carousel.css" />
<link rel="stylesheet" href="/resources/css/animate.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
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
	<section class="page-top-section set-bg"
		data-setbg="/resources/img/page-top-bg.jpg">
		<div class="container">
			<h2>고객센터</h2>
		</div>
	</section>
	<!-- Hero section end -->

	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="contact-form-warp">
						<h1>Q&A 글쓰기</h1>
						
						<form action="/board/write" method="post" name="frm">
						<table id="notice">
						<tr><th>작성자명</th><td><input type="text" name="name"></td></tr>
						<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
						<tr><th>글제목</th><td><input type="text" name="subject"></td></tr>
						<tr>
							<th>글내용</th>
							<td><textarea rows="13" cols="40" name="content"></textarea></td>
						</tr>
						</table>
						
						<div id="table_search">
						<input type="submit" value="글쓰기" class="btn">
						<input type="reset" value="다시작성" class="btn">
						<input type="button" value="글목록" class="btn" onclick="location.href='/contact';">
						</div>
						</form>
						
					</div>
				</div>
				<!-- map -->
				<!-- 	<div class="location-map" id="map-canvas"></div>	 -->
			</div>
		</div>
	</section>

	<!-- Gallery section -->
	<div class="gallery">
		<div class="gallery-slider owl-carousel">
			<div class="gs-item set-bg"
				data-setbg="/resources/img/instagram/1.jpg"></div>
			<div class="gs-item set-bg"
				data-setbg="/resources/img/instagram/2.jpg"></div>
			<div class="gs-item set-bg"
				data-setbg="/resources/img/instagram/3.jpg"></div>
			<div class="gs-item set-bg"
				data-setbg="/resources/img/instagram/4.jpg"></div>
			<div class="gs-item set-bg"
				data-setbg="/resources/img/instagram/5.jpg"></div>
			<div class="gs-item set-bg"
				data-setbg="/resources/img/instagram/6.jpg"></div>
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


	<!-- load for map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWTIlluowDL-X4HbYQt3aDw_oi2JP0Krc"></script>
	<script src="/resources/js/map.js"></script>

</body>
</html>