<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="UsedBoardTable">
	<table class="table table-striped table-hover table-condensed" >
		
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
				작성일
			</th>
			<td style="text-align:center; " colspan="4">
				<fmt:formatDate value="${usedboard.writtendate }" 
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
			<th  style="text-align:center; ">
				태그
			</th>
			<td  style="text-align:center; ">
				${usedboard.tag }
			</td>
			<th style="text-align:center; ">
				작성자
			</th>
			<td style="text-align:center; " colspan="4">
				${usedboard.writer }
			</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<th style="text-align:center;" colspan="1">
				제품
			</th>
			<td style="text-align:center;" colspan="3">
				${usedboard.product }
			</td>
			<td style="text-align:center;" colspan="3">
				<!-- 빈 칸 -->
			</td>
			<th style="text-align:center;" colspan="1">
				가격
			</th>
			<td style="text-align:center; " colspan="2">
				<fmt:formatNumber value="${usedboard.price }" 
			    pattern="###,###.###" /> 
			</td>
		</tr>
		<tr>
			<th style="text-align:center;" colspan="1">
				이미지
			</th>
			<td style="text-align:center;" colspan="8">
				<!-- <a href="/used/usedimgno=${usedimage.usedimgno }">${usedimage.originname }</a> -->
			</td>
		</tr>
		<tr>
			<td style="text-align:center; " colspan="9">
			</td>
		</tr>
		<tr>
			<th style="text-align:center;" colspan="1">
				본문
			</th>
			<td  style="text-align:center;" colspan="9">
				<!-- 빈 칸 -->
			</td>
		</tr>
		<tr>
			<td style="text-align:center; " colspan="9">
				${usedboard.content }
			</td>
		</tr>
	</table>
</div>

<div id="view-buttons">
	<a href="/used/list">
		<button class="btn btn-primary">목록</button>
	</a>
	
	<!-- 접속한 회원의 nick이 해당 게시글의 작성자일 경우 -->
	<c:if test="${nick eq usedboard.writer }">
		<a href="/used/update?boardno=${usedboard.boardno }">
			<button class="btn btn-primary">수정</button>
		</a>
		
		<a href="/used/delete?boardno=${usedboard.boardno }">
			<button class="btn btn-primary">삭제</button>
		</a>
	</c:if>
</div>
<br><br><br>
