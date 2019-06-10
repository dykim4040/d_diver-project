<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<!-- <script type="text/javascript">
    function cancle() {
        self.close();
    }
    function goSubmit() {
        $("#myInfo").submit();
    }
</script> -->
<head>
<title>Food Blog - Web Template</title>
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
			<h2>내정보수정</h2>
		</div>
	</section>
	<!-- Hero section end -->


	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6" style="margin: auto;">
					<div class="contact-form-warp">
						<h4>내정보수정</h4>
						
						<form action="/member/upDateInfo" method="post" id="upDate" name="frm"
							class="contact-form" >
							<div class="row">
								<div class="col-md-12">
									<c:set var="member" value="${member }"></c:set>
									<fieldset>
									<input type="hidden" name="id" value="${member.id }">
										<br>
								
										<label>Password</label> <input type="password" name="password"
											value="${member.password }" ><br>
																						
										<label>E-Mail</label>
										<input type="email" name="email" value="${member.email }" ><br>	
																				
										<label>Birthday</label><input
											type="date" name="birthday"
											value='<fmt:formatDate value="${member.birthday }" pattern="yyyy-MM-dd"/>'
											><br>
											<label>좋아하는 동물이름은?</label>
										<input type="text" name="hint" 
											value="${member.hint }"><br>
											<input type="submit" value="글수정" class="btn">
												
											<input type="reset" value="다시작성" class="btn">		
									</fieldset>
								</div>
							</div>
						</form>
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