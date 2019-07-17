<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="text-center" align="center">
	<ul class="pagination pagination-sm">
	
		<!-- 처음으로 가기 -->
		<c:if test="${paging.curPage ne 1 }">
			<li>
				<a href="/used/list"><span>처음&ensp;</span></a>
			</li>
		</c:if>


		<!-- 이전 페이지 -->
		<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
		<c:if test="${paging.startPage eq 1 }">
			<li class="disabled">
				<span>&ensp;&laquo;</span>
			</li>
		</c:if>

		<c:if test="${paging.startPage ne 1 }">
			<li>
				<a href="/used/list?curPage=${paging.startPage - paging.pageCount }"><span>&ensp;&laquo;</span></a>
		    </li>
	    </c:if>


		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }"
	     var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
			<c:if test="${paging.curPage eq i}">
				<li class="active">
					<a href="/used/list?curPage=${i }">&ensp;${i }</a>
				</li>
			</c:if>
		
			<c:if test="${paging.curPage ne i}">
				<li>
					<a href="/used/list?curPage=${i }">&ensp;${i }</a>
				</li>
			</c:if>
			
	    </c:forEach>

		
		<!-- 다음 페이지 -->
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="disabled">
				<span>&ensp;&raquo;</span>
			</li>
		</c:if>

		<c:if test="${paging.curPage ne paging.totalPage }">
			<li>
				<a href="/used/list?curPage=${paging.startPage + paging.pageCount }">
				<span>&ensp;&raquo;</span>
			</a>
			</li>
		</c:if>
		
		<!-- 끝으로 가기 -->
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li>
				<a href="/used/list?curPage=${paging.totalPage }"><span>&ensp;끝</span></a>
			</li>
		</c:if>
		
	</ul>
</div>