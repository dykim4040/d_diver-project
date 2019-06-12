<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	text-align: center;
}
thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}
tr{
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
	border-top: 1px solid #fff;
}
thead {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}
.notice .content{
	padding: 20px;
	border-left: 0;
}

th td{
	padding: 10px 16px;
	word-break:break-all;
	border-right: 1px solid #fff; 
}
th{
	border-right: 1px solid #fff;
}
tbody {
	 border-bottom: 1px solid #fff;
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
			
			<article>
			<h1>Q&A 내용</h1>
			<table class="notice">
			<thead>
			<tr>
				<th>글번호</th><td style="border-right: 1px solid #fff">${board.num}</td>
				<th>조회수</th><td>${board.readCount}</td>
			</tr>
			<tr>
				<th>작성자</th><td style="border-right: 1px solid #fff">${board.name}</td>
				<th>작성일</th><td>${board.regDate}</td>
			</tr>
			
			
			<tr>
				<th>글제목</th>
				<td colspan="3">${board.subject}</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="4" class="content">${board.content}</td>
			</tr>
			</tbody>
			</table>
			
			<%--
			  세션값 있으면(로그인 했으면)
			  수정,삭제,답글쓰기 버튼 보이게 설정
			 --%>
			<div id="table_search">
			<sec:authorize access="isAuthenticated()">
			<c:set var="id"><sec:authentication property="principal.member.id"/></c:set>
			<c:if test="${id eq board.name}">
				<input type="button" value="글수정" class="btn" onclick="location.href='/board/modify?num=${board.num}&pageNum=${param.pageNum}';">
				<input type="button" value="글삭제" class="btn" onclick="location.href='/board/delete?num=${board.num}&pageNum=${param.pageNum}';">
			</c:if>
			<input type="button" value="답글쓰기" class="btn" 
				 onclick="location.href='/board/reply?reRef=${board.reRef}&reLev=${board.reLev}&reSeq=${board.reSeq}&pageNum=${param.pageNum}';">
			</sec:authorize>
				 
			<input type="button" value="글목록" class="btn" onclick="location.href='/contact?pageNum=${param.pageNum}';">
			</div>
			
			<div class="clear"></div>
			
			</article>
			
		</div>
		</div>
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


</body>
</html>