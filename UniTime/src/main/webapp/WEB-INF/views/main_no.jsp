<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>메인 추가 예정ㅎ..</h1>

<form action="/member/login" method="post" id = "login">
<table style="text-align: center; margin: auto;">
<tr>
	<th style="width: 100px" scope="row">
	<label>이메일<input type="text" name="email" /></label>
	</th>
</tr>
<tr>
	<th style="width: 100px" scope="row">
	<label>패스워드<input type="password" name="password" /></label><br><br>
	</th>
</tr>
</table>
	<button class="btn btn-info" id = "btnLogin">로그인</button>
</form>

</body>
</html>