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
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/css/owl.carousel.css" />
<link rel="stylesheet" href="/resources/css/animate.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/custom.css" />

<script src="/resources/script/jquery-3.3.1.min.js"></script>
<script>
$(function() {

	$('input[name=id]').on('keyup',	function(event) {
		var id = $(this).val();
		console.log('id 변수 타입: ' + typeof id);
		console.log('id: ' + id);

		$.ajax({
			url : '/member/joinIdCheckJson',
			data : {
				userId : id
			}, // userId=id입력값
			success : function(isDup) {
				console.log('result 변수 타입: ' + typeof (isDup));
				console.log('result: ' + isDup);

				if (isDup) {// id중복
					$('span#dupCheck').html('이미 존재하는 아이디입니다.').css('color', 'red');
				} else { // id중복아님
					$('span#dupCheck').html('사용 가능한 아이디입니다.').css('color', 'green');
				}
			}
		});

	});

});

function formCheck() {
	// ID는 3글자 이상 입력해야함
	if (frm.id.value.length < 3) { // frm.id.value == ''
		alert('ID는 3글자 이상 입력해야 합니다.');
		frm.id.focus();
		return false;
	}

	if (frm.password.value != frm.password2.value) {
		alert('패스워드 입력이 서로 다릅니다.\n다시 입력하세요.');
		frm.pass.focus();
		return false;
	}
	if (frm.email.value != frm.email2.value) {
		alert('이메일주소 입력이 서로 다릅니다.\n다시 입력하세요.');
		frm.email.focus();
		return false;
	}
	return true;
}


// function idDupCheck() {
// 	// id값이 공백이면 "아이디 입력하세요." 포커스 주기.
// 	var id = frm.id.value; // string 타입
// 	if (id.length == 0) { // id == ''
// 		alert('아이디 입력하세요.');
// 		frm.id.focus();
// 		return;
// 	}

// 	// 현재 창 기준으로 새 창 열기
// 	var childWindow = window.open('/member/joinIdCheck?userid=' + id, '', 'width=400,height=200');
// }
</script>

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
	data-setbg="/resources/img/movie.jpg">
	<div class="container">
		<h2>회원가입</h2>
	</div>
</section>
<!-- Hero section end -->


<section class="contact-section spad">
<div class="container">
<div class="row">
	<div class="col-lg-6" style="margin: auto;">
	<div class="contact-form-warp">
		<h4>회원정보를 입력하세요.</h4>
		<form action="/member/join" method="post" id="join" name="frm" class="contact-form" onsubmit="return formCheck();">
		<div class="row">
			<div class="col-md-12">
			
				<fieldset>
					<legend>Basic Info</legend>
					<label>User ID</label><span id="dupCheck" style="float: right;"></span>
					<input type="text" name="id" class="id" required><br>
					<label>Password</label>
					<input type="password" name="password" required><br>
					<label>E-Mail</label>
					<input type="email" name="email" required><br>
				</fieldset>
				<fieldset>
					<legend>Optional</legend>
					<label>Birthday</label><input type="date" name="birthday"><br>
					<label>좋아하는 동물 이름은?</label>
					<input type = "text" name = "hint">
					<label>Gender</label>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<button class="site-btn join">회원가입</button>
					<button type="reset" class="site-btn join">초기화</button>
				</div>
				
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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