<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style rel="stylesheet">
#form {
  z-index: 15;
  position: relative;
  background: #FFFFFF;
  width: 600px;
  border-radius: 4px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
  box-sizing: border-box;
  margin: 100px auto 10px;
  overflow: hidden;
}
#btnLogin {
  background:  #47b8e0;
  background-image: -webkit-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: -moz-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: -ms-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: -o-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: linear-gradient(to bottom,  #47b8e0,  #47b8e0);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  padding: 7px 20px 7px 20px;
  border: solid #ffffff 1px;
  text-decoration: none;
}

#btnLogin:hover {
  text-decoration: none;
}
</style>
<br><br>
<h5>로그인</h5>

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

<br><br><br><br><br>
