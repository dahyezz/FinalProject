<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div id="commentdiv">
	<c:if test="${usedboard.commentCnt == 0 }">
		<span style="font-size: 1.5em;">댓글</span>
	</c:if>
	<c:if test="${usedboard.commentCnt != 0 }">
		<span style="font-size: 1.5em;">댓글&nbsp;</span>
		<span style="font-size: 1.5em;">${usedboard.commentCnt }</span>
		<span style="font-size: 1.5em;">개</span>
	</c:if>

	
	
	<!-- 댓글 목록 조회 -->
	<br>
	<c:forEach items="${commentList }" var="i">
		<div id="commentno${i.commentno }" data-commentno="${i.commentno }" class="comment"> 
			<span>${i.writer }</span>
			<span>${i.content }</span>
			<span><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd hh:mm:ss" /></span>
			
			<c:if test="${nick eq i.writer }">
				<a href="javascript:void(0)" onclick="updateComment('${i.commentno }', '${i.content }')">수정</a>
				<a href="javascript:void(0)" onclick="deleteComment(${i.commentno })">삭제</a>
				
				<div id="commentre${i.commentno }" style="display:none;"></div>
			</c:if>
		</div>
	</c:forEach>
	
	
	<!-- 댓글 작성창 -->
	<br>	
	<label>${nick }
		<textarea id="content" name="content" rows="1" cols="70" placeholder="건전하고 상호존중하는 문화를 위한 깨끗한 댓글만 달아주세요."></textarea>
 		
 		<!-- 엔터키로 댓글 입력  -- doesn't works
		<script>
		$("#content").keyup(function(e){ 
	        var code = e.which;
	        if(code==13){
	        	e.preventDefault();
	       	 	$('cmtWrite').click(writeComment());
	        } 
		}); 
		</script>
		-->

	</label>
	
	<input type="hidden" name="writer" id="writer" value="${nick }" />
	
	<button id="cmtWrite" name="cmtWrite" class="btn" >입력</button>
	
</div>
