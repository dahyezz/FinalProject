<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#btnList').click(function() {
		$(location).attr("href","/tasty/list");
	});
	
	$('#btnUpdate').click(function() {
		$(location).attr("href","/tasty/update?boardno="+${board.boardno });
	})
	
	$('#btnDelete').click(function() {
		$(location).attr("href","/tasty/delete?boardno="+${board.boardno });
	});
});
</script>

<div class="ed board-header padding-horizontal-small@s margin-bottom-small">
	<h3>테이스티로드</h3>
</div>

<table class="table table-bordered" style="text-align: center;">
	<tr>
		<td class="info">글번호</td><td colspan="3">${board.boardno }</td>
	</tr>
	
	<tr>
		<td class="info">음식점이름</td><td colspan="3">${board.storeName }</td>
	</tr>
	
	<tr>
		<td class="info">닉네임</td><td>${board.writer }</td>
	</tr>
	
	<tr>
		<td class="info">조회수</td><td>${board.hit }</td>
		<td class="info">추천수</td><td id="recommend">추가예정</td>
	</tr>
	
	<tr>
		<td class="info">작성일</td><td colspan="3"><fmt:formatDate value="${board.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	
	
	<tr><td class="info" colspan="4">본문</td></tr>
	<tr><td colspan="4">${board.content }</td></tr>
</table>


<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>

	<c:if test="${nick eq board.writer }">
		<button id="btnUpdate" class="btn btn-warning">수정</button>
		<button id="btnDelete" class="btn btn-warning">삭제</button>
	</c:if>
</div>