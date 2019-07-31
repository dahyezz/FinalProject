<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function(){

	//게시글 수정 버튼
	$("#btnUpdate").click(function(){
		
		var tag=$("#tag").val();
		var boardno=$("#boardno").val();
		
		$(location).attr("href","/free/update?tag="+tag+"&boardno="+boardno);
	});
	
	//게시글 삭제 버튼
	$("#btnDelete").click(function(){
		
		var tag=$("#tag").val();
		var boardno=$("#boardno").val();
		
		var deleteConfirm=confirm("정말 삭제하시겠습니까?");
		
		if(deleteConfirm){
			$(location).attr("href","/free/delete?tag="+tag+"&boardno="+boardno);
		}
	});
	
	
	//페이지 로딩시 댓글 가져오기
 	$(function(){
	    commentList();
	});
		
	//댓글 목록
	function commentList(){
		
		var boardno=$("#boardno").val();
		var nick=$("#nick").val();
		
		//$.getJSON : 비동기식 JSON 데이터를 가져오는 메소드
		//첫 번째 매개변수 url : JSON 파일을 로드
		//두 번째 매개변수 callback 함수 : JSON 파일을 이용하여 로드된 데이터를 처리한다
		$.getJSON("/free/commentview?boardno="+boardno, function(data){
			
			var html='';
			
			//배열을 순회하면서 HTML을  생성
			$(data).each(function(){
				
				var writtendate=new Date(this.writtendate);
				writtendate=writtendate.toLocaleString("ko-US");
				
				html+= '<div class="commentList">';
    			html+= '<span style="font-weight:bold;">'+this.writer+'</span><br>';
	            html+= '<span>'+this.content+'</span><br>';
	            html+= '<span style="color:#ccc;">'+writtendate+'</span>&nbsp;&nbsp;';
	            if(nick != this.writer){
	            html+= '<span><a href="javascript:void(0)" onclick="declare('+boardno+','+this.commentno+')" id="cmtDeclare'+this.commentno+'">신고</a></span>';
	            }
	            if(nick == this.writer || nick == 'admin'){
	            	html+= '<button class="commentDelete" data-commentno="'+this.commentno+'" style="float:right;">삭제</button>';
	            }
	            html+= '<hr>';
	            html+= '</div>';
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
			},
			error:function(){
				console.log("댓글 작성 실패");
			}
		});
	});
	
	//댓글 삭제
	//댓글 목록은 스크립트로인해 생성된 동적인 HTML코드로, 일반적인 클릭 메소드 .click() 가 아니라 .on() 메소드를 사용
	$(document).on("click", ".commentDelete", function(){
		
		var deleteConfirm=confirm("댓글을 삭제하시겠습니까?");
		
		if(deleteConfirm){
			
			$.ajax({
				url: "/free/commentdelete",
				type: "post",
				data: {
					commentno: $(this).attr("data-commentno")
				},
				success:function(data){
					commentList();
				},
				error:function(){
					console.log("댓글 삭제 실패");
				}
			});
		}
	});
		
});

//신고
function declare(boardno, commentno){

	var myWindow = null;
	var check = true;
	var interval = null;
	
	myWindow = window.open("/free/declareReason","신고사유","width=550, height=650, left=100 top=20", "resizable=no");

	interval = window.setInterval(function() {
		try {
			if(myWindow == null || myWindow.closed){
				if(check){
					check = false;
					declareProc(boardno, commentno)
				}
					
				if(!check)
					return;
			}
		} catch (e) { }
	}, 100);

}

function declareProc(boardno, commentno){

	var boardname="tasty";
	
	// 신고자정보
	var nick=document.getElementById('writer').value;
	var reason = document.getElementById('reason').value;

	$.ajax({
		type: "post"	
		, url: "/free/declare"
		, dataType: "json"
		, data: {
			boardname: boardname,
			boardno: boardno,
			commentno: commentno,
			reason: reason,
			nickname: nick
		}
		, success: function(data){
// 			console.log(data.commentno)
			if(data.commentno==0){
				if(data.success){
					$('#btnDeclare').html('신고완료');
					$("#btnDeclare").css({ 'pointer-events': 'none' });
					alert("신고가 완료되었습니다.")
				} else {
					$('#btnDeclare').html('신고');
				}
			}
			else {
				if(data.success){
					$('#commentno'+data.commentno).html('관리자에 의해 규제된 댓글입니다.')
				} else {
					$('#cmtDeclare'+data.commentno).html('신고');
				}
				
			}
		}
		, error: function() {
			console.log("error")
		}
	});
}
</script>

<style type="text/css">
.freeView table {
	border:1px solid #ccc;
}

.freeView th{
	text-align: center;
	border:1px solid #ccc;
	background:#ff7473;
	width: 15%;
}

.freeView td{
	text-align: left;
}

.freeView {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

.commentList {
	text-align: left;
	width:98%;
	margin-left: 10px;
}
</style>

<div class="freeView">

<h1 >게시글 내용</h1>
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

<div class="text-center">	
	<input type="hidden" id="boardno" value="${board.boardno }">
	<input type="hidden" id="tag" value="${board.tag }">
	<button id="btnList" onclick="location.href='/free/list'" class="btn btn-info">목록</button>
	<c:if test="${nick eq board.writer || nick eq 'admin' }">
		<button id="btnUpdate" class="btn btn-info">수정</button>
		<button id="btnDelete" class="btn btn-info">삭제</button>
	</c:if>
	<c:if test="${nick ne board.writer }">
	<button id="btnReport" style="float:right;" onclick="declare('${board.boardno }')" id="btnDeclare" class="btn btn-info">신고</button>
	<input type="hidden" id="reason" />
	</c:if>
</div>

<!-- 댓글 작성 -->
<c:if test="${board.tag ne '공지'}">

<div class="freeCommentWrite">
	<h3 style="float:left;">Comments</h3><span id="commentCnt"></span>
	<hr>
	
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
</div>

<!-- 댓글 목록 -->
<div class="freeViewCommentList" ></div>

</c:if>

</div>