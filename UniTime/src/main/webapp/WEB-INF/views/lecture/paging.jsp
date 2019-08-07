<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
.pagination>li:first-child {
	border-radius: 500px 0 0 500px;
}
.pagination>li {
	display: inline-block;
	margin: 0;
	background-color: #f8f8f8;
}
.pagination {
	border-radius: 500px !important;
}
.pagination-sm>li>a, .pagination-sm>li>span{
	border-radius: 15px;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
	color: #34314c;
	background-color: #47b8e0;
	border-color: #47b8e0;
}
.pagination-sm>li:first-child>a, .pagination-sm>li:first-child>span {
	border-radius: 15px;
/* 	background-color: #47b8e017; */
}
.pagination-sm>li:last-child>a, .pagination-sm>li:last-child>span {
	border-radius: 15px;
}
.pagination>li>a, .pagination>li>span {
	color: #34314c;
	border: none;
}
</style>

<div class="pagination-container padding-horizontal-small@s">
	<ul class="pagination pagination-sm">
		<!-- 처음으로 가기 -->
		<c:if test="${paging.curPage ne 1 }">
		<li>
			<a href="/lecture/list"><span>&larr;처음</span></a>
		</li>
		</c:if>

		<!-- 이전 페이지 -->
		<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
		<c:if test="${paging.curPage eq 1 }">
		<li class="disabled">
			<span>&laquo;</span>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne 1 }">
		<li>
			<a href="/lecture/list?curPage=${paging.curPage-1 }&searchType=${searchType }&keyword=${keyword }"><span>&laquo;</span></a>
	    </li>
	    </c:if>

		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }" var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
			<c:if test="${paging.curPage eq i}">
			<li class="active">
				<c:if test="${searchType eq null and keyword eq null }">
					<a href="/lecture/list?curPage=${i }">${i }</a>
				</c:if>
				<c:if test="${searchType ne null and keyword ne null }">
					<a href="/lecture/list?curPage=${i }&searchType=${searchType }&keyword=${keyword }">${i }</a>
				</c:if>
			</li>
			</c:if>
		
			<c:if test="${paging.curPage ne i}">
			<li>
				<c:if test="${searchType eq null and keyword eq null }">
					<a href="/lecture/list?curPage=${i }">${i }</a>
				</c:if>
				<c:if test="${searchType ne null and keyword ne null }">
					<a href="/lecture/list?curPage=${i }&searchType=${searchType }&keyword=${keyword }">${i }</a>
				</c:if>
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
			<a href="/lecture/list?curPage=${paging.curPage+1 }&searchType=${searchType }&keyword=${keyword }">
			<span>&raquo;</span>
		</a>
		</li>
		</c:if>
	</ul>
</div>
