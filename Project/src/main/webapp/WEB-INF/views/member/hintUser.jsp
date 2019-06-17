<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Webflix</title>
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
<script src="/resources/script/jquery-3.3.1.min.js"></script>

<script>

// function formCheck() {
// 	if(hhh.hint.value.length < 3) {
// 		alert('힌트는  3글자 이상 입력해주세요');
// 		hhh.hint.focus();
// 		return false;
// 	}
// }
// // 힌트 3글자 이상쓰시오




</script>
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
		<h2>비밀번호 찾기</h2>
	</div>
</section>
<!-- Hero section end -->


<section class="contact-section spad">
<div class="container">
	<div class="row">
		<div class="col-lg-6" style="margin: auto;">
		<div class="contact-form-warp">
			<h4>비밀번호 찾기</h4>
			<p>좋아하는 동물 이름은?</p>
			<form action="/member/hintUser" class="contact-form" name = "hhh" method="POST" onsubmit="return formCheck();">
				<div class="row">
					<!-- <div class="col-md-6">
						<input type="text" placeholder="Name">
					</div>
					<div class="col-md-6">
						<input type="text" placeholder="E-mail">
					</div> -->
					<div class="col-md-12">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="id" value="${id }">
						<span id="dupCheck" style="float: right;"></span>
						<input type="text" name="hint" class = "hint" placeholder="답변">
						<button class="site-btn" style="float: right;">다음</button>
					</div>
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