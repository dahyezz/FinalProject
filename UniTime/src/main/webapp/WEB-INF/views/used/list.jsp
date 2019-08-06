<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    

<style type="text/css">
 #table-list th {
 	text-align: center;
 }
 
 /* 제목 길어지면 길이 컷트되는 스타일 코드 */
 #used-view-title {
 	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
 }
 
 tr th {
  text-align: center;
 }
 
</style>

<div class="ed board-header padding-horizontal-small@margin-bottom-small">
	<h2>중고장터</h2>
	<hr>
</div>


<div class="searchbox-writebutton">
	<span id="searchbox" style="float: left">
		<c:import url="/WEB-INF/views/used/search.jsp" />
	</span>
	<span id="list-buttons" style="float: right">
		<a href="/used/write">
		<button class="btn btn-info">글쓰기</button>
	</a>
</span>
</div>
<br><br>


<div>

<table class="table table-striped table-hover table-condensed">
	
	<tr>
		<th style="width: 7%;">글번호</th>
		<th style="width: 8%;">태그</th>
		<th style="width: 15%">작성자</th>
		<th style="width: 35%">제목</th>
		<th style="width: 12%">가격</th>
		<th style="width: 8%">조회수</th>
		<th style="width: 15%">작성일</th>
	</tr>
	
	<c:forEach items="#{list }" var="i">
	
	<tr>
		<td>${i.boardno }</td>
		<td>${i.tag }</td>
		<td>${i.writer }</td>
		<td id="used-view-ttitle"><a href="/used/view?boardno=${i.boardno }">${i.title }</a></td>
		<td><fmt:formatNumber value="${i.price }" 
		    pattern="###,###.###"/></td>
		<td>${i.hit }</td>
		<td><fmt:formatDate value="${i.writtendate }" 
		    pattern="yyyy-MM-dd" /></td>
	</tr>
		
	</c:forEach>
	
</table>

</div>

<div id="pagingbox" align="center">
	<c:import url="/WEB-INF/views/used/paging.jsp" />
</div>



