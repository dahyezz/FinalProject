<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style type="text/css">
.lectureWrite table {
	border:1px solid #ccc;
}

.lectureWrite th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
}

.lectureWrite button {
	background:#ccf;
}

.lectureWrite {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
.lectureWrite #content{
	width:98%;
}
</style>

<div class="lectureWrite">

<h1>글쓰기</h1>

<form action="/lecture/write" method="post">	
	<table class="table table-condensed">
	<tr>
		<th>작성자</th>
		<td>※ 강의평가 게시판은 익명으로 작성됩니다.</td>
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
		<textarea id="summernote" name="content">불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다.</textarea>
		</td>
	</tr>
	</table>
	
	<div class="text-center">	
	<button type="submit" id="btnWrite" >작성</button>
	<button type="button" id="btnCancel">취소</button>
	</div>
	
	<input type="hidden" name="boardno" id="boardno" value="1" />
</form>

</div>
