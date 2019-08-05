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
$(document).ready(function() {

	$('#btnList').click(function() {
		$(location).attr("href", "/used/list");
	});

	$('#btnUpdate').click(function() {
		$(location).attr("href", "/used/update?boardno="+${usedboard.boardno });
	});

	$('#btnDelete').click(function() {
		var delete_confirm; // 삭제확인 메세지 : boolean
		
		if(confirm("정말 삭제하시겠습니까?")) {
			//delete_confirm = true;   확인 
			$(location).attr("href", "/used/delete?boardno="+${usedboard.boardno });
			alert("삭제되었습니다!");
		}
		
/* 		if(delete_confirm){
			$(location).attr("href", "/used/delete?boardno="+${usedboard.boardno });
			alert("삭제되었습니다!");
		} */
	});

	
	$('#cmtWrite').click(writeComment);
	
	function writeComment(){ 
		var boardno = ${usedboard.boardno };
		var writer = $('#content').val();
		var content = $('#writer').val();
		
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
				console.log(data);
				$("#commentdiv").html(data);
				$("#content").val("");
			},
			error : function() {
				console.log("댓글작성중 error 발생");
			}
		});
	}
	
});


function enterPressAlert(e, textarea) {
	var code = (e.KeyCode ? e.keyCode : e.which);
	if(code == 13) {
		alert('입력버튼을 클릭하여 댓글을 완성하세요.');
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
	<label>${nick }&nbsp;&nbsp;
		<textarea id="content" name="content" rows="1" cols="70" 
			onKeyPress="enterPressAlert(event, this)">
		</textarea>
	</label>
	
	
	<input type="hidden" name="writer" id="writer" value="${nick }" />
	
	<button id="cmtWrite" name="cmtWrite" class="btn">입력</button>
	

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
