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
				console.log(data);
				console.log(content);
				console.log(writer);
				console.log(data.writtendate)

				$("#commenttest").html(data);
// 				var div = $("<div>");
//                 div.attr("id", "replyItem" + data);
//                 div.appendTo($("#commentList"));
//                 div.css({border: "1px solid gray", width: "600px", "padding": "5px", "margin-top": "5px", "margin-left": "0px", display:"inline-block"});
// //                 div.text($("#rewriter1").val() + " 방금" );
                
//                 $("<a>",{
//                     text: "삭제",
//                     href: "#",
//                     click: function (){fn_replyDelete(result)}
//                 }).appendTo(div);

			}
			, error: function() {
				console.log("error")
			}
		});

		
// 		$form = $("<form>").attr({
// 			action: "/tasty/writeComment"
// 			, method: "post"
// 		}).append(
// 			$("<input>").attr({
// 				type: "hidden",
// 				name: "boardno",
// 				value: "${board.boardno }"
// 			})		
// 		).append(
// 			$("<input>").attr({
// 				type: "hidden",
// 				name: "writer",
// 				value: "${sessionScope.nick }"
// 			})	
// 		).append(
// 			$("<textarea>")
// 				.attr("name", "content")
// 				.css("display", "none")
// 				.text($("#content").val())
// 		);
// 		$(document.body).append($form);
// 		$form.submit();
	});
	
	
});

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
		<td class="info">추천수</td><td id="recommend">추가예정</td>
	</tr>
	
	<tr>
		<td class="info">작성일</td><td colspan="3"><fmt:formatDate value="${board.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	
	
	<tr><td class="info" colspan="4">본문</td></tr>
	<tr><td colspan="4">${board.content }</td></tr>
</table>


<div id="commentDiv">
<h5>댓글</h5>


<!-- <table class="table" id="commentTable"> -->
<%-- <c:forEach items="${commentList }" var="i"> --%>
<%-- 	<tr data-commentno="${i.commentno }"> --%>
<%-- 		<td>${i.writer }</td> --%>
<%-- 		<td>${i.content }</td> --%>
<%-- 		<td><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd hh:mm:ss" /></td>	 --%>
		
<%-- 		<td><c:if test="${nick eq i.writer }"> --%>
<%-- 			<button  onclick="deleteComment(${i.commentno });">삭제</button> --%>
<%-- 		</c:if></td> --%>
<!-- 	</tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->

<c:forEach items="${commentList }" var="i">
	<div id="commenttest">
		<span>${i.writer }</span>
		<span>${i.content }</span>
		<span><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd hh:mm:ss" /></span>
		
		<c:if test="${nick eq i.writer }">
			<button onclick="deleteComment(${i.commentno });">삭제</button>
		</c:if>
	</div>
</c:forEach>

</div>

<%-- <form action="/tasty/writeComment?boardno=${board.boardno }" method="post"> --%>
	<label>${nick }<textarea id="content" name="content" rows="1" cols="70"></textarea></label>
	<input type="hidden" name="writer" id="writer" value="${nick }" />
	
	<button id="cmtWrite" name="cmtWrite" class="btn">입력</button>
<!-- </form> -->

<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>

	<c:if test="${nick eq board.writer }">
		<button id="btnUpdate" class="btn btn-warning">수정</button>
		<button id="btnDelete" class="btn btn-warning">삭제</button>
	</c:if>
</div>