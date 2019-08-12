<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnSearch").click(function() {
		location.href="/used/list?searchType="+$("#searchType").val()+"&keyword="+$("#keyword").val();
	});
});
</script>

	<span class="form-inline text-center">
		<select name="searchType" class="selectpicker">
			<option value="total" selected>전체</option>
			<option value="title">제목</option>
			<option value="product">제품</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		
		<input class="form-control" type="text" id="search" placeholder="검색어를 입력해주세요."/>
		<button id="btnSearch" class="btn">검색</button>
		
	</span>