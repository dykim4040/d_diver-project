<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Webflix</title>
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
<script src="/resources/script/jquery-3.3.1.min.js"></script>





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
	data-setbg="/resources/img/movie.jpg">
	<div class="container">
		<h2>내정보</h2>
	</div>
</section>
<!-- Hero section end -->


<section class="contact-section spad">
<div class="container">
	<div class="row">
	<div class="col-lg-6" style="margin: auto;">
		<div class="contact-form-warp">
			<h4>내정보</h4>
			<form action="/member/memberDelete" method="post" id="frmDelete" name="frm"
				class="contact-form" onsubmit="return formCheck();">
			<div class="row">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<sec:authorize access="isAuthenticated()">
			<c:set var="id"><sec:authentication property="principal.member.id"/></c:set>
				<div class="col-md-12">
					<fieldset>
						<legend>"${id}" 회원님 정말 탈퇴하시겠습니까???</legend>
						<input type="hidden" name="id" value="${id}">
						
						<br>
							
						<label>Password</label> 
						<input type="password" name="password" id="password" required><br>
							
							<div>${message }</div>
							
						<button type="submit"  id="delete" class="btn">탈퇴하기</button>
					</fieldset>
				</div>
			</sec:authorize>	
			</div>
			</form>
		</div>
	</div>
	</div>
</div>
</section>

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