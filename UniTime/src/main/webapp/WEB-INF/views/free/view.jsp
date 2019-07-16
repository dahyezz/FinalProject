<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
.freeView table {
	border:1px solid #ccc;
}

.freeView th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
}

.freeView button {
	background:#ccf;
}

.freeView {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
</style>

<div class="freeView">

<h1>게시글 내용</h1>
<hr>

<table class="table table-condensed">
	<tr>
		<th>글번호</th>
		<td colspan="3">${board.boardno }</td>
	</tr>
	<tr>
		<th>태그</th>
		<td colspan="3">${board.tag }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">${board.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.writer }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${board.hit }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td colspan="3"><fmt:formatDate value="${board.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<td colspan="4" style="height:300px;">${board.content }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3"><a href="/free/download?fileno=${viewFile.fileno }">${viewFile.originname }</a></td>
	</tr>
</table>

<!----------- 댓글 ---------------->
<div class="text-center">
<h3 style="float:left;">댓글</h3>
<hr>
	<%-- 로그인 안한 상태 --%>
	<c:if test="${empty login }">
		<table class="table table-condensed">
		<tr>
			<th style="width:100px;"><a href="/member/login">로그인</a></th>
			<td>
			<textarea rows="3" cols="130">로그인 후에 이용 가능합니다.</textarea>
			<button class="btn btn-info">댓글등록</button>
			</td>
		</tr>
		</table>
	</c:if>

	<%-- 로그인 하고있는 상태 --%>
	<c:if test="${login }">
	<form action="/comment/write?boardno=${board.boardno }" method="post">
		<table class="table table-condensed">
		<tr>
			<th style="width:100px;">${nick }</th>
			<td>
			<textarea id="content" name="content" rows="3" cols="130" placeholder="댓글을 입력해주세요."></textarea>
			<button id="btnComment" class="btn btn-info">댓글등록</button>
			</td>
		</tr>
		</table>
	</form>
	</c:if>
</div>

<table class="freeViewComment" style="width:98%;">
<c:forEach items="${commentList}" var="i">
	<tr>
		<td><span style="font-weight:bold;">ID : ${i.writer }</span><br>
			${i.content }<br>
			<span style="color:#ccc;"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></span>
			<c:if test="${nick eq i.writer }">
				<button id="btnCommentDelete" style="float:right;"
				onclick="location.href='/comment/delete?boardno=${board.boardno }&commentno=${i.commentno}'">삭제</button>
			</c:if>
		</td>
	</tr>
</c:forEach>
</table>

<!--------------------------------------->

<div class="text-center">	
	<button id="btnList" onclick="location.href='/free/list'">목록</button>
	<c:if test="${nick eq board.writer }">
		<button id="btnUpdate" onclick="location.href='/free/update?boardno=${board.boardno}'">수정</button>
		<button id="btnDelete" onclick="location.href='/free/delete?boardno=${board.boardno}'">삭제</button>
	</c:if>
</div>

</div>