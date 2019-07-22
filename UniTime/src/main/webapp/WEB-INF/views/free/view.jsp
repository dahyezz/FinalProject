<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function(){
	
 	$(function(){	//페이지 로딩시 댓글 가져오기
	    commentList();
	});
	
/*	function commentDelete(commentno){
		
		$.ajax({
			url: "/free/commentdelete",
			type: "get",
			success:function(data){
				commentList();
			}
		});
	}
	
	$("#bntCommentDelete").click(function(){
		$(location).attr("href","/free/commentdelete?boardno="+${board.boardno }+"&commentno="+${i.commentno});
	}); */
	
	//댓글 목록
	function commentList(){
		
		var boardno=${board.boardno};
		
		//getJSON : 비동기식 JSON 데이터를 가져오는 메소드
		//첫 번째 매개변수 url : JSON 파일을 로드
		//두 번째 매개변수 callback 함수 : JSON 파일을 이용하여 로드된 데이터를 처리한다
		$.getJSON("/free/commentview?boardno="+boardno, function(data){
			
			var html='';
			
			//배열을 순회하면서 HTML을  생성
			$(data).each(function(){
				var writtendate=new Date(this.writtendate);
				writtendate=writtendate.toLocaleDateString("ko-US");
				
    			html+= '<span style="font-weight:bold;">'+this.writer+'</span><br>';
	            html+= '<span>'+this.content+'</span><br>';
	            html+= '<span style="color:#ccc;">'+writtendate+'</span>';
	            html+= '<c:if test="${nick eq '+this.writer+' || nick eq admin }">';
	            html+= '<button id="btnCommentDelete" style="float:right;" onclick="commentDelete('+this.commentno+')">삭제</button>';
	            html+= '</c:if>';
	            html+= '<hr>';
			});
			
			$(".freeViewCommentList").html(html);
		});
	}
	
	//댓글 작성
	$("#btnCommentWrite").click(function(){
		
		var formOjb=$("#commentWriteForm");
		var boardno=$("#boardno").val();
		var comment=$("#comment").val();
		
		$.ajax({
			url:"/free/commentwrite",
			type:"post",
			data:{
				boardno:boardno,
				content:comment
			},
			success:function(){
				commentList();	//댓글 리스트 함수 호출
				$("#comment").val("");	//댓글 작성칸 지우기
			}
		});
	});
	
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
<h3 style="float:left;">Comments</h3><span id="commentCnt"></span>
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
		<input type="hidden" id="boardno" value="${board.boardno }">
		<input type="hidden" id="nick" value="${nick }">
		<table class="table table-condensed">
		<tr>
			<th style="width:100px;">${nick }</th>
			<td>
			<textarea id="comment" name="content" rows="3" cols="130" placeholder="댓글을 입력해주세요."></textarea>
			<button type="button" id="btnCommentWrite" class="btn btn-info">댓글등록</button>
			</td>
		</tr>
		</table>
	</form>
	</c:if>
</div>

<!-- 댓글 목록 -->
<div class="freeViewCommentList" ></div>
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