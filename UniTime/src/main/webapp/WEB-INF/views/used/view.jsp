<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table class="table table-striped table-hover table-condensed">
	
	<!-- usedBoard -->
	<!-- Controller에서 model에 지정한 dto 이름. -->
	<h2>${usedboard.title }</h2>
	<hr>
	<tr>
		<th style="text-align:center; ">
			글번호
		</th>
		<td style="text-align:center; width: 8%">
			${usedboard.boardno }
		</td>
		<th style="text-align:center; width: 8%">
			태그
		</th>
		<td style="text-align:center; width: 8%">
			${usedboard.tag }
		</td>
		<th style="text-align:center; width: 8%">
			작성일
		</th>
		<td style="text-align:center; " colspan="3">
			<fmt:formatDate value="${usedBoard.writtendate }" 
		    pattern="yyyy-MM-dd" />
		</td>
		<th style="text-align:center; width: 8%">
			조회수
		</th>
		<td style="text-align:center; ">
			${usedboard.hit }
		</td>
	</tr>
	<tr>
		<th style="text-align:center; width: 8%">
			작성자
		</th>
		<td style="text-align:center; " colspan="2">
			${usedboard.writer }
		</td>
		<th style="text-align:center; width: 8%">
			제목
		</th>
		<td style="text-align:center; " colspan="4">
			${usedboard.title }
		</td>
		<th style="text-align:center; width: 8%">
			가격
		</th>
		<td style="text-align:center; width: 8%">
			<fmt:formatNumber value="${usedBoard.price }" 
		    pattern="###,###.###" /> 
		</td>
	</tr>
	<tr>
		<th style="text-align:center; width: 12%">
			이미지
		</th>
		<td style="text-align:center; " colspan="9">
			
		</td>
	</tr>
	<tr>
		<th style="text-align:center; width: 12%">
			본문
		</th>
		<td style="text-align:center; " colspan="9">
			${usedBoard.content }
		</td>
	</tr>
</table>
