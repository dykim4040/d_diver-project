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
               <h3>${movie.movieNm }</h3>
               <c:choose>
					<c:when test="${movie.avgScore == null}">
					<div class="ratt"></div>
					</c:when>
					<c:when test="${movie.avgScore == 0 }">
					<div class="ratt">
				<div class="rat" style="width: 0px;"></div>
				</div>
				</c:when>
					<c:when test="${movie.avgScore > 0 &&  movie.avgScore <= 1}">
					<div class="ratt">
					<div class="rat" style="width: 8px; z-index: 10;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 1 &&  movie.avgScore <= 2}">
					<div class="ratt">
					<div class="rat" style="width: 16px; z-index: 9;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 2 &&  movie.avgScore <= 3}">
					<div class="ratt">
					<div class="rat" style="width: 24px; z-index: 8;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 3 &&  movie.avgScore <= 4}">
					<div class="ratt">
					<div class="rat" style="width: 32px; z-index: 7;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 4 &&  movie.avgScore <= 5}">
					<div class="ratt">
					<div class="rat" style="width: 40px; z-index: 6;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 5 &&  movie.avgScore <= 6}">
					<div class="ratt">
					<div class="rat" style="width: 48px; z-index: 5;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 6 &&  movie.avgScore <= 7}">
					<div class="ratt">
					<div class="rat" style="width: 56px; z-index: 4;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 7 &&  movie.avgScore <= 8}">
					<div class="ratt">
					<div class="rat" style="width: 64px; z-index: 3;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 8 &&  movie.avgScore <= 9}">
					<div class="ratt">
					<div class="rat" style="width: 72px; z-index: 2;"></div>
					</div>
					</c:when>
					<c:when test="${movie.avgScore > 9 &&  movie.avgScore <= 10}">
					<div class="ratt">
					<div class="rat" style="width: 80px; z-index: 1;"></div>
					</div>
					</c:when>
				</c:choose>
				${movie.avgScore}
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
		<div class="rl-thumb set-bg"></div>
		<div class="rl-info">
		<h6>${movie.movieNm}</h6>
		<c:choose>
			<c:when test="${movie.avgScore == null}">
				<div class="ratt"></div>
			</c:when>
			<c:when test="${movie.avgScore == 0 }">
					<div class="ratt">
				<div class="rat" style="width: 0px;"></div>
				</div>
				</c:when>
			<c:when test="${movie.avgScore > 0 &&  movie.avgScore <= 1}">
				<div class="ratt">
					<div class="rat" style="width: 8px; z-index: 10;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 1 &&  movie.avgScore <= 2}">
				<div class="ratt">
					<div class="rat" style="width: 16px; z-index: 9;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 2 &&  movie.avgScore <= 3}">
				<div class="ratt">
					<div class="rat" style="width: 24px; z-index: 8;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 3 &&  movie.avgScore <= 4}">
				<div class="ratt">
					<div class="rat" style="width: 32px; z-index: 7;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 4 &&  movie.avgScore <= 5}">
				<div class="ratt">
					<div class="rat" style="width: 40px; z-index: 6;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 5 &&  movie.avgScore <= 6}">
				<div class="ratt">
					<div class="rat" style="width: 48px; z-index: 5;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 6 &&  movie.avgScore <= 7}">
				<div class="ratt">
					<div class="rat" style="width: 56px; z-index: 4;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 7 &&  movie.avgScore <= 8}">
				<div class="ratt">
					<div class="rat" style="width: 64px; z-index: 3;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 8 &&  movie.avgScore <= 9}">
				<div class="ratt">
					<div class="rat" style="width: 72px; z-index: 2;"></div>
				</div>
			</c:when>
			<c:when test="${movie.avgScore > 9 &&  movie.avgScore <= 10}">
				<div class="ratt">
					<div class="rat" style="width: 80px; z-index: 1;"></div>
				</div>
			</c:when>
		</c:choose>
		${movie.avgScore}     
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
            <div class="rl-thumb set-bg"></div>
            <div class="rl-info">
               <h6>${movie.movieNm}</h6>
			<c:choose>
				<c:when test="${movie.avgScore == null}">
				<div class="ratt"></div>
				</c:when>
				<c:when test="${movie.avgScore == 0 }">
					<div class="ratt">
				<div class="rat" style="width: 0px;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 0 &&  movie.avgScore <= 1}">
				<div class="ratt">
				<div class="rat" style="width: 8px; z-index: 10;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 1 &&  movie.avgScore <= 2}">
				<div class="ratt">
				<div class="rat" style="width: 16px; z-index: 9;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 2 &&  movie.avgScore <= 3}">
				<div class="ratt">
				<div class="rat" style="width: 24px; z-index: 8;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 3 &&  movie.avgScore <= 4}">
				<div class="ratt">
				<div class="rat" style="width: 32px; z-index: 7;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 4 &&  movie.avgScore <= 5}">
				<div class="ratt">
				<div class="rat" style="width: 40px; z-index: 6;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 5 &&  movie.avgScore <= 6}">
				<div class="ratt">
				<div class="rat" style="width: 48px; z-index: 5;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 6 &&  movie.avgScore <= 7}">
				<div class="ratt">
				<div class="rat" style="width: 56px; z-index: 4;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 7 &&  movie.avgScore <= 8}">
				<div class="ratt">
				<div class="rat" style="width: 64px; z-index: 3;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 8 &&  movie.avgScore <= 9}">
				<div class="ratt">
				<div class="rat" style="width: 72px; z-index: 2;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 9 &&  movie.avgScore <= 10}">
				<div class="ratt">
				<div class="rat" style="width: 80px; z-index: 1;"></div>
				</div>
				</c:when>
			</c:choose>
			${movie.avgScore}    
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
            <div class="rl-thumb set-bg"></div>
            <div class="rl-info">
            <h6>${movie.movieNm}</h6>
            <c:choose>
				<c:when test="${movie.avgScore == null}">
				<div class="ratt"></div>
				</c:when>
				<c:when test="${movie.avgScore == 0 }">
					<div class="ratt">
				<div class="rat" style="width: 0px;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 0 &&  movie.avgScore <= 1}">
				<div class="ratt">
				<div class="rat" style="width: 8px; z-index: 10;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 1 &&  movie.avgScore <= 2}">
				<div class="ratt">
				<div class="rat" style="width: 16px; z-index: 9;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 2 &&  movie.avgScore <= 3}">
				<div class="ratt">
				<div class="rat" style="width: 24px; z-index: 8;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 3 &&  movie.avgScore <= 4}">
				<div class="ratt">
				<div class="rat" style="width: 32px; z-index: 7;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 4 &&  movie.avgScore <= 5}">
				<div class="ratt">
				<div class="rat" style="width: 40px; z-index: 6;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 5 &&  movie.avgScore <= 6}">
				<div class="ratt">
				<div class="rat" style="width: 48px; z-index: 5;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 6 &&  movie.avgScore <= 7}">
				<div class="ratt">
				<div class="rat" style="width: 56px; z-index: 4;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 7 &&  movie.avgScore <= 8}">
				<div class="ratt">
				<div class="rat" style="width: 64px; z-index: 3;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 8 &&  movie.avgScore <= 9}">
				<div class="ratt">
				<div class="rat" style="width: 72px; z-index: 2;"></div>
				</div>
				</c:when>
				<c:when test="${movie.avgScore > 9 &&  movie.avgScore <= 10}">
				<div class="ratt">
				<div class="rat" style="width: 80px; z-index: 1;"></div>
				</div>
				</c:when>
			</c:choose>
			${movie.avgScore}    
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
		
		setTimeout(() => {
			$('.gs-item').each(function() {
				var item_w = $(this).width();
				var item_h = (item_w / 500) * 714;
				$(this).height(item_h);
			});
		}, 300);
		
	});
});
</script>
</body>
</html>