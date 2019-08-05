<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		
<style type="text/css">
.usedView table {
	align: center;
	border:1px solid #ccc;
}

.usedView th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
	width: 15%;
}

.usedView td{
	text-align: center;
}

.usedView button {
	background:#ccf;
}

.usedView {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

.commentList {
	text-align: left;
	width:98%;
	margin-left: 10px;
}

</style>	


<script type="text/javascript">
var boardno = ${usedboard.boardno };
$(document).ready(function() {

	$('#btnList').click(function() {
		$(location).attr("href", "/used/list");
	});

	$('#btnUpdate').click(function() {
		$(location).attr("href", "/used/update?boardno="+${usedboard.boardno });
	});

	$('#btnDelete').click(function() {
		
		if(confirm("정말 삭제하시겠습니까?")) {
			//delete_confirm = true;   확인 
			$(location).attr("href", "/used/delete?boardno="+${usedboard.boardno });
			alert("삭제되었습니다!");
		}
	
		
	});
	
});
	
	
	// 댓글 작성 함수
	function writeComment(){ 
		
		
		var writer = $('#writer').val();
		var content = $('#content').val();
		
		console.log(boardno);
		console.log(writer);
		console.log(content);
		
		$.ajax({
			type : "post" ,
			url : "/used/writecomment" ,
			dataType : "html" ,
			data : {
				"boardno" : boardno,
				"content" : content,
				"writer" : writer
			},
			success : function(data){
				$("#commentdiv").html(data);
				$("#content").val("");
				console.log("댓글작성!");
			},
			error : function() {
				console.log("error occured.");
			}
		});
	}

	// enter 키로 댓글 작성
	function enter_writeCmt() {
		var code = (e.KeyCode ? e.keyCode : e.which);
		if(code == 13) {
			$('cmtWrite').click();
		}
	}


	// 댓글 수정 함수 
	var updateCount = 0;
	function updateComment(commentno,content){
		var htmls = document.getElementById("commentre"+commentno);
		if(updateCount==0) {
			htmls.innerHTML += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">'
				+ '<span class="up" style="padding-left: 7px; font-size: 9pt">'
			 	+ '<a href="javascript:void(0)" onclick="updateCmtProc('+ commentno+')" style="padding-right:5px">저장</a>'
		 		+ '<a href="javascript:void(0)" onclick="showList('+commentno+')">취소<a>'
			 	+ '</span>'
			 	+ '<textarea name="editContent" id="editContent" class="form-control" rows="1" cols="40">'+content+'</textarea>'
			 	+ '</p>';

			updateCount=1;
		}
		
		htmls.style.display = "block";
	}

	function updateCmtProc(commentno) {
		var editContent = $('#editContent').val();
		
		$.ajax({
			type : "post",
			url : "/used/updateComment",
			dataType : "html",
			data : {
				"commentno" : commentno,
				"content" : editContent,
				"boardno" : boardno
			},
			success : function(data) {
				$("#commentdiv").html(data);
				$("#content").val("");
			},
			error : function() {
				console.log("error occured.");
			}
		});
	}

	// 댓글 삭제 함수 
	function deleteComment(commentno){
		
		if(confirm("정말 삭제하시겠습니까?")) {		
			$.ajax({
				type: "post"
				, url: "/used/deleteComment"
				, dataType: "html"
				, data: {
					"commentno": commentno,
					"boardno" : boardno
				}
				, success: function(data){
					$("#commentdiv").html(data);
					alert("댓글이 삭제되었습니다.");
				}
				, error: function() {
					console.log("error occured.")
				}
			});
		} 
	}

</script>
	
		
<div class="usedView">
<!-- Controller에서 model에 지정한 dto 이름. -->
<h2>게시글 조회</h2>
	<table class="table table-striped table-hover table-condensed" 
		style="width:100%">
		
		<tr>
			<th>글번호</th>
			<td>
				${usedboard.boardno }
			</td>
			<th>조회수</th>
			<td>
				${usedboard.hit }
			</td>
		</tr>
		<tr>
			<th>태그</th>
			<td>
				${usedboard.tag }
			</td>
			<th>제목</th>
			<td>
				${usedboard.title }
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				${usedboard.writer }
			</td>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${usedboard.writtendate }" 
				pattern="yyyy-MM-dd HH:mm"/>
			</td>
		</tr>
		<tr>
			<th>제품명</th>
			<td>
				${usedboard.product }
			</td>
			<th>가격</th>
			<td>
				<fmt:formatNumber value="${usedboard.price }"
				pattern="###,###.###"/>
			</td>
		</tr>
		<tr>
			<td id="usedView-content" colspan="4" style="height:300px;">
				${usedboard.content }
			</td>
		</tr>
	</table>
	
	
	<br>
	<!-- 댓글 -->
	<div id="commentdiv">
		<c:import url="/WEB-INF/views/used/commentList.jsp"/>
	</div>
	
	
	<!-- 댓글 작성창 -->
	<br>	
	<label>${nick }
		<textarea id="content" name="content" rows="1" cols="70" onKeyPress="JavaScript:enter_writeCmt();"></textarea>
	</label>
	
	
	<input type="hidden" name="writer" id="writer" value="${nick }" />
	
	<button id="cmtWrite" name="cmtWrite" class="btn" onclick="writeComment();">입력</button>
	

	<!-- 게시판 버튼 ( 목록/수정/삭제 ) -->
	<div id="view-buttons">
		<button id="btnList" class="btn btn-primary">목록</button>
		
		<!-- 접속한 회원의 nick이 해당 게시글의 작성자일 경우 -->
		<c:if test="${nick eq usedboard.writer }">
			<button id="btnUpdate" class="btn btn-primary">수정</button>
			<button id="btnDelete" class="btn btn-warning">삭제</button>
		</c:if>
		
		<!-- 접속한 회원의 nick이 admin일 경우 -->
		<c:if test="${nick eq 'admin' }">
			<button id="btnDelete" class="btn btn-warning">삭제</button>
		</c:if>
	</div>

</div>
<br>
