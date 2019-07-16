<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<style type="text/css">
table, th {
	text-align: center;
}

</style>


<form action="/admin/memberDelete" method="get">
<div>
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
		<td><input type="checkbox" value="${i.hakbun }" /></td>
	</tr>
</c:forEach>
</tbody>
<button>회원탈퇴</button>
</div>
</form>
</table>







