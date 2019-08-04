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

<style type="text/css">
.comment-list {
	text-align: left;
	padding: 15px;
	background-color: #ffc9521a;
	margin-bottom: 15px;
}

.comment-header {
	text-align: left;
	margin-top: 30px;
}
.comment-header>h4 {
	font-size: 20px;
	line-height: 1.4;
}
.comment-update {
	text-align: right;
}
.comment {
/* 	margin-bottom: 10px; */
}
.comment-update {
	box-sizing: inherit;
	display: inline-block;
	float: right;
}
.comment-writer-info {
	display: inline-block;
	box-sizing: inherit;
	vertical-align: -webkit-baseline-middle;
}
.comment-clearfix {
	width: 25px;
/* 	height: 50px; */
/* 	margin: 10px; */
	display: inline-block;
}
.comment_writer_nick {
	font-size: 14px;
	font-weight: 700;
	margin-bottom: 15px;
	margin-right: 10px;
}
.comment_writtendate {
	color: #585353;
}
.eq_writer {
	text-indent: -1px;
	letter-spacing: -1px;
	display: inline-block;
	font-size: 11px;
	width: 45px;
	margin: 0 8px 0 -5px;
	border: 1px solid;
	border-radius: 8px;
	text-align: center;
	height: 14px;
	color: #ff7473;
}
.comment-writer-info>a, .comment-update>a, .up>a  {
	text-decoration: none;
	color: black;
}
.recomment {
	margin-left: 5px;
}
.comment-content>span {
	margin-left: 37px;
}
.form-control {
	
}
.comment_hr {
	height: 1px;
	padding: 0;
	margin: 10px 0;
	border: 0;
	border-top: 1px dotted #9e9e9e;
}
</style>

<input type="hidden" id="login" value="${nick }" />


<div id="commentdiv">
<%-- <input type="hidden" name="count" value="${commentList.size }" /> --%>
<div class="comment-header">
	<h4>${cmtCount }개의 평가</h4>
</div>
	
	<div class="comment-list">
	<c:forEach items="${commentList }" var="i">
		<div id="commentno${i.commentno }" data-commentno="${i.commentno }" data-refCommentno="${i.refCommentno }" data-dept="${i.dept }" class="comment"> 
	
<%-- 			<c:forEach  begin="1" end="${i.dept }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach> --%>
	
			<c:if test="${i.dept ne 0 }"><div class="comment-clearfix"></div></c:if>
	
			<div class="comment-writer-info">
				<span class="comment_writer_nick" >${i.writer }</span>
				<c:if test="${i.writer eq board.writer }">
					<span class="eq_writer">작성자</span>
				</c:if>
				<span class="comment_writtendate"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd hh:mm" /></span>
				
				<c:if test="${i.dept eq 0 }"><a href="javascript:void(0)" class="recomment">댓글</a></c:if>			
			</div>
			
			<div class="comment-update">
				<c:if test="${nick eq i.writer }">
					<a href="javascript:void(0)" onclick="updateComment('${i.commentno}','${i.content }')" >수정</a>
					<a href="javascript:void(0)" onclick="deleteComment('${i.commentno}')" >삭제</a>
						<div id="commentre${i.commentno }" style="display:none;"></div>
				</c:if>
				
				<c:if test="${nick ne i.writer && nick ne 'admin'}">
					<a href="javascript:void(0)" onclick="declare('${i.boardno}','${i.commentno }')" id="cmtDeclare${i.commentno }">신고</a>
				</c:if>
			</div>
				
			
			<div class="comment-content">
				<span>${i.content }</span>
			</div>

			<hr class="comment_hr">
		</div>
	</c:forEach>
	
	
		<label style="vertical-align: -webkit-baseline-middle;"><textarea id="content" name="content" rows="1" cols="70" onkeypress="JavaScript:enter_check();"></textarea></label>
		<input type="hidden" name="writer" id="writer" value="${nick }" />
		
		<button id="cmtWrite" name="cmtWrite" class="btn">입력</button>
</div>


</div>
