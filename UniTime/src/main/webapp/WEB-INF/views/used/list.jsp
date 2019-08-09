<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    

<style type="text/css">
 #table-list th {
 	text-align: center;
 }
 
 /* 제목 길어지면 길이 컷트되는 스타일 코드 */
 #used-view-title {
 	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
 }
 
 tr th {
  text-align: center;
 }
 
 #thumbnail {
 	width: 120px;
 }
 
 
</style>

<div class="ed board-header padding-horizontal-small@margin-bottom-small">
	<h2>중고장터</h2>
</div>


<div class="searchbox-writebutton">
	<span id="searchbox" style="float: left">
		<c:import url="/WEB-INF/views/used/search.jsp" />
	</span>
	<span id="list-buttons" style="float: right">
		<a href="/used/write">
		<button class="btn btn-info">글쓰기</button>
	</a>
</span>
</div>
<br><br>


<div>
	<table class="table table-striped table-hover table-condensed" style="width:100%;">
	    <tr>
	    	<th style="width: 125px; font-size: 1.3em;">이미지</th>
	    	<th colspan="4" style="font-size: 1.3em;">거래 게시글</th>
	    </tr>
	    <c:forEach items="${list }" var="i">
		    <tr style="text-align: center">
		    	<td rowspan="4">
		    		<!-- 파일이 존재하지 않을 경우  -->
		    		<c:if test="${i.fileno eq 0 }">
						<img id="thumbnail" class="card-image-top img-fluid" src="/image/noimage.jpg">
					</c:if>
					<!-- 파일이 존재할 경우  -->
					<c:if test="${i.fileno ne 0 }">
						<img id="thumbnail" class="card-image-top img-fluid" src="/usedImage?usedImgNo=${i.fileno }">
					</c:if>
		    	</td>
		        <td>
		        	<c:if test="${i.tag =='SELL' || i.tag == 'sell' }">
		        		<span style="color: red; font-size: 1.1em;"><b>${i.tag }</b></span>
		    		</c:if>
		    		<c:if test="${i.tag == 'BUY' || i.tag == 'buy'}">
		    			<span style="color: blue; font-size: 1.1em;"><b>${i.tag }</b></span>
		    		</c:if>
		        </td>
		        <td colspan="3"><a href="/used/view?boardno=${i.boardno }"><span style="font-size: 1.3em;">${i.title }</span></a></td>
		    </tr>
		    <tr>
		    	<th>조회수</th>
		        <td>${i.hit }</td>
		        <th>댓글 수</th>
		        <td>${i.commentCnt }</td>
		    </tr>
		    <tr>
		    	<th>제품</th>
		        <td>${i.product }</td>
		        <th>가격</th>
		        <td><fmt:formatNumber value="${i.price }" 
			    pattern="###,###.###"/></td>
		    </tr>
		    <tr>
		    	<th>작성자</th>
		        <td>${i.writer }</td>
		        <th>작성일</th>
		        <td><fmt:formatDate value="${i.writtendate }" 
			    pattern="yyyy-MM-dd" /></td>
		    </tr>
		</c:forEach>
	</table>
</div>

<div id="pagingbox" align="center">
	<c:import url="/WEB-INF/views/used/paging.jsp" />
</div>

