<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
#list td {
font-size: 25px;
text-align: left; 

}
</style> 
<br><br><br><br>
<table id="list" class="table table-striped table-hover table-condensed">

	<tr>
		<td style="width: 25%; text-align: center;"><p>전체 회원 수</p></td>
		<td style="width: 23%"><i><b>${member }</b></i> 명</td>
		<td style="width: 4%;"></td>
		<td style="width: 25%; text-align: center;">전체 블랙리스트 수</td>
		<td style="width: 23%;"><i><b>${blackList }</b></i> 개</td>
	</tr>

	<tr>
		<td style="width: 25%; text-align: center;"><p>전체 신고리스트 수</p></td>
		<td style="width: 23%;"><i><b>${badReport }</b></i></td>
		<td style="width: 4%;"></td>
		<td style="widht: 25%; text-align: center;">전체 방문자 수</td>
		<td style="width: 23%;"><i><b>${visitCntAll }</b></i></td>
	</tr>
	
	<tr>
		<td style="widht: 50%; text-align: center;"><p>오늘 방문자 수</p></td>
		<td><i><b>${visitTodayCnt }</b></i></td>
	</tr>
</table>
<br><br><br><br>
