<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>로그인</h2>
	</div>
</section>
<!-- Hero section end -->


<section class="contact-section spad">
<div class="container">
	<div class="row">
		<div class="col-lg-6" style="margin: auto;">
		<div class="contact-form-warp">
			<h4>아이디 와 비밀번호를 입력하세요.</h4>
			
			<form action="/member/login" class="contact-form" method="POST">
				<div class="row">
					<!-- <div class="col-md-6">
						<input type="text" placeholder="Name">
					</div>
					<div class="col-md-6">
						<input type="text" placeholder="E-mail">
					</div> -->
					<div class="col-md-12">
						<input type="text" name="id" placeholder="ID">
						<input type="password" name="password" placeholder="Password">
						<button class="site-btn">로그인</button>
						<a href="/member/hintID"><button type="button" class="site-btn" style="float: right;">비밀번호 찾기</button></a>
					</div>
				</div>
			</form>
		</div>
		</div>
	</div>
</div>
</section>

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