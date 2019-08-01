<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="commentdiv">
	<h4>댓글</h4>
	
		
	<c:forEach items="${commentList }" var="i">
		<div id="commentno${i.commentno }" data-commentno="${i.commentno }" class="comment"> 
			<span>${i.writer }</span>
			<span>${i.content }</span>
			<span><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd hh:mm:ss" /></span>
			
			<c:if test="${nick eq i.writer }">
				<a href="javascript:void(0)" onclick="deleteComment(${i.commentno })">삭제</a>
				<a href="javascript:void(0)" onclick="updateComment('${i.commentno }', '${i.content }')">수정</a>
				
				<div id="commentno${i.commentno }" style="display:none;"></div>
			</c:if>
			
			
			<!-- 작성자가 아닌 유저/관리자가 신고할 때 -->
			<c:if test="${nick ne i.writer }">
				<a href="javascript:void(0)" onclick="declare('${i.boardno}','${i.commentno }')" id="cmtDeclare${i.commentno }">신고</a>
			</c:if>
			
		</div>
	</c:forEach>
</div>
