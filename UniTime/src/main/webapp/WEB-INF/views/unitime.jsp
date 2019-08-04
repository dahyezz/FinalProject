<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 대학생활</title>
<link rel="shortcut icon" type="image/x-icon" href="/image/logo.png" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#go_main').click(function() {
		$(location).attr("href","/main");
	})
});
</script>

<style type="text/css">
body {
	background-color: #47b8e017;
}

h1, p, button {
	font-family: 'NanumSquare', sans-serif;
}
.img {
	width: 60%;
	height: 60%;
	
	margin: 0 auto;
	text-align: center;
}

.text {
	width: 80%;
	height: 80%;
	
	margin: 0 auto;
	text-align: center;
}

#go_main {
	height: 30px;
	line-height: 30px;
	color: #fff;
	background-color: #47b8e0;
	cursor: pointer;
	border: none;
}

</style>

</head>
<body>

<div class="img">
	<img src="/image/logo.png">
</div>

<div class="text">
	<h1>죄송합니다. 현재 찾을 수 없는 페이지를 요청 하셨습니다.</h1>
	<br>
	<p>존재하지 않는 주소를 입력하셨거나, <br>
	요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.
	<br><br>
	감사합니다.
	</p>
	
	<button id="go_main">메인으로</button>
	
</div>

</body>
</html>