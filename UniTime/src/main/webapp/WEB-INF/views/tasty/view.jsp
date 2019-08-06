<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
// var popupX = (window.screen.width / 2) - (350/2);
// var popupY = (window.screen.height / 2) - (30/2);

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
		var boardno = ${board.boardno };
		var content = $('#content').val();
		var writer = $('#writer').val();

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
	
	if(${isDeclare}){
		$('#btnDeclare').html('신고완료');
		$("#btnDeclare").css({ 'pointer-events': 'none' });

	} else {
		$('#btnDeclare').html('신고');
	}
	
	var commentno_re;
	$('#commentdiv').on('click', ".recomment", function() {

		$("#recommentdiv").remove();
// 		console.log($(this).parent().parent().attr("data-commentno"))
		if(commentno_re == $(this).parent().parent().attr("data-commentno")){commentno_re = 0; return false;}
		commentno_re = $(this).parent().parent().attr("data-commentno");
		$(this).parent().parent().append(
				"<div id='recommentdiv'><a href='javascript:void(0)' id='recommentBtn' >입력</a><textarea class='form-control' id='recommentcontent' rows='1' cols='40'></textarea></div>");
		
	});
	
	$("#commentdiv").on("click", "#recommentBtn", function() {
// 		console.log("reocomment btn clicked")

// 		var commentno;
		var dept
		var boardno = ${board.boardno};
		var writer = "${nick}";
		dept = $(this).parent().parent().attr("data-dept");
		var recommentcontent =  $("#recommentcontent").val();
		
// 		console.log(dept)
		$.ajax({
			url : "/tasty/writeComment",
			type : "POST",
			data : {"boardno":boardno,
					"content":recommentcontent,
					"writer":writer,
					"commentno":commentno_re,
					"dept":dept},
			dataType:"html",
	  		success: function(res){
// 	  			console.log(res);
	  			$("#commentdiv").html(res);
			} 
			, error: function(res){
			}
			
		});		
		
	})
	
});

var updateCount=0;

//댓글 수정
function updateComment(commentno, content){
	
	var htmls = document.getElementById("commentre"+commentno);
	
	if(updateCount==0){
		
		htmls.innerHTML += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">'
			+ '<span class="up" style="padding-left: 7px; font-size: 9pt">'
		 	+ '<a href="javascript:void(0)" onclick="updateProc('+ commentno+')" style="padding-right:5px">저장</a>'
	 		+ '<a href="javascript:void(0)" onclick="showList('+commentno+')">취소<a>'
		 	+ '</span>'
		 	+ '<textarea name="editContent" id="editContent" class="form-control" rows="1" cols="40">'+content+'</textarea>'
		 	+ '</p>';

		updateCount=1;
	}

	htmls.style.display="block";

}

function showList(commentno){
// 	console.log("commentno"+commentno);
	document.getElementById("commentre"+commentno).style.display="none";
}

function updateProc(commentno){
	
	var editContent = $('#editContent').val();
	
	$.ajax({
		type: "post"
		, url: "/tasty/updateComment"
		, dataType: "html"
		, data: {
			"commentno": commentno,
			"content": editContent
		}
		, success: function(data){
			$("#commentdiv").html(data);
			$("#content").val("");

		}
		, error: function() {
			console.log("error")
		}
	});

}



//댓글 삭제
function deleteComment(commentno, loginUser){
	
// 	console.log(commentno)
	console.log(loginUser);
	
	$.ajax({
		type: "post"
		, url: "/tasty/deleteComment"
		, dataType: "json"
		, data: {
			commentno: commentno,
			loginUser: loginUser
		}
		, success: function(data){
			console.log(data.status)
			if(data.success){
				if(data.status==1){
					$('#commentno'+data.commentno).children('.comment-writer-info').html('알수없음')
					$('#commentno'+data.commentno).children('.comment-content').html('삭제된 댓글입니다.')
					
				} else {
					$("[data-commentno='"+commentno+"']").remove();
				}
			} else {
// 				alert("댓글 삭제 실패");
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
		$('#cmtWrite').click();
	}
}


//신고
function declare(boardno, commentno){

	var myWindow = null;
	var check = true;
	var interval = null;
	
	myWindow = window.open("http://localhost:8088/tasty/declareReason","신고사유","width=550, height=630, left="+100+", top="+20+", resizable=no");
	
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
	console.log(reason)
	
	if(reason != null && reason != ""){
		$.ajax({
			type: "post"	
			, url: "/tasty/declare"
			, dataType: "json"
			, data: {
				boardname: boardname,
				boardno: boardno,
				commentno: commentno,
				reason: reason,
				nickname: nick
			}
			, success: function(data){
//	 			console.log(data.commentno)
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
						alert("신고가 완료되었습니다.")
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

}
</script>

<style type="text/css">
.article-head > h2 {
	font-size: 30px;
}
.writer_info {
	text-align: left;
	margin-bottom: 30px;
}
.writer_info>span {
	font-size: 15px;
	margin-right: 20px;
}
#writer_nick {
	font-weight: 800;
}
#hit_info {
	margin-right: 5px;
}
#hit_count {
	font-weight: 800;
}
.clearfix::after{display:block;content:"";clear:both}
.inbox {margin: 14px; border: 1px solid #ccc;}
.tit-box {
	margin: 10px;
	overflow: hidden;
	
}

.tit-box .storename {
/* 	display: inline-block; */
	float: left;
}
.tit-box .writtendate {
/* 	display: inline-block; */
	float: right;
}
.board-box-line-dashed {
	border-color: #666666;
	border-bottom-style: dashed;
	border-bottom-width: 1px;
	opacity: 0.3;
	height: 3px;
	font-size: 0;
	margin: 0;
	padding: 0;
}
.user-info {
	overflow: hidden;
	text-align: left;
	margin-top: 5px;
	margin-left: 5px;
}
.article-head a {
	text-decoration: none !important;
	color: black;
}
.commentdiv {
	overflow: hidden;
}
.tasty_tb {
	margin-top: 60px;
	font-size: 14px;
	line-height: 1.5;
	border: none;
	margin-bottom: 15px;
}
.tasty_tb tr th {
	min-width: 100px;
	font-weight: 700;
	white-space: nowrap;
}
.tasty_tb tr th, .tasty_tb tr td {
	color: #34314c;
	text-align: left;
	padding: 10px 10px 0 0;
	border: none;
}
#cmtWrite, #btnList {
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
#btnDelete, #btnUpdate {
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
#content{
	width: 100%;
	padding: 6px 12px;
	font-size: 14px;
/* 	line-height: 1.4px; */
	height: 30px; 
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
/* 	border-radius: 4px; */
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
}
#recommentBtn{
	text-decoration: none;
	float: right;
	color: black;
}
</style>


<div class="article-head margin-bottom-large" style="text-align: left;">
	<h2 class="margin-bottom-xsmall">
		<a class="link text-bold" href="/tasty/view?boardno=${board.boardno }">${board.storeName }</a></h2>
</div>

<div class="writer_info">
	<span id="writer_nick">${board.writer }</span>
	<span><fmt:formatDate value="${board.writtendate }" pattern="yyyy.MM.dd" /></span>
	<span id="hit_info">조회수</span><span id="hit_count">${board.hit }</span>
</div>

<table class="tasty_tb">
	<tr>
		<th>평점</th>
		<td id="recommend" style="color: gold;">
			<c:if test="${board.score eq 1 }">★</c:if>
			<c:if test="${board.score eq 2 }">★★</c:if>
			<c:if test="${board.score eq 3 }">★★★</c:if>
			<c:if test="${board.score eq 4 }">★★★★</c:if>
			<c:if test="${board.score eq 5 }">★★★★★</c:if>
		</td>
	</tr>
	<tr>
		<th>위치</th>
		<td>${board.loc }</td>
	</tr>
	<tr>
		<th>종류</th>
		<td>${board.tag }</td>
	</tr>
</table>


<div>
	${board.content }
</div>

<div class="clearfix"></div>

<c:if test="${nick ne board.writer && nick ne 'admin'}">
	<a href="javascript:void(0)" onclick="declare('${board.boardno }')" style="float: right;" id="btnDeclare">신고</a>
</c:if>
<input type="hidden" id="reason" />

<c:import url="/WEB-INF/views/tasty/comment.jsp" />

<div class="text-center">
	<button id="btnList">목록</button>
	
	<c:if test="${nick eq 'admin' }">
		<button id="btnDelete">삭제</button>
	</c:if>

	<c:if test="${nick eq board.writer }">
		<button id="btnUpdate">수정</button>
		<button id="btnDelete">삭제</button>
	</c:if>
</div>