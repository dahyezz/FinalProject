<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function() {

	// 회원 삭제
	// 선택체크 삭제
	$("#btnDelete").click(function() {
		// 선택된 체크박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
		//방법1
		// 체크된 대상들을 하나씩 꺼내서 문자열로 합치기
		var badno = "";
		var len = $checkboxes.length;
		$checkboxes.each( function(idx) {
			badno += $(this).val();
			
			if( len-1 != idx ) {
				badno += ",";
			}
		});
		console.log(badno);
		
		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/admin/badReportDelete")
			.attr("method", "get")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "badno")
					.attr("value", badno)
			);
		$(document.body).append($form);
		$form.submit();
	
	});


	// 회원 경고
	// 선택체크 삭제
	$("#btnPenalty").click(function() {
		// 선택된 체크박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
		//방법1
		// 체크된 대상들을 하나씩 꺼내서 문자열로 합치기
		var email = "";
		var len = $checkboxes.length;
		$checkboxes.each( function(idx) {
			email += $(this).val();
			
			if( len-1 != idx ) {
				email += ",";
			}
		});
		console.log(email);
		
		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/admin/memberPenalty")
			.attr("method", "get")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "email")
					.attr("value", email)
			);
		$(document.body).append($form);
		$form.submit();
	
	});
	
	// 검색 기능
	$("#btnSearch").click(function() {
		location.href="/admin/member?search="+$("#search").val();
	});
});

</script>


<style type="text/css">
table, th {
	text-align: center;
}

</style>

<table>
<thead>
	<tr>
		<th style="width: 15%;">번호</th>
		<th style="width: 20%;">게시판종류</th>
		<th style="width: 20%;">해당 글 보러가기</th>
		<th style="width: 25%;">학번</th>
		<th style="width: 15%;">닉네임</th>
		<th style="width: 5%;">
		</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="i">
	<tr>
		<td>${i.badno }</td>
		<td>${i.boardname }</td>
		<td>${i.boardno }</td>
		<td>${i.hakbun }</td>
		<td>${i.nickname }</td>
		<td><input type="checkbox" name="checkRow" value="${i.badno }" /></td>
	</tr>
</c:forEach>
</tbody>
</table>


<div class="text-center">
	<ul class="pagination pagination-sm">
		<!-- 처음으로 가기 -->
		<c:if test="${paging.startPage ne 1 }">
		<li>
			<a href="/admin/badReport"><span>&larr;처음</span></a>
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
			<a href="/admin/badReport?curPage=${paging.curPage-1 }&search=${paging.search }"><span>&laquo;</span></a>
	    </li>
	    </c:if>





		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }"
	     var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
			<c:if test="${paging.curPage eq i}">
			<li class="active">
				<a href="/admin/badReport?curPage=${i }&search=${paging.search }">${i }</a>
			</li>
			</c:if>
		
			<c:if test="${paging.curPage ne i}">
			<li>
				<a href="/admin/badReport?curPage=${i }&search=${paging.search }">${i }</a>
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
			<a href="/admin/badReport?curPage=${paging.curPage+1 }&search=${paging.search }">
			<span>&raquo;</span>
		</a>
		</li>
		</c:if>
	</ul>
</div>


<button id="btnDelete" name="checkRow">삭제</button>
<button id="btnPenalty" name="checkRow">경고부여</button>







