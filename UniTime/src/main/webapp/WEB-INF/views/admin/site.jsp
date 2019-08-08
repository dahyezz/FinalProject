<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.footer {
	position: absolute;
	width: 100%;
	bottom: 0;
}
.list table, th {
	rext-align: center;
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
.air tr {
}
</style> 

<table class="table table-striped table-hover table-condensed">

	<tr>
		<th style="width: 25%;">전체 회원 수</th>
		<th style="width: 23%">${member }</th>
		<th style="width: 4%;"></th>
		<th style="width: 25%;">전체 블랙리스트 수</th>
		<th style="width: 23%;">${blackList }</th>
	</tr>

	<tr>
		<th style="width: 25%;">전체 신고리스트 수</th>
		<th style="width: 23%;">${badReport }</th>
		<th style="width: 4%;"></th>
		<th style="widht: 25%;">전체 방문자 수
		<th style="width: 23%;">${visitCntAll }</th>
	</tr>
	
	<tr>
		<th style="widht: 50%;">오늘 방문자 수
		<th>${visitTodayCnt }</th>
	
</table>