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
			.attr("action", "/admin/memberDelete")
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
		location.href="/admin/badReport?search="+$("#search").val();
	});
});


</script>
    
<style type="text/css">
table, th {
	text-align: center;
}

</style>
<div class="form-inline text-center">
	<input type="button" value="신고리스트" onclick="location.href='/admin/badReport'"/>
	
	<input class="form-control" type="text" placeholder="이름을 입력하세요." id="search" />
	<button id="btnSearch" class="btn">검색</button>
	
</div> 

<table>
<thead>
	<tr>
		<th style="width: 15%;">학과코드</th>
		<th style="width: 20%;">학번</th>
		<th style="width: 10%;">이름</th>
		<th style="width: 25%;">이메일</th>
		<th style="width: 15%;">닉네임</th>
		<th style="width: 10%;">경고횟수</th>
		<th style="width: 5%;">
		</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="i">
	<tr>
		<td>${i.departmentCode }</td>
		<td>${i.hakbun }</td>
		<td>${i.name }</td>
		<td>${i.email }</td>
		<td>${i.nickname }</td>
		<td>${i.penalty }</td>
		<td><input type="checkbox" name="checkRow" value="${i.email }" /></td>
	</tr>
</c:forEach>
</tbody>
</table>


<div class="text-center">
	<ul class="pagination pagination-sm">
		<!-- 처음으로 가기 -->
		<c:if test="${paging.startPage ne 1 }">
		<li>
			<a href="/admin/member"><span>&larr;처음</span></a>
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
			<a href="/admin/member?curPage=${paging.curPage-1 }&search=${paging.search }"><span>&laquo;</span></a>
	    </li>
	    </c:if>





		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }"
	     var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
			<c:if test="${paging.curPage eq i}">
			<li class="active">
				<a href="/admin/member?curPage=${i }&search=${paging.search }">${i }</a>
			</li>
			</c:if>
		
			<c:if test="${paging.curPage ne i}">
			<li>
				<a href="/admin/member?curPage=${i }&search=${paging.search }">${i }</a>
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
			<a href="/admin/member?curPage=${paging.curPage+1 }&search=${paging.search }">
			<span>&raquo;</span>
		</a>
		</li>
		</c:if>
	</ul>
</div>


<button id="btnDelete" name="checkRow">삭제</button>
<button id="btnPenalty" name="checkRow">경고부여</button>







