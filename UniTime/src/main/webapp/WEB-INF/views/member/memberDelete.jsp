<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#btnMemberDelete {
  background: #ffffff;
  background-image: -webkit-linear-gradient(top, #ffffff, #ffffff);
  background-image: -moz-linear-gradient(top, #ffffff, #ffffff);
  background-image: -ms-linear-gradient(top, #ffffff, #ffffff);
  background-image: -o-linear-gradient(top, #ffffff, #ffffff);
  background-image: linear-gradient(to bottom, #ffffff, #ffffff);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #7f7ffa;
  font-size: 12px;
  padding: 10px 20px 10px 20px;
  border: solid  #47b8e0 1px;
  text-decoration: none;
}

#btnCancel {
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
  font-size: 12px;
  padding: 10px 20px 10px 20px;
  border: solid #ffffff 1px;
  text-decoration: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
		//취소 버튼 누르면 뒤로가기
		$("#btnCancel").click(function() {
			history.go(-1);
		})
	});
</script>
<form role="form" method="post" autocomplete="off">
	<table style="text-align: center; margin: auto;">
		<tr>
			<th style="width: 100px" scope="row"><label>패스워드<input
			type="password" name="password" placeholder=" 비밀번호를 입력하세요" /></label></th>
		</tr>
	</table>
	<button type="submit" id="btnMemberDelete">회원탈퇴</button>
	<button type="button" id="btnCancel">뒤로가기</button>
</form>

<c:if test = "${msg == false }">
<p>
입력한 비밀번호가 잘못되었습니다.
</p>
</c:if>










