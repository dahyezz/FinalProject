<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#btnWrite').click(function() {
		$(location).attr("href","/tasty/write");
	})
	
	//체크 삭제 버튼 동작
	$("#btnDelete").click(function() {
		
		// 선택된 체크 박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
		// 체크된 대상들을 map으로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var names = map.get().join(",");
		
// 		console.log($checkboxes)
// 		console.log("map : " +map);
// 		console.log("names : " + names);

		//전송 폼
		var $form = $("<form>")
				.attr("action","/tasty/listDelete")
				.attr("method", "POST")
				.append(
					$("<input>")
							.attr("type","hidden")
							.attr("name", "names")
							.attr("value", names)
				);
		$(document.body).append($form);
		$form.submit();
				
		
	});
	
});

// 전체 체크/체크해제 되는 동작
function checkAll() {
	
	//checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");
	
	// checkAll 체크 상태 
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ){
		$checkboxes.each(function() {
			this.checked = true;
		});
	} else {
		$checkboxes.each(function() {
			this.checked = false;
		});
	}
}

</script>

<style type="text/css">

.tastylist th {
	text-align: center;
}

</style>

<div class="ed board-header padding-horizontal-small@s margin-bottom-small">
	<h3>테이스티로드</h3>
</div>

<table style="text-align: center; margin: auto;" class="tastylist">
	<tr>
		<c:if test="${nick eq 'admin' }">
		<th style="width: 5%"><input type="checkbox" id="checkAll" onclick="checkAll();" /></th>
		</c:if>
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
		<c:if test="${nick eq 'admin' }">
			<td><input type="checkbox" name="checkRow" value="${i.boardno }" /></td>
		</c:if>
		<td>${i.boardno }</td>
		<td>${i.tag }</td>
		<td><a href="/tasty/view?boardno=${i.boardno }">${i.storeName }</a></td>
		<td>${i.loc }</td>
		<td>${i.writer }</td>
		<td>${i.hit }</td>
		<td style="color: gold;">
			<c:if test="${i.score eq 1 }">★</c:if>
			<c:if test="${i.score eq 2 }">★★</c:if>
			<c:if test="${i.score eq 3 }">★★★</c:if>
			<c:if test="${i.score eq 4 }">★★★★</c:if>
			<c:if test="${i.score eq 5 }">★★★★★</c:if>
		</td>
		<td>${i.commentCnt }</td>
		<td><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</table>

<c:if test="${nick eq 'admin' }">
<button id="btnDelete" class="btn btn-warning pull-left">삭제</button>
<div class="clearfix"></div>
</c:if>

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