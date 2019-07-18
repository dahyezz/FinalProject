<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#btnWrite').click(function() {
		$(location).attr("href","/tasty/write");
	})
	
});
</script>

<div class="ed board-header padding-horizontal-small@s margin-bottom-small">
	<h3>테이스티로드</h3>
</div>

<table style="text-align: center; margin: auto;">
	<tr>
		<th style="width: 5%">글번호</th>
		<th style="width: 10%">태그</th>
		<th style="width: 20%">음식점이름</th>
		<th style="width: 10%">위치</th>
		<th style="width: 5%">작성자</th>
		<th style="width: 5%">조회수</th>
		<th style="width: 5%">별점</th>
		<th style="width: 5%">댓글</th>
		<th style="width: 10%">작성일</th>
	</tr>
	
	<c:forEach items="#{list }" var="i">
	<tr>
		<td>${i.boardno }</td>
		<td>${i.tag }</td>
		<td><a href="/tasty/view?boardno=${i.boardno }">${i.storeName }</a></td>
		<td>${i.loc }</td>
		<td>${i.writer }</td>
		<td>${i.hit }</td>
		<td>${i.score }</td>
		<td>${i.comment }</td>
		<td><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</table>


<div class="content text-center pagination-container">
	<ul class="pagination pagination-sm">
		<!-- 이전 페이지 -->
		<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
		<c:if test="${paging.curPage eq 1 }">
		<li class="disabled">
			<span>&laquo;</span>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne 1 }">
		<li>
			<a href="/tasty/list?curPage=${paging.curPage-1 }"><span>&laquo;</span></a>
	    </li>
	    </c:if>

		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }"
	     var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
			<c:if test="${paging.curPage eq i}">
			<li class="active">
				<a href="/tasty/list?curPage=${i }">${i }</a>
			</li>
			</c:if>
		
			<c:if test="${paging.curPage ne i}">
			<li>
				<a href="/tasty/list?curPage=${i }">${i }</a>
			</li>
			</c:if>
			
	    </c:forEach>
		
		<!-- 다음 페이지 -->
		<c:if test="${paging.curPage eq paging.totalPage }">
		<li class="disabled">
			<span>&raquo;</span>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne paging.totalPage }">
		<li>
			<a href="/tasty/list?curPage=${paging.curPage+1 }">
			<span>&raquo;</span>
		</a>
		</li>
		</c:if>
	</ul>
</div>

<div class="text-center">
	<button id="btnWrite" class="btn btn-primary">글쓰기</button>
</div>