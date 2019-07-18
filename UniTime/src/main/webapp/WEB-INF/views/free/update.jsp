<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<style type="text/css">
.freeUpdate table {
	border:1px solid #ccc;
}

.freeUpdate th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
}

.freeUpdate {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
.freeUpdate #content{
	width:98%;
}
</style>

<div class="freeUpdate">

<h1>글쓰기</h1>

<form action="/free/update?boardno=${board.boardno }" method="post">
	<table class="table table-condensed">
	<tr>
		<th>글번호</th>
		<td colspan="3">${board.boardno }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.writer }</td>
	</tr>
		<tr>
		<th>태그</th>
		<td colspan="3">
			<select name="tag">
			<c:if test="${nick eq 'admin' }">
				<option value="공지" selected>공지</option>
				<option value="잡담">잡담</option>
			</c:if>
			<c:if test="${nick ne 'admin' }">
				<option value="잡담" selected>잡담</option>
			</c:if>				
				<option value="연애">연애</option>
				<option value="정보공유">정보공유</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" style="width:600px;" name="title" value="${board.title }"/></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3"> <input type="file" name="file" /></td>
	</tr>
	<tr>
		<th colspan="4">내용</th>
	</tr>
	<tr>
		<td colspan="4">
		<textarea id="content" name="content" rows="10" cols="100" >${board.content }</textarea>
		</td>
	</tr>
	</table>
	
	<button id="btnUpdate">수정 적용</button>
	<button type="button" id="btnCancel" onclick="history.go(-1)">취소</button>
</form>

</div>

