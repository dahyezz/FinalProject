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
			var commentCnt=0;
			
			//배열을 순회하면서 HTML을  생성
			$(data).each(function(){
				
				var writtendate=new Date(this.writtendate);
				writtendate=writtendate.toLocaleString("ko-US");
				
				html+= '<div class="commentList">';
    			html+= '<span style="font-weight:bold;">'+this.writer+'</span><br>';
	            html+= '<span>'+this.content+'</span><br>';
	            html+= '<span style="color:#ccc;">'+writtendate+'</span>&nbsp;&nbsp;';
	            if(nick != this.writer){
	            html+= '<span><a href="javascript:void(0)" id="commentReport" data-commentno="'+this.commentno+'">신고</a></span>';
	            }
	            if(nick == this.writer || nick == 'admin'){
	            	html+= '<button class="commentDelete" data-commentno="'+this.commentno+'" style="float:right;">삭제</button>';
	            }
	            html+= '<hr>';
	            html+= '</div>';
	            
	            commentCnt++;
			});
			
			$(".freeViewCommentList").html(html);
			$("#commentCnt").html(commentCnt);
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

	var boardno=$('#boardno').val();
	var nick=$('#nick').val();
	
	//게시글 신고
	$("#btnReport").click(function(){
		window.open("/free/report?boardno="+boardno+"&nickname="+nick,"신고사유","width=550, height=600, left=500 top=20");
	});
	
	//댓글 신고
	$(document).on("click", "#commentReport", function(){
				
		var commentno=$(this).attr("data-commentno");
		
		window.open("/free/report?boardno="+boardno+"&commentno="+commentno+"&nickname="+nick,"신고사유","width=550, height=600, left=500 top=20");
	});
});
</script>

<style type="text/css">
.article-head > h2 {
	font-size: 30px;
	margin-top:5px;
}

.writer_info {
	text-align: left;
	margin-bottom: 50px;
}
.writer_info>span {
	font-size: 15px;
	margin-right: 20px;
}
#writer_nick, #hit_count, #board_tag {
	font-weight: 800;
}
#hit_info {
	margin-right: 5px;
}

.btn-group a{
	color: black;
	text-decoration: none;
	font-weight: 800;
}
.btn-group a:hover{
	text-decoration: underline;
}

#btnCommentWrite, #btnList {
	background-color: #47b8e0;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff;
  font-size: 13	px;
  padding: 5px 10px;
  border: none;
  text-decoration: none;
  margin-left: 7px;
  margin-bottom: 2px;
}

#btnDelete, #btnUpdate, #btnReport, .commentDelete {
	background-color: #ff7473;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff ;
  font-size: 13	px;
  padding: 5px 10px;
  border: none;
  text-decoration: none;
}

.commentList {
	text-align: left;
	width:98%;
	margin-left: 10px;
}

.freeCommentWrite span{
	float: left;
	font-size:30px;
}
</style>

<div class="freeView">

<div class="article-head margin-bottom-large" style="text-align:left; margin-top:30px;">
	<span id="board_tag">[${board.tag }]</span>
	<h2 class="margin-bottom-xsmall">${board.title }</h2>
</div>

<div class="writer_info">
	<span class="glyphicon glyphicon-user" style="margin-right:3px;"></span>
	<span id="writer_nick">${board.writer }</span>
	
	<span><fmt:formatDate value="${board.writtendate }" pattern="yyyy.MM.dd HH:mm" /></span>
	<span id="hit_info">조회수</span><span id="hit_count">${board.hit }</span>
	
	<div class="btn-group">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
			<span class="glyphicon glyphicon-floppy-disk"></span>
			&nbsp;첨부파일&nbsp;<span class="caret"></span>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
			<c:if test="${empty viewFile.originname }"><li>&nbsp;첨부파일이 없습니다.</li></c:if>
			<li><a href="/free/download?fileno=${viewFile.fileno }">${viewFile.originname }</a></li>
		</ul>
	</div>
</div>

<div class="text-left">${board.content }</div>
<hr>

<div class="text-center">
	<input type="hidden" id="boardno" value="${board.boardno }">
	<input type="hidden" id="tag" value="${board.tag }">
	<button id="btnList" onclick="location.href='/free/list'">목록</button>
	<c:if test="${nick eq board.writer || nick eq 'admin' }">
		<button id="btnUpdate">수정</button>
		<button id="btnDelete">삭제</button>
	</c:if>

	<c:if test="${nick ne board.writer}">
	<button id="btnReport" style="float:right;">신고</button>
	</c:if>
</div>

<!-- 댓글 작성 -->
<c:if test="${board.tag ne '공지'}">

<div class="freeCommentWrite">
	<span>댓글&nbsp;</span>
	<span id="commentCnt"></span>
	<span>개</span>
	
	<form id="commentWriteForm" method="post">
		<input type="hidden" id="boardno" value="${board.boardno }">
		<input type="hidden" id="nick" value="${nick }">
		<table class="table table-condensed">
		<tr>
			<td>
			<textarea id="comment" name="content" rows="3" cols="150" 
			placeholder="댓글을 입력해주세요. 불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다."></textarea>
			<button type="button" id="btnCommentWrite">댓글등록</button>
			</td>
		</tr>
		</table>
	</form>
</div>

<!-- 댓글 목록 -->
<div class="freeViewCommentList" ></div>

</c:if>

</div>