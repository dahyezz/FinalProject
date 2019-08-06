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
</script>

<style type = "text/css">
.mypagelist th{
	text-align : center;
}
.menubar{
margin-left: 0px;
margin-bottom: 30px;
width: 1100px;
height: 130px;
background: #47b8e017;
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
#btnDelete1, #btnDelete2, #btnDelete3, #btnGrades {
  background:  #47b8e0;
  background-image: -webkit-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: -moz-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: -ms-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: -o-linear-gradient(top,  #47b8e0,  #47b8e0);
  background-image: linear-gradient(to bottom,  #47b8e0,  #47b8e0);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #ffffff;
  font-size: 12px;
  padding: 10px 20px 10px 20px;
  border: solid #ffffff 1px;
  text-decoration: none;
}

.row2 {

    width: 45%;
    display: inline-block;
    float: left;
}
.row1 {

    width: 45%;
    display: inline-block;
    float: right;
}
.rowAll {
	margin-left: 15px;
	margin-right: 15px;
}
</style>

<br>
<br>
<br>

<div class="col-4">
<div class="menubar" >
<form>

<div class="left">
<br>
<%-- 비로그인 상태 --%>
<c:if test="${empty login }">
<div align="left">
	<strong>로그인이 필요합니다</strong><br>
</div>
</c:if>

<%-- 로그인 상태 --%>
<c:if test="${login }">
<div align="left" style="position: relative; left: 20px; ">
	${nick }님<br><br>
	학번 : ${hakbun }
<div style="position: relative; left: 750px; ">
<button type="button" id = "modifyNick" onclick="location.href='/member/modifyNick'">닉네임수정</button>
<button type="button" id = "modify" onclick="location.href='/member/modify'">비밀번호수정</button>
<button type="button" id = "logout" onclick="location.href='/member/logout'">로그아웃</button>
</div>
</div>
</c:if>
</div>
</form>
</div>
</div>

<div class="container">

<div class="row">


<div class="col order-1">
<br>

<hr>
내가 쓴 테이스티 로드 게시글<br><br>

<table style = "text-align : center; margin : auto;" class = "mypagelist">
<thead>
	<tr>
		<th style="width: 3%">글번호</th>
		<th style="width: 3%">태그</th>
		<th style="width: 3%">음식점이름</th>
		<th style="width: 3%">작성자</th>
		<th style="width: 3%">조회수</th>
		<th style="width: 3%">작성일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${tastyList }" var="i">
	<tr>
		<td style="width: 3%">
		<input type="checkbox" name="checkRow" value = "${i.boardno }"/>${i.boardno }</td>
		<td style="width: 3%">${i.tag }</td>
		<td style="width: 3%"><a href="/tasty/view?boardno=${i.boardno }">${i.storeName }</a></td>
		<td style="width: 3%">${i.writer }</td>
		<td style="width: 3%">${i.hit }</td>
		<td style="width: 3%"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</tbody>

</table>
</div>

</div>
<div id="btnBox" class="float-right" style="text-align: right">
	<button id="btnDelete1">삭제</button>
</div>
</div>

<div class="container">

<div class="row">


<div class="col order-1">
<br>

<hr>
내가 쓴 자유게시판 게시글<br><br>

<table style = "text-align : center; margin : auto;" class = "mypagelist">
<thead>
	<tr>
		<th style="width: 3%">번호</th>
		<th style="width: 3%">태그</th>
		<th style="width: 3%">제목</th>
		<th style="width: 3%">작성자</th>
		<th style="width: 3%">조회수</th>
		<th style="width: 3%">작성일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${freeList }" var="i">
	<tr>
		<td style="width: 3%"><input type="checkbox" name="checkRow" value = "${i.boardno }"/>${i.boardno }</td>
		<td style="width: 3%">${i.tag }</td>
		<td style="width: 3%"><a href="/free/view?tag=${i.tag }&boardno=${i.boardno }">${i.title }</a></td>
		<td style="width: 3%">${i.writer }</td>
		<td style="width: 3%">${i.hit }</td>
		<td style="width: 3%"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</tbody>

</table>
</div>

</div>
<div id="btnBox" class="float-right" style="text-align: right">
	<button id="btnDelete2">삭제</button>
</div>
</div>

<div class="container">

<div class="row">


<div class="col order-1">
<br>

<hr>
내가 쓴 중고장터 게시글<br><br>

<table style = "text-align : center; margin : auto;" class = "mypagelist">
<thead>
	<tr>
		<th style="width: 3%">글번호</th>
		<th style="width: 3%">태그</th>
		<th style="width: 3%">제목</th>
		<th style="width: 3%">작성자</th>
		<th style="width: 3%">가격</th>
		<th style="width: 3%">작성일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${usedList }" var="i">
	<tr>
		<td style="width: 3%">
		<input type="checkbox" name="checkRow" value = "${i.boardno }"/>${i.boardno }</td>
		<td style="width: 3%">${i.tag }</td>
			<td style="width: 3%"><a href="/used/view?boardno=${i.boardno }">${i.product }</a></td>
		<td style="width: 3%">${i.writer }</td>
		<td style="width: 3%">${i.hit }</td>
		<td style="width: 3%"><fmt:formatDate value="${i.writtendate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</tbody>

</table>
</div>

</div>
<div id="btnBox" class="float-right" style="text-align: right">
	<button id="btnDelete3">삭제</button>
</div>
</div>


<br>
<br>
<br>

<div class="container">
<div class = "rowAll" style="position: relative">
<div class="row1">

<div style="text-align: center;">
<hr>
학점 계산기<br><br>
</div>
<div>
<table style = "text-align : center; margin : auto;" class = "grades">
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
<a href="#" title="" class="add-author">과목 추가</a>
<a onclick="delete_row()">과목 삭제</a><br><br>

		<p class="result" id = "result">
		<span class="msg">성적을 입력해 주세요</span>

<div id="btnBox" class="float-right" style="text-align: right">
	<button class="grades" id = "btnGrades">계산</button>
</div>
</div></div>

<div class="container">

<div class="row2">

<hr>
내 시간표<br><br>

<table class="table table-bordered" style="width:500px;height:350px;">
 <thead>
    <tr class="text-center">
     <th scope="col" style="width:100px">시간</th>
     <th scope="col" style="width:300px">월</th>
     <th scope="col" style="width:300px">화</th>
     <th scope="col" style="width:300px">수</th>
     <th scope="col" style="width:300px">목</th>
     <th scope="col" style="width:300px">금</th>
   </tr>
 </thead>
 <tbody class="text-center">
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
</div>

