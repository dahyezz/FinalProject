<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="commentdiv">
<h5>댓글</h5>

<c:forEach items="${commentList }" var="i">
	<div id="commenttest" data-commentno="${i.commentno }" class="comment"> 
		<span>${i.writer }</span>
		<span>${i.content }</span>
		<span><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd hh:mm:ss" /></span>
		
		<c:if test="${nick eq i.writer }">
			<button onclick="deleteComment(${i.commentno });">삭제</button>
			<div id="update${i.commentno }"  style="display:none;">
				<textarea id="updateContent" name="updateContent" rows="1" cols="70" onkeypress="JavaScript:enter_check();"></textarea>
			</div>
			<button onclick="updateComment(${i.commentno });">수정</button>
		</c:if>
		
	</div>
</c:forEach>
</div>
