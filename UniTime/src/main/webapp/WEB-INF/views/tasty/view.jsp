<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#btnList').click(function() {
		$(location).attr("href","/tasty/list");
	});
	
	$('#btnUpdate').click(function() {
		$(location).attr("href","/tasty/update?boardno="+${board.boardno });
	});
	
	$('#btnDelete').click(function() {
		$(location).attr("href","/tasty/delete?boardno="+${board.boardno });
	});
	
	$('#cmtWrite').click(function() {
// 		console.log(${board.boardno })
// 		console.log($('#content').val())
// 		console.log($('#writer').val())
		
		var boardno = ${board.boardno };
		var content = $('#content').val();
		var writer = $('#writer').val();
		
		console.log(boardno);
		console.log(content);
		console.log(writer);
		
		$.ajax({
			type: "post"
			, url: "/tasty/writeComment"
			, dataType: "html"
			, data: {
				"boardno": boardno,
				"content": content,
				"writer": writer
			}
			, success: function(data){
				$("#commentdiv").html(data);
				$("#content").val("");

			}
			, error: function() {
				console.log("error")
			}
		});

	});

	
});

//댓글 수정
function updateComment(data){
	console.log(data);
	
// 	console.log($(this));
// 	console.log($(this).parent())

	var reply = document.getElementById("update"+data);
	reply.style.display="";
// 	console.log(reply);


}


//댓글 삭제
function deleteComment(commentno){
	
// 	console.log(commentno)
	$.ajax({
		type: "post"
		, url: "/tasty/deleteComment"
		, dataType: "json"
		, data: {
			commentno: commentno
		}
		, success: function(data){
			if(data.success){
				$("[data-commentno='"+commentno+"']").remove();
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error")
		}
	});
	
}


//댓글창에 엔터키로 댓글 작성
function enter_check(){
	
	//엔터키의 코드가 13
	if(event.keyCode == 13){
		console.log("enter clicked");
		$('#cmtWrite').click();
	}
}
</script>

<div class="ed board-header padding-horizontal-small@s margin-bottom-small">
	<h3>테이스티로드</h3>
</div>

<table class="table table-bordered" style="text-align: center;">
	<tr>
		<td class="info">글번호</td><td colspan="3">${board.boardno }</td>
	</tr>
	
	<tr>
		<td class="info">음식점이름</td><td colspan="3">${board.storeName }</td>
	</tr>
	
	<tr>
		<td class="info">닉네임</td><td>${board.writer }</td>
	</tr>
	
	<tr>
		<td class="info">조회수</td><td>${board.hit }</td>
		<td class="info">별점</td>
		<td id="recommend" style="color: gold;">
			<c:if test="${board.score eq 1 }">★</c:if>
			<c:if test="${board.score eq 2 }">★★</c:if>
			<c:if test="${board.score eq 3 }">★★★</c:if>
			<c:if test="${board.score eq 4 }">★★★★</c:if>
			<c:if test="${board.score eq 5 }">★★★★★</c:if>
		</td>
	</tr>
	
	<tr>
		<td class="info">작성일</td><td colspan="3"><fmt:formatDate value="${board.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	
	
	<tr><td class="info" colspan="4">본문</td></tr>
	<tr><td colspan="4">${board.content }</td></tr>
</table>


<c:import url="/WEB-INF/views/tasty/comment.jsp" />


<label>${nick }<textarea id="content" name="content" rows="1" cols="70" onkeypress="JavaScript:enter_check();"></textarea></label>
<input type="hidden" name="writer" id="writer" value="${nick }" />

<button id="cmtWrite" name="cmtWrite" class="btn">입력</button>


<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	
	<c:if test="${nick eq 'admin' }">
		<button id="btnDelete" class="btn btn-warning">삭제</button>
	</c:if>

	<c:if test="${nick eq board.writer }">
		<button id="btnUpdate" class="btn btn-warning">수정</button>
		<button id="btnDelete" class="btn btn-warning">삭제</button>
	</c:if>
</div>