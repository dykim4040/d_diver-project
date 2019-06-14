<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">
<head>
<title>Webflix 대한민국 - 인터넷으로 영화를 시청하세요</title>
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
<section class="hero-section">
<div class="hero-slider owl-carousel">
   <div class="hero-slide-item set-bg" data-setbg="/resources/img/slider-bg-1.jpg">
      <div class="hs-text">
         <h2 class="hs-title-1"><span>D_diver!</span></h2>
         <h2 class="hs-title-2"><span>만든이들</span></h2>
         <h2 class="hs-title-3"><span>태영,종윤,연수,기훈,석우</span></h2>
      </div>
   </div>
   <div class="hero-slide-item set-bg" data-setbg="/resources/img/slider-bg-2.jpg">
      <div class="hs-text">
         <h2 class="hs-title-1"><span>D_diver!</span></h2>
         <h2 class="hs-title-2"><span>만든이들</span></h2>
         <h2 class="hs-title-3"><span>태영,종윤,연수,기훈,석우</span></h2>
      </div>
   </div>
</div>
</section>
<!-- Hero section end -->

<section class="review-section">
<div class="container">
	<iframe id="mov1" width="100%" src="https://www.youtube.com/embed/Q38h5XD4RKE?amp;autoplay=1"
	frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
	allowfullscreen></iframe>     
</div>
</section>
<!-- Recipes section -->
<section class="recipes-section spad pt-6">
<div class="container">
   <div class="section-title">
      <h2>최신 영화</h2>
   </div>
   <div class="row">
   <c:if test="${not empty list}">
   <c:forEach var="movie" items="${list}">
      <div class="col-lg-4 col-md-6">
         <div class="recipe">
           <a href="/movieDetail?movieCd=${movie.movieCd}"><img src="${movie.covThUrl}" width="350px" height="500px"></a>
            <div class="recipe-info-warp">
               <div class="recipe-info">
               <div class="starA">
               <h3>${movie.movieNm }</h3>
               <div class="ratt">
					<div class="rat"></div>
				</div>
				<span class="avgScore">${movie.avgScore}</span>
				</div>
               </div>
            </div>
         </div>
      </div>
   </c:forEach>
   </c:if>
   </div>
</div>
</section>

<!-- Recipes section end -->



<!-- Footer widgets section -->
<section class="bottom-widgets-section spad">
<div class="container">
<div class="row">

<div class="col-lg-4 col-md-6 ftw-warp">
    <div class="section-title">
    	<h3> 평점 TOP 5 </h3>
    </div>
    <ul class="sp-recipes-list">
  	<c:if test="${not empty grade}">
		<c:forEach var="movie" items="${grade}">
		<li>
		<a href="/movieDetail?movieCd=${movie.movieCd}"><img src="${movie.covThUrl}" width="200px" height="250px"></a>
<!-- 		<div class="rl-thumb set-bg"></div> -->
		<div class="rl-info">
			<div class="starA">
				<h6>${movie.movieNm}</h6>
				<div class="ratt">
					<div class="rat"></div>
				</div>
				<span class="avgScore">${movie.avgScore}</span>
			</div>    
		</div>
		</li>    
		</c:forEach>
	</c:if>
	</ul>
</div>
<!--  평점! -->
<div class="col-lg-4 col-md-6 ftw-warp">
	<div class="section-title">
		<h3> 조회수 TOP 5 </h3>
	</div>
    <ul class="sp-recipes-list">
      
      <c:if test="${not empty views}">
   		<c:forEach var="movie" items="${views}">
      
         <li>
         <a href="/movieDetail?movieCd=${movie.movieCd}"><img src="${movie.covThUrl}" width="200px" height="250px"></a>
<!--             <div class="rl-thumb set-bg"></div> -->
            <div class="rl-info">
               <div class="starA">
				<h6>${movie.movieNm}</h6>
				<div class="ratt">
					<div class="rat"></div>
				</div>
				<span class="avgScore">${movie.avgScore}</span>
			</div>    
            </div>
         </li>    
         </c:forEach>
  		 </c:if>
      </ul>
   
   
   </div>
   <div class="col-lg-4 col-md-6 ftw-warp">
      <div class="section-title">
         <h3>${category }  TOP 5 </h3>
      </div>
      <ul class="sp-recipes-list">
		<li>
      
    	<c:if test="${not empty catelist }">
   		<c:forEach var="movie" items="${catelist}">
      
         <li>
         <a href="/movieDetail?movieCd=${movie.movieCd}"><img src="${movie.covThUrl}" width="200px" height="250px"></a>
<!--             <div class="rl-thumb set-bg"></div> -->
            <div class="rl-info">
            <div class="starA">
				<h6>${movie.movieNm}</h6>
				<div class="ratt">
					<div class="rat"></div>
				</div>
				<span class="avgScore">${movie.avgScore}</span>
			</div>  
            </div>
         </li>    
         </c:forEach>
   </c:if>
      </ul>
   </div>
   </div>
   </div>
</section>

<!-- Footer widgets section end -->





<!-- Gallery section -->
<jsp:include page="/WEB-INF/views/inc/slider.jsp"></jsp:include>
<!-- Gallery section end -->


<!-- Footer section  -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
<!-- Footer section end -->


<!--====== Javascripts & Jquery ======-->
<script src="/resources/js/starAvg2.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
<script>
$(document).ready(function() {
	var iframeWidth = $("#mov1").outerWidth();
	var iframeHeight = (iframeWidth / 16) * 9;
	$("#mov1").attr("height", iframeHeight);

	
	$(window).resize(function() {
		iframeWidth = $("#mov1").outerWidth();
		iframeHeight = (iframeWidth / 16) * 9;
		$("#mov1").attr("height", iframeHeight);
		
	});
});


$(document).ready(function(){
	
	$('span.avgScore').each(function (index, item) {
		var avgScore = parseFloat($(this).text());
		var parent = $(this).closest('div.starA').find('div.rat');
		console.log('avgScore : ' + avgScore);
		
		drawStar2(avgScore, parent);
		
	});
	

});
</script>
</body>
</html>