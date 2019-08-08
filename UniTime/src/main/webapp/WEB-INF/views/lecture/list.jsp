<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- select태그 부트스트랩 적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/js/bootstrap-select.min.js"></script>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

//맨 위 체크박스 모두 체크/해제
function allChk(allobj){
	
	var chkObj = document.getElementsByName("boardCheck");
	var rowCnt = chkObj.length - 1;
	var allcheck = allobj.checked;
	
    if (allcheck) {﻿
		for (var i=0; i<=rowCnt; i++){
			if(chkObj[i].type == "checkbox"){
				chkObj[i].checked = true;
			}
		}
	} else {
		for (var i=0; i<=rowCnt; i++) {
			if(chkObj[i].type == "checkbox"){
				chkObj[i].checked = false; 
			}
		}
	}
} 

//﻿체크박스 선택된 게시물 삭제 처리
function checkBoardDelete(){

	var boardno = "";
	var boardChk = document.getElementsByName("boardCheck");
	var indexid = false;
	
	for(i=0; i < boardChk.length; i++){
		
		if(boardChk[i].checked){
			if(indexid){
				boardno = boardno + ', ';
			}
			
			boardno = boardno + boardChk[i].value;
			indexid = true;
		}
	}
	
	if(!indexid){
		alert("삭제할 사용자를 체크해 주세요");
		return;
	}
  
	var deleteConfirm=confirm("삭제 하시겠습니까?");
	
	if(deleteConfirm){
		//<form action="/free/checkdelete" method="get">
		//	<input name=checkdelete value=boardno>
		//</form>
		//body에 추가
		$f = ($("<form>")
				.attr("action", "/lecture/checkdelete")
				.attr("method", "get")
			).append(
			$("<input>")
				.attr("name", "checkDelete")
				.val(boardno)
		).appendTo( $(document.body) );
		
		//form submit
		$f.submit();
	}
}﻿

</script> 

<style type="text/css">
.ed>h3 {
	font-weight: bold;
	font-size: 30px;
}
.ed>span {
	font-size: 20px;
}

#btnWrite {
  background-color: #47b8e0;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff;
  font-size: 13	px;
  padding: 5px 10px;
  margin: 5px;
  float: right;
  border: none;
  text-decoration: none;
}


.lectureList input[type='checkbox'] {
	width:20px;
	height:20px;
}

.yellowStar{
	color:yellow;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}
.whiteStar{
	color:white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}

#btnSearch {
  background-color: #47b8e0;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff;
  font-size: 13	px;
  padding: 7px 10px;
/*   margin: 5px; */
  border: none;
  text-decoration: none;
}
.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn){
	width: 80px;
}
.bootstrap-select>.dropdown-toggle {
	width: 80px !important;
}
.bootstrap-select .dropdown-menu {
	min-width: 80px !important;
}
.form-control {
	display: inline;
	width: 200px;
}




.project {
    min-height:300px;
    height:auto;
    width:250px;
    background:#fff; border:1px solid #ddd; margin: 15px 0; overflow:hidden;
    border-radius:7px;
    border-color: #5bc0de;
    cursor:pointer;
}
.project-content {
    padding:20px 20px 20px;
}

</style>

<div class="lectureList">

<div class="ed board-header padding-horizontal-small@s margin-bottom-small" style="text-align: left;">
	<h3>강의평가 게시판</h3>
	<div><button style="float:right;" id="btnWrite" onclick="location.href='/lecture/write'">글쓰기</button></div>
</div>

<div class="lectureContainer" style="">

	<c:if test="${nick eq 'admin' }">
	<div class="allCheck">
		<input type="checkbox" id="allCheck" onclick="allChk(this)" />
		<label for="allCheck"><strong>전체 체크</strong></label>&emsp;&emsp;
		<button type="button" onclick="checkBoardDelete();">체크 삭제</button>
	</div>
	</c:if>
	
	<c:set var="five" value="5" />
	
	<div class="row" style="margin-top:40px; margin-left:180px;">
	<c:forEach items="${list}" var="i">
		<div class="col-xs-4" style="margin-right:-60px;">
		
		<c:if test="${nick eq 'admin' }">
			<span><input type="checkbox" name="boardCheck" value="${i.boardno }"/></span>
		</c:if>
		
			<div class="project" onclick="location.href='/lecture/view?boardno=${i.boardno }'">
				<div class="project-content">					
					<p>${i.boardno }</p>
					<p><h4><strong>[${i.lecture_section }] ${i.lecture_name }</strong></h4></p>
					<p>${i.professor_name }</p>
					<p style="padding-top:7px;">조별과제&nbsp;
					<span class="yellowStar"><c:forEach begin="1" end="${i.team_project }">★</c:forEach></span>
					<span class="whiteStar"><c:forEach begin="1" end="${five - i.team_project }">★</c:forEach></span></p>
					<p>과제량&nbsp;
					<span class="yellowStar"><c:forEach begin="1" end="${i.homework }">★</c:forEach></span>
					<span class="whiteStar"><c:forEach begin="1" end="${five - i.homework }">★</c:forEach></span>
					</p>
					<p>총점&nbsp;
					<span class="yellowStar"><c:forEach begin="1" end="${i.total_score }">★</c:forEach></span>
					<span class="whiteStar"><c:forEach begin="1" end="${five - i.total_score }">★</c:forEach></span></p>
					<p style="padding-top:7px;">조회수 ${i.hit }</p>
					<p><span class="glyphicon glyphicon-time"></span>&nbsp;<fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></p>
				</div>
			</div>
			
		</div>
	</c:forEach>
	</div>
</div>

</div>

<c:import url="/WEB-INF/views/lecture/paging.jsp" />

<div class="lectureSearch">
<form action="/lecture/list" method="get">
	<select name="searchType" class="selectpicker">
		<option value="lecture_name" selected>강의명</option>
		<option value="professor_name">강의 교수</option>
	</select>
	
	<input type="text" name="keyword"  class="form-control" placeholder="검색어를 입력해주세요."/>
	<button id="btnSearch">검색</button>
</form>
</div>
