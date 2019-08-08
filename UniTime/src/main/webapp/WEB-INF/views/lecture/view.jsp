<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function(){

	//게시글 수정 버튼
	$("#btnUpdate").click(function(){
		
		var boardno=$("#boardno").val();
		
		$(location).attr("href","/lecture/update?boardno="+boardno);
	});
	
	//게시글 삭제 버튼
	$("#btnDelete").click(function(){
		
		var boardno=$("#boardno").val();
		
		var deleteConfirm=confirm("정말 삭제하시겠습니까?");
		
		if(deleteConfirm){
			$(location).attr("href","/lecture/delete?boardno="+boardno);
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
		$.getJSON("/lecture/commentview?boardno="+boardno, function(data){
			
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
			
			$(".lectureViewCommentList").html(html);
			$("#commentCnt").html(commentCnt);
		});
	}
	
	//댓글 작성
	$("#btnCommentWrite").click(function(){
		
		var formOjb=$("#commentWriteForm");
		var boardno=$("#boardno").val();
		var comment=$("#comment").val();
		
		$.ajax({
			url:"/lecture/commentwrite",
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
				url: "/lecture/commentdelete",
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
		window.open("/lecture/report?boardno="+boardno+"&nickname="+nick,"신고사유","width=550, height=670, left=500 top=20");
	});
	
	//댓글 신고
	$(document).on("click", "#commentReport", function(){
				
		var commentno=$(this).attr("data-commentno");
		
		window.open("/lecture/report?boardno="+boardno+"&commentno="+commentno+"&nickname="+nick,"신고사유","width=550, height=670, left=500 top=20");
	});
});
</script>

<style type="text/css">
.lectureView table {
	border:1px solid #ccc;
}

.lectureView th{
	text-align: center;
	border:1px solid #ccc;
	background:#ff7473;
	width: 15%;
}

.lectureView td{
	text-align: left;
}

.lectureView {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

.commentList {
	text-align: left;
	width:98%;
	margin-left: 10px;
}

.yellowStar{
	color:yellow;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}
.whiteStar{
	color:white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}

.lectureCommentWrite span{
	float: left;
	font-size:30px;
}
</style>

<div class="lectureView">

<h1>게시글 내용</h1>
<hr>

<table class="table table-condensed">
	<tr>
		<th>글번호</th>
		<td colspan="3">${board.boardno }</td>
	</tr>
	<tr>
		<th>전공/교양</th>
		<td colspan="3">${timetable.lecture_section }</td>
	</tr>
	<tr>
		<th>강의명</th>
		<td colspan="3">${timetable.lecture_name }</td>
	</tr>
	<tr>
		<th>강의교수</th>
		<td colspan="3">${timetable.professor_name }</td>
	</tr>
	<tr>
		<th>조별과제</th>
		<td colspan="3">
		<c:set var="five" value="5" />
		<span class="yellowStar"><c:forEach begin="1" end="${board.team_project }">★&nbsp;</c:forEach></span>
		<span class="whiteStar"><c:forEach begin="1" end="${five - board.team_project }">★&nbsp;</c:forEach></span></td>
	</tr>
	<tr>
		<th>과제량</th>
		<td colspan="3">
		<span class="yellowStar"><c:forEach begin="1" end="${board.homework }">★&nbsp;</c:forEach></span>
		<span class="whiteStar"><c:forEach begin="1" end="${five - board.homework }">★&nbsp;</c:forEach></span></td>
	</tr>
	<tr>
		<th>총점</th>
		<td colspan="3">
		<span class="yellowStar"><c:forEach begin="1" end="${board.total_score }">★&nbsp;</c:forEach></span>
		<span class="whiteStar"><c:forEach begin="1" end="${five - board.total_score }">★&nbsp;</c:forEach></span></td>
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
</table>

<div class="text-center">
	<input type="hidden" id="boardno" value="${board.boardno }">
	<button id="btnList" onclick="location.href='/lecture/list'" class="btn btn-info">목록</button>
	<c:if test="${nick eq board.writer || nick eq 'admin' }">
		<button id="btnUpdate" class="btn btn-info">수정</button>
		<button id="btnDelete" class="btn btn-info">삭제</button>
	</c:if>

	<c:if test="${nick ne board.writer}">
	<button id="btnReport" style="float:right;"class="btn btn-info">신고</button>

	</c:if>
</div>

<!-- 댓글 작성 -->
<div class="lectureCommentWrite">
	<span>댓글&nbsp;</span>
	<span id="commentCnt"></span>
	<span>개</span>
	
	<form id="commentWriteForm" method="post">
		<input type="hidden" id="boardno" value="${board.boardno }">
		<input type="hidden" id="nick" value="${nick }">
		<table class="table table-condensed">
		<tr>
			<th style="width:100px;">${nick }</th>
			<td>
			<textarea id="comment" name="content" rows="3" cols="130" 
			placeholder="댓글을 입력해주세요. 불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다."></textarea>
			<button type="button" id="btnCommentWrite" class="btn btn-info">댓글등록</button>
			</td>
		</tr>
		</table>
	</form>
</div>

<!-- 댓글 목록 -->
<div class="lectureViewCommentList" ></div>

</div>