<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 선택체크 삭제
	$("#btnDelete1").click(function() {
		
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
	// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
	var map = $checkboxes.map(function() {
		return $(this).val();
	});
	var names = map.get().join(",");
	console.log(names);	
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "/member/mypage/delete1")
		.attr("method", "get")
		.append(
			$("<input>")
				.attr("type", "hidden")
				.attr("name", "names")
				.attr("value", names)
		);
	$(document.body).append($form);
	$form.submit();
	});
	
	// 선택체크 삭제
	$("#btnDelete2").click(function() {
		
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
	// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
	var map = $checkboxes.map(function() {
		return $(this).val();
	});
	var names = map.get().join(",");
	console.log(names);
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "/member/mypage/delete2")
		.attr("method", "get")
		.append(
			$("<input>")
				.attr("type", "hidden")
				.attr("name", "names")
				.attr("value", names)
		);
	$(document.body).append($form);
	$form.submit();
	});
	
	// 선택체크 삭제
	$("#btnDelete3").click(function() {
		
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
	// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
	var map = $checkboxes.map(function() {
		return $(this).val();
	});
	var names = map.get().join(",");
	console.log(names);
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "/member/mypage/delete3")
		.attr("method", "get")
		.append(
			$("<input>")
				.attr("type", "hidden")
				.attr("name", "names")
				.attr("value", names)
		);
	$(document.body).append($form);
	$form.submit();
	});
});

</script>

<style type = "text/css">
.mypagelist th{
	text-align : center;
}
.menubar{
margin-left: 0px;
margin-bottom: 30px;
width: 1100px;
height: 130px;
background:#E6E6E6;
}

</style>

<br>
<br>
<br>

<nav>

<div class="col-4">
<div class="menubar" >
<form>

<div class="left">
<br>
<%-- 비로그인 상태 --%>
<c:if test="${empty login }">
<div align="left">
	<strong>로그인이 필요합니다</strong><br>
</div>
</c:if>

<%-- 로그인 상태 --%>
<c:if test="${login }">
<div align="left" style="position: relative; left: 20px; ">
	${nick }님<br><br>
	학번 : ${hakbun }
</div>
</c:if>
</div>
<div style="position: relative; right: -450px; ">
<button type="button" class="btn btn-info" onclick="location.href='/member/modify'">정보수정</button>
<button type="button" class="btn btn-info" onclick="location.href='/member/logout'">로그아웃</button>
</div>
</form>
</div>
</div>

<div class="container">

<div class="row">


<div class="col order-1">
<br>

<hr>
내가 쓴 테이스티 로드 게시글<br><br>

<table style = "text-align : center; margin : auto;" class = "mypagelist">
<thead>
	<tr>
		<th style="width: 3%">글번호</th>
		<th style="width: 3%">태그</th>
		<th style="width: 3%">음식점이름</th>
		<th style="width: 3%">작성자</th>
		<th style="width: 3%">조회수</th>
		<th style="width: 3%">작성일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${tastyList }" var="i">
	<tr>
		<td style="width: 3%">
		<input type="checkbox" name="checkRow" value = "${i.boardno }"/>${i.boardno }</td>
		<td style="width: 3%">${i.tag }</td>
		<td style="width: 3%"><a href="/tasty/view?boardno=${i.boardno }">${i.storeName }</a></td>
		<td style="width: 3%">${i.writer }</td>
		<td style="width: 3%">${i.hit }</td>
		<td style="width: 3%"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</tbody>

</table>
</div>

</div>

</div>
<div id="btnBox" class="float-right" style="text-align: right">
	<button id="btnDelete1" class="btn btn-danger">삭제</button>
</div>

<div class="container">

<div class="row">


<div class="col order-1">
<br>

<hr>
내가 쓴 자유게시판 게시글<br><br>

<table style = "text-align : center; margin : auto;" class = "mypagelist">
<thead>
	<tr>
		<th style="width: 3%">번호</th>
		<th style="width: 3%">태그</th>
		<th style="width: 3%">제목</th>
		<th style="width: 3%">작성자</th>
		<th style="width: 3%">조회수</th>
		<th style="width: 3%">작성일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${freeList }" var="i">
	<tr>
		<td style="width: 3%"><input type="checkbox" name="checkRow" value = "${i.boardno }"/>${i.boardno }</td>
		<td style="width: 3%">${i.tag }</td>
		<td style="width: 3%"><a href="/free/view?tag=${i.tag }&boardno=${i.boardno }">${i.title }</a></td>
		<td style="width: 3%">${i.writer }</td>
		<td style="width: 3%">${i.hit }</td>
		<td style="width: 3%"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</tbody>

</table>
</div>

</div>

</div>
<div id="btnBox" class="float-right" style="text-align: right">
	<button id="btnDelete2" class="btn btn-danger">삭제</button>
</div>

<div class="container">

<div class="row">


<div class="col order-1">
<br>

<hr>
내가 쓴 중고장터 게시글<br><br>

<table style = "text-align : center; margin : auto;" class = "mypagelist">
<thead>
	<tr>
		<th style="width: 3%">글번호</th>
		<th style="width: 3%">태그</th>
		<th style="width: 3%">제목</th>
		<th style="width: 3%">작성자</th>
		<th style="width: 3%">가격</th>
		<th style="width: 3%">작성일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${usedList }" var="i">
	<tr>
		<td style="width: 3%">
		<input type="checkbox" name="checkRow" value = "${i.boardno }"/>${i.boardno }</td>
		<td style="width: 3%">${i.tag }</td>
			<td style="width: 3%"><a href="/used/view?boardno=${i.boardno }">${i.product }</a></td>
		<td style="width: 3%">${i.writer }</td>
		<td style="width: 3%">${i.hit }</td>
		<td style="width: 3%"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</tbody>

</table>
</div>

</div>

</div>
<div id="btnBox" class="float-right" style="text-align: right">
	<button id="btnDelete3" class="btn btn-danger">삭제</button>
</div>

<br>
<br>
<br>
<br><br>
<br>

</nav>



