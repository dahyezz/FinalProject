<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 대학생활</title>

<link rel="shortcut icon" type="image/x-icon" href="/image/logo.png" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function(){
	$("#pwFind").click(function() {
		location.href='/member/pwFind';
	})
})

$(document).ready(function() {
	
	//모든 이미지 리스트
	var $slider_list = $("#slider li");
	
	//모든 이미지를 "left: 600px"로 보내기(숨기기)
	$slider_list.css("left", "570px");
	
	//첫번째 이미지를 div안쪽으로 보내기
	//첫 이미지를 보여주기
	$slider_list.eq(0).css("left", 0);
	
	//3초마다 이미지 교체하기 - slide
	
	var curSlide = 0; //현재 보여지는 이미지의 인덱스
	setInterval(function() {
		
		//다음 이미지의 인덱스
		var nextSlide = (curSlide+1) % $slider_list.length;
		
		//확인
// 		console.log(curSlide + " : " + nextSlide);
		
		//보여져야할 이미지 오른쪽으로 이동시키기
		$slider_list.eq(nextSlide).css("left","570px");
		
		//현재 이미지 숨기기
		$slider_list.eq(curSlide).animate({"left":"-=570px"});
		
		//다음 이미지 보여주기
		$slider_list.eq(nextSlide).animate({"left":"-=570px"});
		
		//순환구조 만들기
		curSlide++;
		curSlide = curSlide % $slider_list.length;
		
	}, 2000);
	
	
});

</script>

<style type="text/css">
p, h1, h2, strong {
	font-family: 'NanumSquare', sans-serif;
}
.main_login {
	position: fixed;
	right: 0;
	top: 0;
	height: 100%;
/* 	overflow-y: auto; */
	display: block;
	width: 300px;

	text-align: center;
	border-left: 1px solid #ccc;
}

#btnLogin {
	float: right;
}

.main_img {
	width: 100px;
	height: 100px;
	margin: 10px;
	display: inline-block;
	
	float: 
}
.search {
	border-top: 2px solid #ccc;
	margin: 10px 0;
	
	padding: 5px;
	z-index: 11;
}
.search > p {
	margin: 10px 0;
	line-height: 20px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	
}
.search > input {
	padding: 0 25px 0 10px;
	width: 100%;
	height: 40px;
	line-height: 40px;
	box-sizing: border-box;
	background-color: #f2f2f2;
	background-size: 15px 15px;
	background-image: url("/image/search.png");
	background-position: right;
	background-repeat: no-repeat;
	border: 1px solid #ccc;
	color: #4c4c4c;
}
.campuslist {
/*  	overflow: hidden; */
 	height: 100%; 
	border-top: 1px solid #ccc;
}
.scrollBlind{
	width: 330px;
	height: 100%;
	overflow-y: scroll;
	
}
.campuslist a {
	width: 100%;
	display: block;
	margin: 0 15p;
	height: 50px;
	line-height: 50px;
	box-sizing: border-box;
	border-bottom: 1px solid #ccc;
	text-decoration: none;
	color: black;
}
.campuslist .name {
	float: left;
	margin: 0 15px;
}
.init {
	margin: 0 auto;
	width: 100%;
	height: 600px;
/* 	display: inline-block; */
	padding-right: 301px;
	background-color: #47b8e017;
	background-clip: content-box;

}

.init > .no_wrap {
	position: relative;
	width: 674px;
	height: 622px;
	margin: 0 auto;
	text-align: center;
}
.init h1 {
	position: absolute;
	text-align: left;
	top: 350px;
	left: 20%;
	width: 500px;
/* 	line-height: 30px; */
	font-size: 35px;
	color: #292929;
	
}
.init > h1 {
/* 	text-align: left; */
/* 	top: 350px; */
/* 	left: 20%; */
/* 	width: 320px; */
/* 	line-height: 30px; */
/* 	font-size: 24px; */
/* 	color: #292929; */
}
.service {
/* 	height: 400px; */
	padding-right: 301px;
	width: 100%;
	text-align: center;
}

.community {
	padding-right: 301px;
	width: 100%;
	text-align: center;
	
	background-color: #47b8e017;
	background-clip: content-box;
}

.main_no_footer {
	width:100%;
	padding-right: 301px;
	
	box-sizing: border-box;
	text-align: center;
	
}
ul.links {
	padding: 20px 0;
	margin: 0;
	list-style-type: none; 
}
.main_no_footer > ul.links > li {
	display: inline-block;
	margin: 0 5px;
	
	font-family: NanumSquare;
}
li a {

	text-decoration: none !important;
	color: #34314c;
}
.input {
	margin-bottom: 5px;
	padding: 5px 10px;
	border: 1px solid #ccc;
	background-color: white;
	width: 80%;
}
.text {
/* 	background-color: #ffc952; */
	border: 0;
	width: 100%;
	height: 28px;
	line-height: 28px;
	font-size: 16px;
	outline: none;
	vertical-align: center;
}
p.submit{
	width: 80%;
	margin: 0 auto 15px;
	background-color: #47b8e0;
}

#loginBtn {
	height: 40px;
	line-height: 40px;
	color: #fff;
	background-color: transparent;
	cursor: pointer;
	border: none;
}
.copyright {
	font-weight: bold;
}
div.find {
	padding-right: 25px;
	height: 15px;
	line-height: 15px;
	text-align: right;
}
.find a {
	text-decoration: none;
	color: #4c4c4c;
	font-size: 13px;
}
.register {
	padding-right: 25px;
	height: 15px;
	line-height: 15px;
	text-align: right;
}
.register a {
	color: #47b8e0;
	font-size: 13px;
	font-weight: bold;
	text-decoration: none;
}

.service h2, .community h2 {
	padding: 80px 0 30px 0;
/* 	text-align: center; */
	line-height: 30px;
	font-size: 24px;
	color: #292929;
}

strong {
	color: #47b8e0;
}

.paragraph, div.figures {
	padding-bottom: 60px;
}

.paragraph > p {
	line-height: 25px;
	font-size: 16px;
	color: #4c4c4c;
}

.figures > div {
	margin: 0 36px;
	display: inline-block;
}
.figures > div > p.icon {
	width: 80px;
	height: 80px;
	line-height: 80px;
	margin: 0 auto;
	border-radius: 50px;
	background-color: #fff;
}
.figures > div > p.icon > img {
	animation-duration: 0.6s;
}
.figures > div > p.description {
	margin-top: 10px;
	font-size: 14px;
	color: #4c4c4c;
}
.number {
	color: #292929;
	font-family: 'NanumSquareEB', sans-serif;
	transition: width 3s;
}
p.number > strong {
	font-size: 32px;
	display: inline-block;
	margin-left: 5px;
	letter-spacing: -2px;
}

.device {
	position: absolute;
	padding: 20px 50px;
/* 	top: 327px; */
	left: 0;
}

.device > .screen {
/* 	position: relative; */
/* 	z-index: 1; */
	border: 2px solid #d6d6d6;
/* 	border-bottom: 0; */
	border-radius: 18px;
	background-color: #fff;
	overflow: hidden;
	height: 270px;
	width: 540px;
}

#slider {
	/* ul태그의 기본 속성 없애기 */
	padding: 0;
	margin: 0;
	list-style: none;
	
	position: relative;
}

#slider > li {
	position: absolute;
}

#slider li img {
	width: 540px;
	height: 270px;
}

</style>
</head>
<body>


<div class="main_login">

	<div class="main_img">
		<img src="/image/logo.png" style="width: 100px; height: 100px;">
	</div>
	
	<div class="clearfix"></div>

	<form action="/member/login" method="post" id = "login">

		<label class="input"><input type="text" name="email" placeholder="이메일" autocomplete="off" class="text"/></label>
		
		<label class="input"><input type="password" name="password" placeholder="비밀번호" autocomplete="off" class="text"/></label>
		
		<p class="submit">
			<input type="submit" value="로그인" id="loginBtn" />
		</p>
<!-- 		<button class="btn btn-info" id = "btnLogin">로그인</button> -->
	</form>
	
	<div class="find">
		<a class="find" id ="pwFind">비밀번호 찾기</a>
	</div>
	
	<div class="register">
		<a href="/member/join">회원가입</a>
	</div>
	
	<div class="search">
		<p>우리 학교 커뮤니티 둘러보기</p>
		
		<input type="text" name="name" placeholder="찾으시는 캠퍼스를 입력하세요." autocomplete="off" class="text"/>
	</div>
	
	<div class="campuslist">
		<div class="scrollBlind">
		<a href="/kg_main">
			<span class="name">경기대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">경희대</span>
		</a>
		<a href="/unitime">
			<span class="name">마지막</span>
		</a>
		</div>
	</div>
	
</div>

<div class="init">

	<div class="no_wrap">
	
	<div class="device active">
		<div class="screen">
			<ul id="slider">
				<li><img src="/image/tasty.png" /></li>
				<li><img src="/image/default.jpg" width="540px" height="270px"></li>
				<li><img src="/image/search.png" /></li>
				<li><img src="/image/star.PNG" /></li>
			</ul>
			
		</div>
	</div>
	</div>
	
	<h1>대학 생활을 더 편하고 즐겁게,<br><strong>슬기로운 대학생활</strong></h1>

</div>

<div class="service">
	<h2>350만 대학생을 위환<br><strong>대학생 서비스 슬기로운 대학생활!</strong></h2>
	
	<div class="paragraph"> 
		<p>
		시간표 작성, 수업 일정 및 할일 등 편리한 <strong>학업 관리</strong>가 가능하고,<br>
		학식 등 유용한 <strong>학교 생활 정보</strong>를 접할 수 있으며,<br>
		같은 캠퍼스의 학생들과 소통하는 <strong>익명 커뮤니티</strong>를 이용할 수 있습니다.
		</p>
	</div>
	
	<div class="figures">
		<div>
			<p class="number">
				<strong id="memCount"></strong>
				<span>만</span>
			</p>	
			<p class="description">가입한 대학생</p>		
		</div>
		<div>
			<p class="number">
				<strong data-number="1616" id="timeCount"></strong>
				<span>만</span>
			</p>
			<p class="description">만들어진 시간표</p>					
		</div>
		<div>
			<p class="number">
				<strong data-number="152" id="lecCount"></strong>
				<span>만</span>
			</p>			
			<p class="description">강의평/시험정보</p>		
		</div>
		<div>
			<p class="number">
				<strong data-number="71" id="transCount"></strong>
				<span>만</span>
			</p>			
			<p class="description">중고 거래</p>		
		</div>
		<div>
			<p class="number" >
				<strong data-number="4">4</strong>
				<span>억</span>
				<strong data-number="6847" id="boardCount"></strong>
				<span>만</span>
			</p>			
			<p class="description">작성된 게시물</p>		
		</div>
	</div>
</div>


<script>
	function numberCounter(target_frame, target_number) {
	    this.count = 0; this.diff = 0;
	    this.target_count = parseInt(target_number);
	    this.target_frame = document.getElementById(target_frame);
	    this.timer = null;
	    this.counter();
	};
	
	numberCounter.prototype.counter = function() {
	    var self = this;
	    this.diff = this.target_count - this.count;
	
	    if(this.diff > 0) {
	        self.count += Math.ceil(this.diff / 10);
	    }
		
	    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
	    if(this.count < this.target_count) {
	        this.timer = setTimeout(function() { self.counter(); }, 20);
	    } else {
	        clearTimeout(this.timer);
	    }
	};
	
	new numberCounter("memCount", 368);
	new numberCounter("timeCount", 1616);
	new numberCounter("lecCount", 152);
	new numberCounter("transCount", 71);
	new numberCounter("boardCount", 6847);
</script>


<div class="community">
	<h2>전국 400개 캠퍼스<br><strong>재학생 커뮤니티 슬기로운 대학생활!</strong></h2>
	
	<div class="paragraph">
		<p>
		학교 인증을 거친 재학생들의 안전한 대화를 위한 <strong>익명 시스템</strong>과<br>
		많은 대학교에서 활발히 이용하는 재학생 커뮤니티로 자리잡았습니다.
		</p>
	</div>
	
	<div class="figures active">
		<div>
			<p class="icon">
				<img src="/image/icon.authorized.PNG" />
			</p>
			<p>철저한 학교 인증</p>
		</div>
		<div>
			<p class="icon">
				<img src="/image/icon.anonymous.PNG" />
			</p>
			<p>익명 시스템</p>
		</div>
		<div>
			<p class="icon">
				<img src="/image/icon.users.PNG" />
			</p>
			<p>재학생 운영 게시판</p>
		</div>
	</div>

</div>


<div class="main_no_footer">
	<ul class="links">
		<li class="copyright">
			<a href="/main_no">@ 슬기로운대학생활</a>
		</li>
		<li>
			<a href="/info/termofservice">이용약관</a>
		</li>
		<li>
			<a href="/info/privacypolicy">개인정보취급방침</a>
		</li>
	</ul>
</div>


</body>
</html>