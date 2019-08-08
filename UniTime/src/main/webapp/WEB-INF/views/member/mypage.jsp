<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">

function delete_row() {
    var grades = document.getElementById('grades');
    if (grades.rows.length < 1) return;
    // grades.deleteRow(0); // 상단부터 삭제
    grades.deleteRow( grades.rows.length-1 ); // 하단부터 삭제
}

jQuery(function(){
    var counter = null;
    jQuery('a.add-author').click(function(event){
        event.preventDefault();

        var newRow = jQuery('<tr>' +
        		'<th style="width: 5%"><input type = "text"></th>' +
        		'<th style="width: 3%">' +
        		'<select name="grades">' +
        		'<option value="4.5">A+</option>' +
        		'<option value="4.0">A</option>' +
        		'<option value="3.5">B+</option>' +
        		'<option value="3.0">B</option>' +
        		'<option value="2.5">C+</option>' +
        		'<option value="2.0">C</option>' +
        		'<option value="1.5">D</option>' +
        		'<option value="0">F</option>' +
        		'</select></th>' +
        		'<th style="width: 1%">' +
        		'<input type="checkbox" name="checkRow"/></th>' +
        		'</tr>');
            counter++;
        jQuery('table.grades').append(newRow);

    });
});

$(document).ready(function() {
	
	//자유게시판 리스트 default
	getFreePage(1);
	
	// 선택체크 삭제
	$("#btnDelete1").click(function() {
		
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
	// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
	var map = $checkboxes.map(function() {
		return $(this).val();
	});
	var names = map.get().join(",");
	console.log(names);	
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "/member/mypage/delete1")
		.attr("method", "get")
		.append(
			$("<input>")
				.attr("type", "hidden")
				.attr("name", "names")
				.attr("value", names)
		);
	$(document.body).append($form);
	$form.submit();
	});
	
	// 선택체크 삭제
	$("#btnDelete2").click(function() {
		
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
	// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
	var map = $checkboxes.map(function() {
		return $(this).val();
	});
	var names = map.get().join(",");
	console.log(names);
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "/member/mypage/delete2")
		.attr("method", "get")
		.append(
			$("<input>")
				.attr("type", "hidden")
				.attr("name", "names")
				.attr("value", names)
		);
	$(document.body).append($form);
	$form.submit();
	});
	
	// 선택체크 삭제
	$("#btnDelete3").click(function() {
		
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
	// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
	var map = $checkboxes.map(function() {
		return $(this).val();
	});
	var names = map.get().join(",");
	console.log(names);
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "/member/mypage/delete3")
		.attr("method", "get")
		.append(
			$("<input>")
				.attr("type", "hidden")
				.attr("name", "names")
				.attr("value", names)
		);
	$(document.body).append($form);
	$form.submit();
	});
});

$(document).ready(function(){
	$("#btnGrades").click(function(){
		
		var temp    = [];
	    var obj     = $('select[name="grades"]');
	    var result  = false;
	    var sum		= 0.0;
		var tt		= "";
	    // 현재 값 임시 배열에 저장
	    $(obj)
	        .each(function(i) {
				temp[i] = $(this).val();
				
				tt = temp[i];
				tt = Number(tt);
				sum = sum + tt;
				avg = sum / temp.length;
				console.log(temp[i]);
	        });
	    	console.log(sum);
	    	console.log(avg);
/* 	    var sum	= 0;

	    for(var i=0; i<score.length; i++)
	    {
	    	score[i] = 
	    	sum = sum + score[i];
	    } */

		$("#result").text(" 모든 성적 : ( " + temp + " ) " + " 합산 성적 : " + sum + " 평균 성적 : " + avg );
		$("#result").attr("style", "color:#f00");
	});
});

//게시판 토글
function select(board) {
	
	$('.board_wrap').hide();
	document.getElementById(board).style.display = "block";

	if(board == 'tasty'){
		getTastyPage(1);
	}
	
	if(board == 'free'){
		getFreePage(1);
	}
	
	if(board == 'lecture'){
		getLecturePage(1);
	}
	
	if(board == 'used'){
		getUsedPage(1);
	}
	
}
</script>

<style type = "text/css">
.mypagelist th{
	text-align : center;
}
.menubar{
margin-left: 0px;
margin-bottom: 50px;
width: 100%;
height: 130px;
background: #47b8e017;
}
.user_info {
	position: relative;
	margin-left: 20px;
	margin-bottom: 10px;
	
}
.user_info>p {
	text-align: left;
	font-size: 15px;
	margin-bottom: 0px;
	
}
.user_modify {
	position: relative;
	float: right;
	margin-right: 20px;
	margin-top: 15px;
}
#modify, #logout, #modifyNick {
  background: #ffffff;
  background-image: -webkit-linear-gradient(top, #ffffff, #ffffff);
  background-image: -moz-linear-gradient(top, #ffffff, #ffffff);
  background-image: -ms-linear-gradient(top, #ffffff, #ffffff);
  background-image: -o-linear-gradient(top, #ffffff, #ffffff);
  background-image: linear-gradient(to bottom, #ffffff, #ffffff);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color:  #47b8e0;
  font-size: 12px;
  padding: 10px 20px 10px 20px;
  border: solid  #47b8e0 1px;
  text-decoration: none;
}
#btnDelete1, #btnDelete2, #btnDelete3, #btnDelete4, #btnGrades {
  background:  #47b8e0;
/*   background-image: -webkit-linear-gradient(top,  #47b8e0,  #47b8e0); */
/*   background-image: -moz-linear-gradient(top,  #47b8e0,  #47b8e0); */
/*   background-image: -ms-linear-gradient(top,  #47b8e0,  #47b8e0); */
/*   background-image: -o-linear-gradient(top,  #47b8e0,  #47b8e0); */
  background-image: linear-gradient(to bottom,  #47b8e0,  #47b8e0);
/*   -webkit-border-radius: 5; */
/*   -moz-border-radius: 5; */
  border-radius: 5px;
/*   font-family: Arial; */
  color: #ffffff;
  font-size: 12px;
  padding: 10px 20px 10px 20px;
  border: solid #ffffff 1px;
  text-decoration: none;
  float: right;
  margin: 20px 0;
}
.mylec_wrap {
	width: 100%;
	height: 550px;
/* 	position: relative; */
/* 	display: inline-block; */
}
.timetable_wrap {

	padding: 0 5%;
    display: inline-block;
    margin-bottom: 10px;
	float: left;
}
#mytable{
	width: 400px;
	border: 1px solid #ccc;
	
}
#mytable th{
	padding: 5px;
	border: 1px solid #ccc;
	text-align: center !important;
	
}
#mytable thead {
	background-color: #47b8e017;
}

#mytable th:first-child {
	background-color: #47b8e017;
}

.hakjum_wrap {

/*     width: 45%; */
    display: inline-block;
    margin-bottom: 10px;
	float: right;
	padding: 0 5%;
}
.board_wrap {
	display: none;
	width: 100%;
	height: 330px;
	position: relative;
}
#free {
	display: block;
}
.mylist {
	width: 100%;
	margin-bottom: 50px;
}
.board_select {
	width: 100%;
	text-align: left;
	margin-bottom: 20px;
}
.board_select>a {
	text-decoration: none;
	color: black;
	font-size: 14px;
	font-weight: bold;
	margin-right: 30px
}
.board_select>hr {
	border-top: 1.5px solid #000;
	width: 350px;
	margin: 5px 0 0 0;
}
.board_wrap>table {
	width: 100%;
	word-break: break-all;
}

.text-center {
	text-align: center;
 	bottom: 0; 
 	position: absolute; 
 	width: 100%; 
}
.pagination {
	padding-left: 40px;
}

.myh4 >h4 {
	font-weight: bold;
}

.mycalc {
	width: 300px;
}
.calc_add {
	text-align: right;
}
.calc_add>a {
	text-decoration: none;
	color: black;
}
</style>

<input type="hidden" name="nickname" id="nickname" value="${nick }" />
<input type="hidden" name="hakbun" id="hakbun" value="${hakbun }" />

<div class="menubar" >
	<form>
		<div class="user_info">
			<br>
			<p>${nick }님</p>
			<p>학번 : ${hakbun }</p>
			<div class="user_modify">
				<button type="button" id = "modifyNick" onclick="location.href='/member/modifyNick'">닉네임수정</button>
				<button type="button" id = "modify" onclick="location.href='/member/modify'">비밀번호수정</button>
				<button type="button" id = "logout" onclick="location.href='/member/logout'">로그아웃</button>
			</div>
		</div>
	</form>
</div>


<!-- 내가 작성한 게시물 div -->
<div class="mylist">

	<!-- 게시판 선택 -->
	<div class="board_select">
		<a href="javascript:void(0)" onclick="select('free')">자유게시판</a>
		<a href="javascript:void(0)" onclick="select('lecture')">강의평가</a>
		<a href="javascript:void(0)" onclick="select('used')">중고장터</a>
		<a href="javascript:void(0)" onclick="select('tasty')">테이스티로드</a>
		<hr>
	</div>

	
	<!-- 자유게시판 -->
	<div class="board_wrap" id="free">
		<table class = "mypagelist">
			<thead>
				<tr>
					<th style="width: 1%"></th>
					<th style="width: 10%">번호</th>
					<th style="width: 10%">태그</th>
					<th style="width: 55%">제목</th>
					<th style="width: 9%">조회수</th>
					<th style="width: 15%">작성일</th>
				</tr>
			</thead>
			
			<tbody id="freeResult"></tbody>
		</table>
		
		<div class="text-center">
			<c:import url="/WEB-INF/views/member/paging.jsp" />
			<button id="btnDelete2">삭제</button>
		</div>
	</div>
	
	<!-- 강의평가 -->	
	<div class="board_wrap" id="lecture">
		<table class = "mypagelist">
			<thead>
				<tr>
					<th style="width: 1%"></th>
					<th style="width: 10%">번호</th>
					<th style="width: 10%">구분</th>
					<th style="width: 55%">강의명</th>
					<th style="width: 9%">조회수</th>
					<th style="width: 15%">작성일</th>
				</tr>
			</thead>
			<tbody id="lectureResult"></tbody>
		</table>
		
		<div class="text-center">
			<c:import url="/WEB-INF/views/member/paging.jsp" />
			<button id="btnDelete4">삭제</button>
		</div>
	</div>
	
	<!-- 중고거래 -->
	<div class="board_wrap" id="used">
		<table class = "mypagelist">
			<thead>
				<tr>
					<th style="width: 1%"></th>
					<th style="width: 10%">번호</th>
					<th style="width: 10%">태그</th>
					<th style="width: 45%">제목</th>
					<th style="width: 10%">가격</th>
					<th style="width: 9%">조회수</th>
					<th style="width: 15%">작성일</th>
				</tr>
			</thead>
			<tbody id="usedResult"></tbody>
		</table>
		
		<div class="text-center">
			<c:import url="/WEB-INF/views/member/paging.jsp" />
			<button id="btnDelete3">삭제</button>
		</div>
	</div>

		
	<!-- 테이스티로드 -->
	<div class="board_wrap" id="tasty">
		<table class = "mypagelist">
			<thead>
				<tr>
					<th style="width: 1%"></th>
					<th style="width: 10%">번호</th>
					<th style="width: 10%">태그</th>
					<th style="width: 55%">음식점이름</th>
					<th style="width: 9%">조회수</th>
					<th style="width: 15%">작성일</th>
				</tr>
			</thead>
			<tbody id="tastyResult"></tbody>
		</table>
	
		<div class="text-center">
			<c:import url="/WEB-INF/views/member/paging.jsp" />
			<button id="btnDelete1">삭제</button>
		</div>
	</div>
	
</div>

<div class="mylec_wrap" >



	<!-- 시간표 -->
	<div class="timetable_wrap">
	
		<div style="text-align: center;" class="myh4">
			<h4>내 시간표</h4>
		</div>

		<div class="mytime">
			<table id="mytable">
			 <thead>
			    <tr>
			     <th style="width:16%">시간</th>
			     <th style="width:16.8%">월</th>
			     <th style="width:16.8%">화</th>
			     <th style="width:16.8%">수</th>
			     <th style="width:16.8%">목</th>
			     <th style="width:16.8%">금</th>
			   </tr>
			 </thead>
			 <tbody>
			<%--  <c:forEach items="${recommendList }" var="ri"> --%>
			 <tr><th>09:00-10:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 1}">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 </tr>
			 <tr><th>10:00-11:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 </tr>
			 <tr><th>11:00-12:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 </tr>
			 <tr><th>12:00-13:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 </tr>
			 <tr><th>13:00-14:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th> </tr>
			 <tr><th>14:00-15:00</th>
			  <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 </tr>
			 <tr><th>15:00-16:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th> 
			 </tr>
			 <tr><th>16:00-17:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 </tr>
			 <tr><th>17:00-18:00</th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
			 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
			 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach></th>
			 <th><c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
			 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
			 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 <th>
			 <c:forEach items="${myList }" var="mi">
			 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
			 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
			 </c:if>
			 </c:forEach>
			 </th>
			 </tr>
			 </tbody>
			</table>
		</div>
	</div>

	<!-- 학점계산기 -->
	<div class="hakjum_wrap">

		<div style="text-align: center;" class="myh4">
			<h4>학점계산기</h4>
		</div>
		
		<div>
		<table class="grades mycalc">
		<thead>
			<tr>
				<th style="width: 5%">과목명</th>
				<th style="width: 3%">점수</th>
				<th style="width: 1%">전공</th>
			</tr>
		</thead>
		<tbody id = "grades">
			<tr>
				<th style="width: 5%"><input type = "text"></th>
				<th style="width: 3%">
		          <select name="grades">
		                 <option value="4.5">A+</option>
		                 <option value="4.0">A</option>
		                 <option value="3.5">B+</option>
		                 <option value="3.0">B</option>
		                 <option value="2.5">C+</option>
		                 <option value="2.0">C</option>
		                 <option value="1.5">D</option>
		                 <option value="0">F</option>
		             </select></th>
				<th style="width: 1%">
				<input type="checkbox" name="checkRow"/></th>
			</tr>
			<tr>
				<th style="width: 10%"><input type = "text"></th>
				<th style="width: 3%">
		          <select name="grades">
		                 <option value="4.5">A+</option>
		                 <option value="4.0">A</option>
		                 <option value="3.5">B+</option>
		                 <option value="3.0">B</option>
		                 <option value="2.5">C+</option>
		                 <option value="2.0">C</option>
		                 <option value="1.5">D</option>
		                 <option value="0">F</option>
		             </select></th>
				<th style="width: 1%">
				<input type="checkbox" name="checkRow"/></th>
			</tr>
		</tbody>
		</table>
		</div>
		
		<div class="calc_add">
			<a href="javascript:void(0)" title="" class="add-author">추가</a>
			<a onclick="delete_row()">삭제</a><br><br>
		</div>
				<p class="result" id = "result">
				<span class="msg">성적을 입력해 주세요</span>
		
		<div id="btnBox" class="float-right" style="text-align: right">
			<button class="grades" id = "btnGrades">계산</button>
		</div>
	</div>
</div>

