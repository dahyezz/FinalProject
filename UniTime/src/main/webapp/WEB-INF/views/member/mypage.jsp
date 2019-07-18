<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type = "text/css">

.menubar{
margin-left: 0px;
margin-bottom: 30px;
width: 1100px;
height: 150px;
background:#E6E6E6;
}

</style>

<br>
<br>
<br>

<nav>

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
	${nick }님<br><br>
	학번 : ${hakbun }<br>
</div>
</c:if>
</div>
<br>
<div style="position: relative; right: -450px; ">
<button type="button" class="btn btn-info" onclick="location.href='/member/modify'">정보수정</button>
<button type="button" class="btn btn-info" onclick="location.href='/member/logout'">로그아웃</button>
</div>
</form>
</div>
</div>

<div class="container">

<div class="row">


<div class="col order-1">
<br>

<hr>
내가 쓴 게시글
<table>

<thead>
	<tr>
		<th style="width: 10%;">No</th>
		<th style="width: 15%;">게시판</th>
		<th style="width: 40%;">제목</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>

<tbody>

<c:forEach items="${boardList }" var="i">
	<tr>

	</tr>
</c:forEach>

</tbody>

</table>
</div>

</div>

</div>
<br>
<br>
<br>
<br><br>
<br>







</nav>




