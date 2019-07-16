<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<style type="text/css">
.freeWrite table {
	border:1px solid #ccc;
}

.freeWrite th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
}

.freeWrite button {
	background:#ccf;
}

.freeWrite {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
.freeWrite #content{
	width:98%;
}
</style>

<div class="freeWrite">

<h1>글쓰기</h1>

<form action="/free/write" method="post" enctype="multipart/form-data">
	<table class="table table-condensed">
	<tr>
		<th>작성자</th>
		<td>${nick }</td>
	</tr>
	<tr>
		<th>태그</th>
		<td colspan="3">
			<select name="tag">
			<c:if test="${nick eq admin }">
				<option value="공지">공지</option>
			</c:if>
				<option value="잡담" selected>잡담</option>
				<option value="연애">연애</option>
				<option value="정보공유">정보공유</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" style="width:600px;" name="title" /></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3"> <input type="file" name="file"/></td>
	</tr>
	<tr>
		<th colspan="4">내용</th>
	</tr>
	<tr>
		<td colspan="4">
		<textarea id="content" name="content" rows="10" cols="100" ></textarea>
		</td>
	</tr>
	</table>
	
	<div class="text-center">	
	<button id="btnWrite" >작성</button>
	<button type="button" id="btnCancel" onclick="history.go(-1)">취소</button>
	</div>
</form>

</div>
