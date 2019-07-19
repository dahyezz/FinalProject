<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function(){
	
	$(function(){	//페이지 로딩시 댓글 가져오기
	    commentList();
	});
	
	//댓글 작성
	$("#btnCommentWrite").click(function(){
		
		$.ajax({
			type: "post",
			url: "/free/commentwrtie",
			data: $(commentWriteForm).serialize(),	// serialize(): 입력된 모든Element를 문자열의 데이터에 serialize 한다
			success:function(data){
				commentList();	//댓글 리스트 함수 호출
				$("#comment").val("");	//댓글 작성칸 지우기
			},
			error:function(){
				console.log("실패");
			}
		});
		
	});
	
	//댓글 리스트
	function commentList(){
		$.ajax({
	        url: "/free/view",
	        type: "get",
	        dataType: "json",
	        data : $(commentWriteForm).serialize(),
	        success : function(data){
	            var html =''; 
				
	            html+= '<c:forEach items="${commentList}" var="i">';
	            html+= '<span style="font-weight:bold;">${i.writer }</span><br>';
	            html+= '{i.content }<br>';
	            html+= '<span style="color:#ccc;"><fmt:formatDate value="${i.writtendate }" pattern="yyyy/MM/dd HH:mm" /></span>';
	            html+= '<c:if test="${nick eq i.writer || nick eq admin }">"';
	            html+= '	<button id="btnCommentDelete" style="float:right;"';
	            html+= 'onclick="location.href='/free/commentdelete?boardno=${board.boardno }&commentno=${i.commentno}'">삭제</button>';
	            html+= '</c:if>';
	            html+= '<hr>';
	            html+= '</c:forEach>';
	            
	            $(".freeViewComment").html(html);
	        }
	    });	
	}
});
</script>

<style type="text/css">
.freeView table {
	border:1px solid #ccc;
}

.freeView th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
	width: 15%;
}

.freeView td{
	text-align: left;
}

.freeView button {
	background:#ccf;
}

.freeView {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

.freeViewComment {
	text-align: left;
	width:98%;
	margin-left: 10px;
}
</style>

<div class="freeView">

<h1>게시글 내용</h1>
<hr>

<table class="table table-condensed">
	<tr>
		<th>글번호</th>
		<td colspan="3">${board.boardno }</td>
	</tr>
	<tr>
		<th>태그</th>
		<td colspan="3">${board.tag }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">${board.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.writer }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${board.hit }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td colspan="3"><fmt:formatDate value="${board.writtendate }" pattern="yyyy-MM-dd HH:mm" /></td>
	</tr>
	<tr>
		<td colspan="4" style="height:300px;">${board.content }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3"><a href="/free/download?fileno=${viewFile.fileno }">${viewFile.originname }</a></td>
	</tr>
</table>

<!----------- 댓글 ---------------->
<!-- 댓글 작성 -->
<c:if test="${board.tag ne '공지'}">
<div class="freeCommentWrite">
<h3 style="float:left;">Comments</h3>
<hr>
	<%-- 로그인 안한 상태 --%>
	<c:if test="${empty login }">
		<table class="table table-condensed">
		<tr>
			<th style="width:100px;"><a href="/member/login">로그인</a></th>
			<td>
			<textarea rows="3" cols="130">로그인 후에 이용 가능합니다.</textarea>
			<button type="button" class="btn btn-info">댓글등록</button>
			</td>
		</tr>
		</table>
	</c:if>

	<%-- 로그인 하고있는 상태 --%>
	<c:if test="${login }">
	<form id="commentWriteForm" method="post">
		<input type="hidden" id="boardno" value="${board.boardno }"/>
		<table class="table table-condensed">
		<tr>
			<th style="width:100px;">${nick }</th>
			<td>
			<textarea id="comment" name="content" rows="3" cols="130" placeholder="댓글을 입력해주세요."></textarea>
			<button id="btnCommentWrite" class="btn btn-info">댓글등록</button>
			</td>
		</tr>
		</table>
	</form>
	</c:if>
</div>

<!-- 댓글 목록 -->
<div class="freeViewComment" >
<c:forEach items="${commentList}" var="i">
	<span style="font-weight:bold;">${i.writer }</span><br>
	${i.content }<br>
	<span style="color:#ccc;"><fmt:formatDate value="${i.writtendate }" pattern="yyyy/MM/dd HH:mm" /></span>
	<c:if test="${nick eq i.writer || nick eq 'admin' }">
		<button id="btnCommentDelete" style="float:right;"
		onclick="location.href='/free/commentdelete?boardno=${board.boardno }&commentno=${i.commentno}'">삭제</button>
	</c:if>
	<hr>
</c:forEach>
</div>
</c:if>

<!--------------------------------------->

<div class="text-center">	
	<button id="btnList" onclick="location.href='/free/list'">목록</button>
	<c:if test="${nick eq board.writer || nick eq 'admin' }">
		<button id="btnUpdate" onclick="location.href='/free/update?tag=${board.tag }&boardno=${board.boardno}'">수정</button>
		<button id="btnDelete" onclick="location.href='/free/delete?tag=${board.tag }&boardno=${board.boardno}'">삭제</button>
	</c:if>
</div>

</div>