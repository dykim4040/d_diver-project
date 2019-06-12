<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
.ratt {
	background-image: url('/resources/img/grade_img.png');
	background-repeat: no-repeat;
	vertical-align: middle;
	display: inline-block;
	width: 80px;
	height: 16px;
	background-size: 80px 32px;
	white-space: nowrap;
	position: relative;
}

.rat {
	display: inline-block;
	background-size: 80px 32px;
	background-position: 0 bottom;
	height: 16px;
	position: absolute;
	background-image: url('/resources/img/grade_img.png');
	background-repeat: no-repeat;
	vertical-align: middle;
}

.ratt {
	background-image: url('/resources/img/grade_img.png');
	background-repeat: no-repeat;
	vertical-align: middle;
	display: inline-block;
	width: 80px;
	height: 16px;
	background-size: 80px 32px;
	white-space: nowrap;
	position: relative;
}

.rat {
	display: inline-block;
	background-size: 80px 32px;
	background-position: 0 bottom;
	height: 16px;
	/* width: 15px;
    z-index: 4; */
	position: absolute;
	background-image: url('/resources/img/grade_img.png');
	background-repeat: no-repeat;
	vertical-align: middle;
}

/*slide-container*/
.slideshow-container {
	width: 800px;
	height: 450px;
	position: relative;
	margin: auto;
	display: table;
}

.mySlides {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	margin: auto
}

.slideshow-container .mySlides img {
	height: 450px;
}

.mySlides {
	display: none;
}

/* next & prev buttons*/
.prev, .next {
	cursor: pointer;
	width: auto;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

.number {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

.dot {
	cursor: pointer;
	height: 10px;
	width: 10px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: backgrount-color 0.6s easel
}

.active, .dot:hover {
	background-color: #717171;
}

.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {from { opacity:.4;
	
}

to {
	opacity: 1;
}

}
@
keyframes fade {from { opacity:.4;
	
}

to {
	opacity: 1;
}
}
</style>

</head>
<body>
<c:set var="movie" value="${movieInfo }"></c:set>
<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>
<div id="wish-list-selected" style="display: none;">${wishList }</div>
<!-- Header section -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
<!-- Header section end -->


<!-- Hero section -->
<section class="page-top-section set-bg"
	data-setbg="/resources/img/page-top-bg.jpg">
	<div class="container">
		<h2>${movieInfo.movieNm}</h2>
	</div>
</section>
<!-- Hero section end -->

<!-- Recipe big view -->
<section class="movie-details-section">
<div class="recipe-view-section">
	<div class="container">
		<%-- 		<img src="${movie.covThUrl}" width="350px" height="500px"> --%>
		<iframe width="100%" height="600"
			src="https://www.youtube.com/embed/pWemV6TiUZE" frameborder="0"
			allow="autoplay; encrypted-media" allowfullscreen></iframe>

	</div>
</div>
</section>
<!-- Recipe details section -->

<section style="margin-top: 30px;">
<div class="container">
	<div class="recipe-meta">
		<!-- 	<div class="racipe-cata"> -->
		<!-- 		<span>For Begginers</span> -->
		<!-- 	</div> -->
		<h2>${movieInfo.movieNm}</h2>
		관객 평점 : 

		<div class="ratt">
			<c:choose>
				<c:when test="${movie.avgScore > 0 &&  movie.avgScore <= 1}">
				<div class="rat" style="width: 8px; z-index: 10;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 1 &&  movie.avgScore <= 2}">
				<div class="rat" style="width: 16px; z-index: 9;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 2 &&  movie.avgScore <= 3}">
				<div class="rat" style="width: 24px; z-index: 8;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 3 &&  movie.avgScore <= 4}">
				<div class="rat" style="width: 32px; z-index: 7;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 4 &&  movie.avgScore <= 5}">
				<div class="rat" style="width: 40px; z-index: 6;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 5 &&  movie.avgScore <= 6}">
				<div class="rat" style="width: 48px; z-index: 5;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 6 &&  movie.avgScore <= 7}">
				<div class="rat" style="width: 56px; z-index: 4;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 7 &&  movie.avgScore <= 8}">
				<div class="rat" style="width: 64px; z-index: 3;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 8 &&  movie.avgScore <= 9}">
				<div class="rat" style="width: 72px; z-index: 2;"></div>
				</c:when>
				<c:when test="${movie.avgScore > 9 &&  movie.avgScore <= 10}">
				<div class="rat" style="width: 80px; z-index: 1;"></div>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>
</section>

<section class="movie-detail">
<div class="container">
	<div class="container-row">
		<div class="thumb">
				
			<img src="${movieInfo.covThUrl}" id="movieP">
			
		</div>
		<div class="row2">
			<b>시놉시스</b>
			<div class="summary">${movieInfo.synopsis}</div>
			<ul id="summmary-ul">
				<li>
					<strong>조회수 </strong>&nbsp;&nbsp;
					<span>${movieInfo.views}</span>
					<br>
					<strong>관객 평점 </strong>&nbsp;&nbsp;
					<span>${movieInfo.avgScore}</span>
				</li>
				<li>
					<strong>개요</strong><br>
					<span>${movieInfo.repGenreNm}</span>
					<small>&nbsp;|&nbsp;</small>
					${movieInfo.watchGradeNm}
					<small>&nbsp;|&nbsp;</small>
					${movieInfo.showTm}분
				</li>
				<li>
					<strong>개봉일</strong><br>
					<span><fmt:formatDate value="${movieInfo.openDt}" pattern="yyyy년 MM월 dd일"/></span>
					
				</li>
				<li>
					<strong>장르</strong><br>
					<c:forEach var="genre" items="${movieInfo.movieGenre }" varStatus="index">
						${genre.movieGenre }
						<c:if test="${!index.last}">,&nbsp;&nbsp;</c:if>
					</c:forEach>
				</li>
				<li>
					<strong>출연</strong><br>
					<c:forEach var="star" items="${movieInfo.starsIn }" varStatus="index">
						${star.starNm }
						<c:if test="${!index.last}">,&nbsp;&nbsp;</c:if>
					</c:forEach>
				</li>
				<li>
					<strong>감독</strong><br>
					<c:forEach var="director" items="${movieInfo.directorsIn }" varStatus="index">
						${director.directorNm }
						<c:if test="${!index.last}">,&nbsp;&nbsp;</c:if>
					</c:forEach>
				</li>
				<li>
					<strong>회사</strong><br>
					<c:forEach var="company" items="${movieInfo.companiesIn }" varStatus="index">
						${company.companyNm } &lt;${company.companyPartNm }&gt;
						<c:if test="${!index.last}">,&nbsp;&nbsp;</c:if>
					</c:forEach>
				</li>
			</ul>
			<button class="btn">구매하기</button>
			<button class="btn wish-list" style="float: right;">즐겨찾기</button>
			<!-- 선택되면 selected 클래스 추가 -->
		</div>
	</div>
</div>
</section>
<!-- Recipe details section end -->
<%
int score = 0;
Integer test = (Integer)request.getAttribute("memberScore");
if(test != null){
    score = test;
}



%>

<!-- Comment section -->
<section class="comment-section spad pt-0">
<div class="container">

	<div class="container-row">
	
		<div class="thumb">
			<span id="fnt">Leave a comment</span>
		</div>
		<div class="row2">
		<form method="post" id="frmStar" name="frmStar">
			<span class="starInput">
	 
			<span class="input">
			<input type="radio" name="starInput" <%if(score == 1){out.print("checked");} %> value="1" id="p1"> 
			<label for="p1">1</label> 
			<input type="radio" name="starInput" <%if(score == 2){out.print("checked");} %> value="2" id="p2"> 
			<label for="p2">2</label> 
			<input type="radio" name="starInput" <%if(score == 3){out.print("checked");} %>  value="3" id="p3"> 
			<label for="p3">3</label>
			<input type="radio" name="starInput" <%if(score == 4){out.print("checked");} %>  value="4" id="p4"> 
			<label for="p4">4</label> 
			<input type="radio" name="starInput" <%if(score == 5){out.print("checked");} %>  value="5" id="p5"> 
			<label for="p5">5</label> 
			<input type="radio" name="starInput" <%if(score == 6){out.print("checked");} %>  value="6" id="p6"> 
			<label for="p6">6</label> 
			<input type="radio" name="starInput" <%if(score == 7){out.print("checked");} %>  value="7" id="p7"> 
			<label for="p7">7</label> 
			<input type="radio" name="starInput" <%if(score == 8){out.print("checked");} %>  value="8" id="p8"> 
			<label for="p8">8</label> 
			<input type="radio" name="starInput" <%if(score == 9){out.print("checked");} %>  value="9" id="p9"> 
			<label for="p9">9</label> 
			<input type="radio" name="starInput" <%if(score == 10){out.print("checked");} %>  value="10" id="p10"> 
			<label for="p10">10</label>
			</span>

			<input type="hidden" name="movieCd" value="${movie.movieCd}"> 
			<output for="starInput">
			<c:if test="${memberScore ne null }">
				<b>${memberScore }</b>&nbsp;점
			</c:if>
			<c:if test="${memberScore eq null }">
				<b>0</b>&nbsp;점
			</c:if>	
				
			</output>
			</span>
			<button class="btn" type="submit">별</button>
		</form>
		</div>
		
	</div><br>
	<div class="myInput">
			<div class="myStar"></div>
	</div>
</div>
	</section>
	<section>
	
	<div class="container">
	<b>스틸컷</b>
	<div class="slideshow-container">
	<c:forEach var="stillCut" items="${movieInfo.movieStillCut }" varStatus="index">
		<div class="mySlides fade">
		<img class="lazy" data-original="${stillCut.stillCutUrl }" >
		</div>
	</c:forEach>
	 <div style="width: 800px; text-align: center">
     <c:forEach var="i" begin="0" end="${fn:length(movieInfo.movieStillCut) }">
     <span class="dot" onclick="currentSlide(${i})"></span>
     </c:forEach>
 
    </div>
	
	</div>
	 
    

</div>
</section>
<!-- Comment section -->


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
<script src="/resources/script/jquery-3.3.1.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
<script>
var starRating = function() {
	var $star = $(".starInput");
	$result = $star.find("output>b");

	$(document).on("focusin", ".starInput>.input", function() {
		$(this).addClass("focus");
	})

	.on("focusout", ".starInput>.input", function() {
		var $this = $(this);
		setTimeout(function() {
			if ($this.find(":focus").length === 0) {
				$this.removeClass("focus");
			}
		}, 100);
	})

	.on("change", ".starInput :radio", function() {
		$result.text($(this).next().text());
	}).on("mouseover", ".starInput label", function() {
		$result.text($(this).text());
	}).on("mouseleave", ".starInput>.input", function() {
		var $checked = $star.find(":checked");
		if ($checked.length === 0) {
			$result.text("0");
		} else {
			$result.text($checked.next().text());
		}
	});
};

starRating();

$(document).ready(function(){
	var wishList = $('#wish-list-selected').text();
	console.log(wishList);
	if (wishList == 'selected') {
		$('.wish-list').addClass('selected');
	}
	
	$('#frmStar').submit(function(){
		var movieCd = $('input[name=movieCd]').val();
		var starInput = $('input:radio[name="starInput"]:checked').val();
		console.log('movieCd: ' + movieCd);
		console.log('score: ' + starInput);
		
		$.ajax({
			url : '/movieDetailJson',
			data :{

				movieCd : movieCd,
				starInput : starInput
			},
			
			success : function(){
				alert("별점이 들어갔습니다.");
				location.reload();
			}
			
		});
		
		return false;
	});
	
	$('.wish-list').on('click', function() {
		$(this).toggleClass('selected');
		var movieCd = $('input[name=movieCd]').val();
		console.log('movieCd: ' + movieCd);
		
		$.ajax({
			
			url: '/wishList',
			data :{
				movieCd : movieCd
			},
			success: function() {
				console.log('★즐겨찾기★');
			}
		});
	});
	

	starRating();

	
});

var slideIndex = 0;

window.onload=function(){
    showSlides(slideIndex);

    /*3초마다 움직이게 하는 요소*/
//     var sec=3000;
//     setInterval(function(){
//         slideIndex++;
//         showSlides(slideIndex);
//     }, sec);
    
}

function moveSlides(n){
    slideIndex = slideIndex + n;
    showSlides(slideIndex);
}

function currentSlide(n){
    slideIndex = n;
    showSlides(slideIndex);
}

function showSlides(n){
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    var size = slides.length;

    if((n+1) > size){
        slideIndex = 0; n = 0;
    } else if(n < 0){
        slideIndex = (size - 1);
        n = (size - 1);
    }

    for(i = 0; i < slides.length; i++){
        slides[i].style.display = "none";
    }

    for(i = 0; i < dots.length; i++){
        dots[i].className = dots[i].className.replace(" active", "");
    }

    slides[n].style.display = "block";
    dots[n].className += " active";
 
}
</script>

<!-- jquery CDN-->
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- lazyload 1.9.1 CDN -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.min.js"></script>
<script>
$("img.lazy").lazyload({
    threshold : 50,        //뷰포트에 보이기 300px 전에 미리 로딩
    effect : "fadeIn"       //효과
});
</script>


</body>
</html>