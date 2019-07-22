<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="ed board-header padding-horizontal-small@margin-bottom-small">
	<h2>중고장터에서 거래하기</h2>
	<hr>
</div>

<form action="/used/write" method="post"
    enctype="multipart/form-data">
	<table class="table table-condensed" style="text-align:center;">
		<tr>
			<th>태그</th>
			<td>
				<select name="tag">
					<option value="buy">BUY</option>
					<option value="sell">SELL</option>
				</select>
			</td>
			
			<th>제품명</th>
			<td>
				<input type="text" 
				name="product" style="width: 150px;"/>
			</td>
			
			<th>가격</th>
			<td>
				<input type="text" 
				name="price" style="width: 100px;"/>
			</td>
		</tr>
		
		<tr>
			<th colspan="2">제목</th>
			<td colspan="4">
				<input type="text" 
				name="title" style="width: 600px;"/>
			</td>
		</tr>
		<tr>
			<th colspan="2">이미지 첨부</th>
			<td colspan="4">
				<input type="file" name="usedimg"/>
			</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td colspan="4">
				<textarea name="content" style="width:600px;">
				</textarea>
			</td>
		</tr>
	</table>
	
	<div id="write-buttons">
	    <button class="btn btn-info">작성</button>
	    <button class="btn btn-info">취소</button>
	</div>
	
</form>

