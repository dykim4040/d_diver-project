<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Webflix - 고객센터</title>
<meta charset="UTF-8">
<meta name="description" content="Food Blog Web Template">
<meta name="keywords" content="food, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="/resources/img/w.png" rel="shortcut icon" />

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,500,500i,600,600i,700" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/css/owl.carousel.css" />
<link rel="stylesheet" href="/resources/css/animate.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/custom.css" />

<style>
.notice{
	width: 100%;
	border-collapse: collapse;
	letter-spacing: 0;
	border-top: 1px solid #fff;
	margin-bottom: 30px;
	position: relative;
	z-index: 1;
}
.content{
	width: 100%;
	height: 300px;
	background: #747474;
	color: #fff;
	border-radius: 5px 5px 5px 5px;
	border: 1px solid #212121;
}
tr{
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.notice th, .notice td{
	padding: 8px 16px;
	border-bottom: 1px solid #fff;
}
th{
/* 	border-right: 1px solid #fff; */
	text-align: center;
}
input {
	color: #fff; 
	background: #747474;
	border-radius: 5px 5px 5px 5px;
	border: 1px solid #212121;
	padding: 10px;
}
textarea {
	padding: 10px;
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
<section class="page-top-section set-bg" data-setbg="/resources/img/movie.jpg">
	<div class="container">
		<h2>고객센터</h2>
	</div>
</section>
<!-- Hero section end -->

<section class="contact-section spad" id="board">
<div class="container">
	<div class="row">
		<div class="col-lg-8 center">
		<div class="contact-form-warp">
			<h1>Q&A 답글 작성</h1>
			<sec:authorize access="isAuthenticated()">
			<c:set var="id"><sec:authentication property="principal.member.id"/></c:set>
			<form action="/board/reply" method="post" name="frm">
			<input type="hidden" name="pageNum" value="${param.pageNum}">
			<input type="hidden" name="reRef" value="${param.reRef}">
			<input type="hidden" name="reLev" value="${param.reLev}">
			<input type="hidden" name="reSeq" value="${param.reSeq}">
			<input type="hidden" name="name" value="${id}"> 
			<table id="notice" class="notice">
			<tr>
			<th>글제목</th>
			<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><textarea rows="13" cols="40" name="content" class="content"></textarea></td>
			</tr>
			</table>
			
			<div id="table_search">
			<input type="submit" value="확인" class="btn">
			<input type="reset" value="다시작성" class="btn">
			<input type="button" value="목록" class="btn" style="float: right;" onclick="location.href='/contact?pageNum=${param.pageNum}&#board';">
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
			</sec:authorize>
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