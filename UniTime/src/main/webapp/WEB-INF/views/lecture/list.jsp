<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
.lectureList table, th {
	text-align: center;
}

.lectureList {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}

</style>

<div class="lectureList">

<h1>게시판 리스트</h1>
<hr>

<div>
<button style="float:right;" class="btn btn-info" onclick="location.href='/lecture/write'">글쓰기</button>
</div>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<c:if test="${nick eq 'admin' }">
			<th style="width:5%;"><input type="checkbox" id="allCheck" onclick="allChk(this)" /></th>
		</c:if>
		<th style="width:5%;">번호</th>
		<th style="width:10%;">전공/교양</th>
		<th style="width:30%;">강의명</th>
		<th style="width:10%;">강의 교수</th>
		<th style="width:10%;">조별과제</th>
		<th style="width:10%;">과제</th>
		<th style="width:10%;">총점</th>
		<th style="width:5%;">조회수</th>
		<th style="width:20%;">작성일</th>
	</tr>
</thead>

<c:forEach items="${list}" var="i">
	<tr>
		<c:if test="${nick eq 'admin' }">
			<td><input type="checkbox" name="boardCheck" value="${i.boardno }"/></td>
		</c:if>
		<td>${i.boardno }</td>
		<td>${i.lecture_section }</td>
		<td><a href="/lecture/view?boardno=${i.boardno }">${i.lecture_name }</a></td>
		<td>${i.professor_name }</td>
		<td>${i.team_project }</td>
		<td>${i.homework }</td>
		<td>${i.total_score }</td>
		<td>${i.hit }</td>
		<td><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
</c:forEach>

</table>

<c:if test="${nick eq 'admin'}">
<button type="button" style="float:left;" onclick="checkBoardDelete();">체크 삭제</button>
</c:if>

</div>

<c:import url="/WEB-INF/views/lecture/paging.jsp" />

<div class="lectureSearch">
<form action="/lecture/list" method="get">
	<select name="searchType">
		<option value="total" selected>전체</option>
		<option value="lecture_name">강의명</option>
		<option value="professor_name">강의 교수</option>
	</select>
	
	<input type="text" name="keyword" placeholder="검색어를 입력해주세요."/>
	<button>검색</button>
</form>
</div>
