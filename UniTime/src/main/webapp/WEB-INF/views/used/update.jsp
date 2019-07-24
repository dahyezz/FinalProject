<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
.usedUpdate table {
	border:1px solid #ccc;
}

.usedUpdate th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
	width: 15%;
}

.usedUpdate td{
	text-align: left;
}

.usedUpdate button {
	background:#ccf;
}

.usedUpdate {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

.commentList {
	text-align: left;
	width:98%;
	margin-left: 10px;
}
</style>	

<div class="usedUpdate">
	<h2>게시글 수정</h2>
	
	<form action="/used/update?boardno=${usedboard.boardno } method="post">
	
	<table class="table table-striped table-hover table-condensed" >
	<tr>
		<th>작성자</th>
		<td>${usedboard.writer }</td>
	</tr>
	<tr>
		<th>태그</th>
		<td colspan="3">
			<select name="tag">
				<c:if test="${usedboard.tag eq 'BUY' }">
					<option value="BUY" selected>BUY</option>
					<option value="SELL" disabled>SELL</option>
				</c:if>
				<c:if test="${usedboard.tag eq 'SELL' }">
					<option value="BUY" disabled>BUY</option>
					<option value="SELL" selected>SELL</option>
				</c:if>
			</select>
		</td>
	</tr>
	
	</table>
	
	</form>
</div>