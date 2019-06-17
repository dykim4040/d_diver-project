<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Webflix - 구매하기</title>
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
<sec:authorize access="isAnonymous()">
<script>
alert('로그인이 필요합니다.');
location.href="/member/login";
</script>
</sec:authorize>
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
		<h2>구매</h2>
	</div>
</section>
<!-- Hero section end -->


<!-- Cash section -->
<section class="facts-section">
<div class="facts-warp">
<div class="container cash">
<fieldset>
	<label><b>${member.id }</b> 님의 현재 잔액</label>
	<input type="text" class="txt-box" value="${member.cash } 원" readonly><br>
</fieldset>
<a href="/purchase/cash" class="cash-btn"><img src="/resources/img/cash.png" width="50px" style="margin-right: 20px;">캐쉬 충전하기</a>
</div>
</div>
</section>
<!-- Cash section end -->


<!-- tier section -->
<c:if test="${pack != null }">
<section class="facts-section">
<!-- <div class="facts-warp"> -->
<div class="container cash" style="text-align: center;">
	<fieldset>
		<h3>현재 사용중인 패키지

		<c:choose>
			<c:when test="${pack == 'G' }">
				<img src="/resources/img/package/gold.png">
			</c:when>
			<c:when test="${pack == 'S' }">
				<img src="/resources/img/package/silver.png">
			</c:when>
			<c:when test="${pack == 'B' }">
				<img src="/resources/img/package/bronze.png">
			</c:when>
		</c:choose>
		</h3>
		<h4>만료 시간  : 
		<b><fmt:formatDate value="${expireDate }" pattern="yyyy.MM.dd HH:mm:ss" /></b>
		</h4>
	</fieldset>
</div>
<!-- </div> -->
</section>
</c:if>
<!-- tier section end -->



<!-- Facts section -->
<section class="facts-section">
<div class="facts-warp">
<div class="container">
	<div class="row">
		<div class="col-lg-4 pur col-sm-6 fact-item">
			<div class="fact-icon">
				<img src="/resources/img/package/gold.png" >
			</div>
			<h3>GOLD</h3>
			<p>6달 동안 시청 가능한 패키지</p>
			<h4>￦${packList.gold }</h4><br>
			<form action="/purchase/buyPackage" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="price" value="${packList.gold }">
				<button class="site-btn">구매하기</button>
			</form>
		</div>
		<div class="col-lg-4 pur col-sm-6 fact-item">
			<div class="fact-icon">
				<img src="/resources/img/package/silver.png" >
			</div>
			<h3>SILVER</h3>
			<p>3달 동안 시청 가능한 패키지</p>
			<h4>￦${packList.silver }</h4><br>
			<form action="/purchase/buyPackage" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="price" value="${packList.silver }">
				<button class="site-btn">구매하기</button>
			</form>
		</div>
		<div class="col-lg-4 pur col-sm-6 fact-item">
			<div class="fact-icon">
				<img src="/resources/img/package/bronze.png" >
			</div>
			<h3>BRONZE</h3>
			<p>1달 동안 시청 가능한 패키지</p>
			<h4>￦${packList.bronze }</h4><br>
			<form action="/purchase/buyPackage" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="price" value="${packList.bronze }">
				<button class="site-btn">구매하기</button>
			</form>
		</div>
	</div>
</div>
</div>
</section>
<!-- Facts section end -->

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