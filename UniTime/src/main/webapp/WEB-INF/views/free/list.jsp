<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.freeList table, th {
	text-align: center;
}

.freeList {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

</style>

<div class="freeList">

<h1>게시판 리스트</h1>
<hr>

<div>
<button style="float:right;" class="btn btn-info" onclick="location.href='/free/write'">글쓰기</button>
</div>

<form action="/check/delete" method="get">
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<c:if test="${nick eq admin }">
			<th style="width:10%;"><button>삭제</button></th>
		</c:if>
		<th style="width:10%;">번호</th>
		<th style="width:10%;">태그</th>
		<th style="width:45%;">제목</th>
		<th style="width:15%;">작성자</th>
		<th style="width:10%;">조회수</th>
		<th style="width:10%;">작성일</th>
	</tr>
</thead>

<c:forEach items="${list}" var="i">
	<tr>
		<c:if test="${nick eq admin }">
			<td><input type="checkbox" name="checkDelete" value="${i.boardno }"/></td>
		</c:if>
		<td>${i.boardno }</td>
		<td>${i.tag }</td>
		<td><a href="/free/view?boardno=${i.boardno }">${i.title }</a></td>
		<td>${i.writer }</td>
		<td>${i.hit }</td>
		<td><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
</c:forEach>

</table>
</form>

</div>

<c:import url="/WEB-INF/views/free/paging.jsp" />
