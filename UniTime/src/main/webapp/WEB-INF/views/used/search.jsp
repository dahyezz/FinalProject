<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnSearch").click(function() {
		location.href="/used/list?search="+$("#search").val();
	});
});
</script>

<span class="form-inline text-center">
	<input class="form-control" type="text" id="search" />
	<button id="btnSearch" class="btn">검색</button>
</span> 