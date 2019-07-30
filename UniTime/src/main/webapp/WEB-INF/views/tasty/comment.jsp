<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
$(document).ready(function() {
	
	var result = new Array();
	
	<c:forEach items="${commentList }" var="c">
		var json = new Object();
		json.serverId="${c.commentno }";
		json.serverName="${c.badCnt }";
		result.push(json);
	</c:forEach>

	var commentno = "";
	
	
	var loginUser = document.getElementById('login').value;
	console.log(loginUser);
	
	if(loginUser != 'admin'){
		for(var i=0 ;i<result.length; i++){
//	 		console.log(result[i].serverName)
			if(result[i].serverName == '1'){
				commentno = result[i].serverId;
				$('#commentno'+commentno).html('관리자에 의해 규제된 댓글입니다.')
			}
		}
	}
	
	if(loginUser == 'admin'){
		for(var i=0 ;i<result.length; i++){
	 		
			if(result[i].serverName == '1'){
				
				commentno = result[i].serverId;
				var htmls = document.getElementById("commentno"+commentno);
				htmls.innerHTML += '<span>신고됨</span>'
			}
		}
	}
	


});
</script>

<div id="commentdiv">
<h5>댓글</h5>

<input type="hidden" id="login" value="${nick }" />
<c:forEach items="${commentList }" var="i">
	<div id="commentno${i.commentno }" data-commentno="${i.commentno }" class="comment"> 
	
		<span>${i.writer }</span>
		<span>${i.content }</span>
		<span><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd hh:mm:ss" /></span>
		
		<c:if test="${nick eq i.writer }">
			<a href="javascript:void(0)" onclick="deleteComment('${i.commentno}')" >삭제</a>
			<a href="javascript:void(0)" onclick="updateComment('${i.commentno}','${i.content }')" >수정</a>
				<div id="commentre${i.commentno }" style="display:none;"></div>
		</c:if>
		
		<c:if test="${nick ne i.writer && nick ne 'admin'}">
			<a href="javascript:void(0)" onclick="declare('${i.boardno}','${i.commentno }')" id="cmtDeclare${i.commentno }">신고</a>
		</c:if>
		
		
	</div>
</c:forEach>
</div>
