<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header-section">
	<div class="header-top">
		<div class="user-panel">
		<c:choose>
		<c:when test="${sessionID == null }">
			<a href="/member/join">Join</a>&nbsp;/&nbsp; 
			<a href="/member/login">Login</a>
		</c:when>
		<c:otherwise>
			<c:choose>
			<c:when test="${pack == 'G' }">
			<img src="/resources/img/package/gold.png" width="23px" >
			</c:when>
			<c:when test="${pack == 'S' }">
			<img src="/resources/img/package/silver.png" width="23px" >
			</c:when>
			<c:when test="${pack == 'B' }">
			<img src="/resources/img/package/bronze.png" width="23px" >
			</c:when>
			</c:choose>
			<a href="/member/myInfo?id=${sessionID}"><b><span style="color: #FFF;">${sessionID}</span></b></a>&nbsp;님&nbsp;
			<a href="/member/logout"><button class="logout">로그아웃</button></a>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
	<div class="header-bottom">
		<div class="container">
			<a href="/" class="site-logo" style="height: 55px;">
<!-- 				<img src="/resources/img/logo.png" alt=""> -->
				WEBFLIX
			</a>
			<div class="nav-switch">
				<i class="fa fa-bars"></i>
			</div>
<!-- 			<div class="header-search"> -->
<!-- 				<a href="#"><i class="fa fa-search"></i></a> -->
<!-- 			</div> -->
			<div class="header-search">
				<a href="/purchase"><i class="material-icons">local_grocery_store</i></a>
			</div>
			<ul class="main-menu">
				<li><a href="/">홈</a></li>
				<li><a href="/movie">영화</a></li>
				<li><a href="/myContents">내컨텐츠</a></li>
<!-- 				<li><a href="#">통계</a></li> -->
				<li><a href="/contact">고객센터</a></li>
			</ul>
		</div>
	</div>
</header>