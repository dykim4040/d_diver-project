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

<section id="board" class="contact-section spad">
<div class="container">
	<div class="row">
		<h1 class="text-center">Q&A : ${pageInfoMap.allRowCount}</h1>
		<table class="table table-striped table-bordered table-list">
			<thead>
				<tr>
				<th colspan="2" class="text-center">제목</th>
				<th width="15%" class="text-center">작성자</th>
				<th width="10%" class="text-center">작성일</th>
				<th width="60px" class="text-center">조회</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${empty list }">
			<tr><td colspan="5" style="text-align: center;">작성된 게시글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${list }" var="board">
				<tr>
				<td width="5%" class="text-center">${board.num }</td>
				<td class="title1 left" style="padding-left: 25px;">
				<c:if test="${board.reLev > 0 }">
					<c:forEach begin="1" end="${board.reLev }">
						&nbsp;
					</c:forEach>
					<span id="reply">└</span>
				</c:if>
				<a href="/board/detail?num=${board.num}&pageNum=${pageInfoMap.pageNum}&#board" style="text-decoration: none; color: #FFF;">${board.subject }</a>
<%-- 				<c:if test="${board.commentCount > 0 }"> --%>
<%-- 					<b style="color: red;">[${board.commentCount }]</b> --%>
<%-- 				</c:if>댓글 수 세서 제목 옆에 표시하기 --%>
				</td>
				<td class="text-center">${board.name }</td>
				<td class="text-center">
				<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
				<fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" />
				<fmt:parseNumber value="${board.regDate.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true" />
				<c:set value="${nowDays - regDays }" var="dayDiff" />
				<c:choose>
					<c:when test="${dayDiff == 0 }">
						<fmt:formatDate value="${board.regDate }" pattern="HH:mm:ss"/>
					</c:when>
					<c:otherwise>
						<fmt:formatDate value="${board.regDate }" pattern="yyyy.MM.dd"/>
					</c:otherwise>
				</c:choose>
				</td>
				<td class="text-center">${board.readCount }</td>
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</tbody>
		</table>


		<div class="site-pagination text-center pagePaddingZero">
			<c:if test="${pageInfoMap.allRowCount > 0 }">

			<c:if test="${pageInfoMap.startPage > pageInfoMap.pageBlockSize }">
			<a href="/board/list?pageNum=1&search=${search }&#board">1</a><span class="more-page">...</span>
			<a href="/board/list?pageNum=${pageInfoMap.startPage - 1 }&search=${search }&#board"><span class="pt">
			<img src="images/left-arrow.png" width="18px" height="18px"></span></a>
			</c:if>

			<c:forEach begin="${pageInfoMap.startPage }" end="${pageInfoMap.endPage }" step="1" varStatus="i">
			
			<c:choose>
				<c:when test="${i.current eq pageInfoMap.pageNum }">
					<span>${i.current }</span>
				</c:when>
				<c:otherwise>
					<a href="/board/list?pageNum=${i.current }&search=${search }&#board">${i.current }</a>
				</c:otherwise>
			</c:choose>
			
			</c:forEach>

			<c:if test="${pageInfoMap.endPage < pageInfoMap.maxPage }">
			<a href="boardCategory.do?pageNum=${pageInfoMap.endPage + 1 }&search=${search }&#board"><span class="pt">
			<img src="images/right-arrow.png" width="18px" height="18px"></span></a>
			<span class="more-page">...</span>
			<a href="/board/list?pageNum=${pageInfoMap.maxPage }&search=${search }&#board">${pageInfoMap.maxPage }</a>
			</c:if>

			</c:if>
		</div>
		
	</div>
	<sec:authorize access="isAuthenticated()">
	<p style="text-align: right;">
	<input type="button" value="글쓰기" class="btn" onclick="location.href = '/board/write?#board';">
	</p>
	</sec:authorize>
	
<!-- 	<div class="row" style="text-align: center;"> -->
<!-- 	<h3 class="h5 text-black mb-3">Search</h3> -->
<!-- 	<form action="/board/list" method="GET"> -->
<%-- 		<input type="text" name="search" class="form-control" value="${search}"> --%>
<!-- 		<input type="submit" value="검색" class="btn"> -->
<!-- 	</form> -->
<!-- 	</div> -->
	
	<h3 class="h5 text-black mb-3">Search</h3>
	<form action="/contact?#board" method="GET">
		<div class="form-group d-flex">
			<input type="text" class="form-control" name="search" placeholder="Search keyword and hit enter..." value="${search }">
		</div>
	</form>
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


<!-- load for map -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWTIlluowDL-X4HbYQt3aDw_oi2JP0Krc"></script> -->
<!-- <script src="/resources/js/map.js"></script> -->

</body>
</html>