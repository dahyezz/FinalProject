<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style type = "text/css">

.menubar{
margin-left: 0px;
margin-bottom: 30px;
width: 200px;
height:300px;
background:#E6E6E6;
}

</style>

<div class="col-4">
<div class="menubar" >
<form>

<div class="left">
<br>
<%-- 비로그인 상태 --%>
<c:if test="${empty login }">
<div align="left">
	<strong>로그인이 필요합니다</strong><br>
</div>
</c:if>

<%-- 로그인 상태 --%>
<c:if test="${login }">
<div align="left" style="position: relative; left: 20px; ">
	<h3>${nick }님</h3><br><br>
	닉네임 : ${nick }<br><br>
	학번 : ${hakbun }
</div>
</c:if>
</div>
<div style="position: relative; left: 40px; bottom: -75px;">
<button type="button" class="btn btn-info" onclick="location.href='/member/secession'">회원 탈퇴</button>
</div>
</form>
</div>
</div>