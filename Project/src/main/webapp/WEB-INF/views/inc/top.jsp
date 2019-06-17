<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="header-section">
   <div class="header-top">
      <div class="user-panel">
      <sec:authorize access="isAnonymous()">
         <a href="/member/join" class="hovMenu">Join</a>&nbsp;/&nbsp; 
         <a href="/member/login" class="hovMenu">Login</a>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
         <form action="<c:url value='/member/logout'/>" method="POST">
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
         <c:set var="id"><sec:authentication property="principal.member.id"/></c:set>
         <a href="/member/myInfo?id=${id}"><b><span class="hovMenu" >${id}</span></b></a>&nbsp;님&nbsp;
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button class="logout">로그아웃</button>
         </form>
      </sec:authorize>
      </div>
   </div>
   <div class="header-bottom">
      <div class="container">
         <a href="/" class="site-logo">
            <img src="/resources/img/logo.png" >
<!--             WEBFLIX -->
         </a>
         <div class="nav-switch">
            <i class="fa fa-bars"></i>
         </div>
<%--          <div class="header-search"> --%>
<%--             <a href="#"><i class="fa fa-search"></i></a> --%>
<%--          </div> --%>
         <div class="header-search">
            <a href="/purchase"><i class="material-icons">local_grocery_store</i></a>
         </div>
         <ul class="main-menu">
            <li><a href="/">홈</a></li>
            <li><a href="/movie">영화</a></li>
            <li><a href="/myContents">내컨텐츠</a></li>
            <li><a href="/contact">고객센터</a></li>
         </ul>
      </div>
   </div>
</header>