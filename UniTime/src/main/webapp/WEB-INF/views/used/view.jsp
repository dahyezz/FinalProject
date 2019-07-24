<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		
<style type="text/css">
.usedView table {
	border:1px solid #ccc;
}

.usedView th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
	width: 15%;
}

.usedView td{
	text-align: left;
}

.usedView button {
	background:#ccf;
}

.usedView {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

.commentList {
	text-align: left;
	width:98%;
	margin-left: 10px;
}
</style>		
		
<div class="usedView">
<!-- Controller에서 model에 지정한 dto 이름. -->
<h2>게시글 조회</h2>
	<table class="table table-striped table-hover table-condensed" >
		
		<tr>
			<th>글번호</th>
			<td>
				${usedboard.boardno }
			</td>
			<th>조회수</th>
			<td>
				${usedboard.hit }
			</td>
		</tr>
		<tr>
			<th>태그</th>
			<td colspan="3">
				${usedboard.tag }
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				${usedboard.title }
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="1">
				${usedboard.writer }
			</td>
			<th>작성일</th>
			<td colspan="1">
				<fmt:formatDate value="${usedboard.writtendate }" 
				pattern="yyyy-MM-dd HH:mm"/>
			</td>
		</tr>
		<tr>
			<th>제품명</th>
			<td colspan="3">
				${usedboard.product }
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td colspan="3">
				<fmt:formatNumber value="${usedboard.price }"
				pattern="###,###.###"/>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="height:300px;">
				${usedboard.content }
			</td>
		</tr>
	</table>

<div id="view-buttons">
	<a href="/used/list">
		<button class="btn btn-primary">목록</button>
	</a>
	
	<!-- 접속한 회원의 nick이 해당 게시글의 작성자일 경우 -->
	<c:if test="${nick eq usedboard.writer }">
		<a href="/used/update?boardno=${usedboard.boardno }">
			<button class="btn btn-primary">수정</button>
		</a>
		
		<a href="/used/delete?boardno=${usedboard.boardno }">
			<button class="btn btn-primary">삭제</button>
		</a>
	</c:if>
</div>

</div>
<br>
