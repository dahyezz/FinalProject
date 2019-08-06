<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
.list table, td{
	margin: auto;
	text-align: center;
}
.list td{
	width: 500px;
	height: 200px;
}
.list a{
display:none;
}
.list td:hover a{
display:block; 
 }
.menu td:hover p{
display:none;
}

</style>
<br><br><br><br>
<div class="list">
<table border="1" style="background: white;">
	<tr>
		<td onclick="location.href='/admin/site'" style="cursor:pointer;">
		<p style="font-size:35px">사이트 관리</p> 방문자, 회원, 블랙리스트, 신고리스트 현황 조회</td>
		<td onclick="location.href='/admin/member'" style="cursor:pointer;">
		<p style="font-size:35px">회원리스트</p> 모든회원정보 조회, 수정, 삭제</td>
	</tr>
	<tr>
		<td>
		<p class="menu" style="font-size:35px">게시판 관리</p> 공지사항 입력, 모든 게시글 조회, 수정, 삭제
		<p><a href="/free/list">자유게시판</a></p>
		<p><a href="/lecture/list">강의평가</a></p>
		<p><a href="/used/list">중고장터</a><p>
		<p><a href="/tasty/list">테이스티로드</a></p>
		
		</td>
		<td onclick="location.href='/admin/black'" style="cursor:pointer;">
		<p style="font-size:35px">블랙리스트</p> 블랙리스트 조회, 삭제 관리</td>
		
	</tr>
		


</table>
</div>


















<br><br><br><br><br><br>