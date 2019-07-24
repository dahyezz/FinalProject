<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="ed board-header padding-horizontal-small@margin-bottom-small">
	<h2>중고장터에서 거래하기</h2>
</div>


<form action="/used/write" method="post"
    enctype="multipart/form-data">
	<table class="table table-condensed" style="text-align:center;">
		<tr>
			<th>작성자</th>
			<td>${nick }</td>
			
			<th>태그</th>
			<td>
				<select name="tag">
					<option value="buy">BUY</option>
					<option value="sell">SELL</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>제품명</th>
			<td>
				<input type="text" style="width: 300px;"
				name="product"/>
			</td>
			
			<th>가격</th>
			<td>
				<input type="text" 
				name="price" />
			</td>
		</tr>
		
		<tr>
			<th >제목</th>
			<td colspan="3">
				<input type="text" style="width:600px;" 
				name="title"/>
			</td>
		</tr>
		<tr>
			<th class="used-write-col1">이미지 첨부</th>
			<td colspan="3">
				<input type="file" name="usedimg"/>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<textarea id="content" name="content" style="width:750px;">
				</textarea>
			</td>
		</tr>
	</table>
	
	<div id="write-buttons">
	    <button id="btnWrite" class="btn btn-info">작성</button>
	    <button type="button" id="btnCancle" class="btn btn-info"
	    	onclick="history.go(-1)">취소</button>
	</div>
	
</form>

