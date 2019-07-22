<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script type="text/javascript">
$(document).ready(function() {

	$("#btnContain").click(function(){
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
		//방법1
		// 체크된 대상들을 하나씩 꺼내서 문자열로 합치기
		var names = "";
		var len = $checkboxes.length;
		$checkboxes.each( function(idx) {
			names += $(this).val();
			
			if( len-1 != idx ) {
				names += ",";
			}
		});
		console.log(names);

		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/timetable/containmylist")
			.attr("method", "post")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "names")
					.attr("value", names)
			);
		$(document.body).append($form);
		$form.submit();
	});
	
	
	//선택 삭제
	$("#btnDelete").click(function(){
		var $checkboxes = $("input:checkbox[name='checkRow2']:checked");
		
		//방법1
		// 체크된 대상들을 하나씩 꺼내서 문자열로 합치기
		var names = "";
		var len = $checkboxes.length;
		$checkboxes.each( function(idx) {
			names += $(this).val();
			
			if( len-1 != idx ) {
				names += ",";
			}
		});
		console.log(names);

		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/timetable/deletemylist")
			.attr("method", "post")
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

//전체 체크/해제
function checkAll() {
	// checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");

	// checkAll 체크상태 (true:전체선택, false:전체해제)
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ) {
		// 전체 체크박스를 checked로 바꾸기
		$checkboxes.each(function() {
			this.checked = true;	
		});
	} else {
		// 전체 체크박스를 checked 해제하기
		$checkboxes.each(function() {
			this.checked = false;	
		});
	}
}

</script>


<style type="text/css">
#lectureList {
	text-align: center;
}

#btnBox {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	height: 40px;
	margin: auto;
}

</style>
    
<hr>
<h1>시간표 메인 페이지</h1>
<hr>

<form>
<div style="overflow:scroll;width:1000px;height:400px;">

<table id="lectureList">
<thead>
	<tr>
		<th>
			<input type="checkbox" id="checkAll" onclick="checkAll();" />
		</th>
		<th id="lectureList" style="width: 5%;">학년</th>
		<th id="lectureList" style="width: 10%;">강의구분</th>
		<th id="lectureList" style="width: 15%;">학과</th>
		<th id="lectureList" style="width: 25%;">강의명</th>
		<th id="lectureList" style="width: 10%;">교수명</th>
		<th id="lectureList" style="width: 10%;">강의요일</th>
		<th id="lectureList" style="width: 15%;">강의시간</th>
		<th id="lectureList" style="width: 10%;">강의실</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${lectureList }" var="i">
	<tr>
		<td><input type="checkbox" name="checkRow" value="${i.lecture_code }" /></td>
		<td>${i.grade }</td>
		<td>${i.lecture_section }</td>
		<td>${i.department_name }</td>
		<td>${i.lecture_name }</td>
		<td>${i.professor_name }</td>
		<td>${i.lecture_day }</td>
		<td>${i.start_time } - ${i.end_time }교시</td>
		<td>${i.lecture_room }</td>
	</tr>
</c:forEach>

</tbody>
</table>
</div>
<br>
<button id="btnContain">강의담기</button>
</form>
<br><br>
<h3>내 강의 목록</h3>
<hr>
<form>
<div style="overflow:scroll;width:1000px;height:200px;">
<table id="lectureList">
<thead>
	<tr>
		<th>
			<input type="checkbox" id="checkAll2" onclick="checkAll2();" />
		</th>
		<th id="lectureList" style="width: 5%;">학년</th>
		<th id="lectureList" style="width: 10%;">강의구분</th>
		<th id="lectureList" style="width: 15%;">학과</th>
		<th id="lectureList" style="width: 25%;">강의명</th>
		<th id="lectureList" style="width: 10%;">교수명</th>
		<th id="lectureList" style="width: 10%;">강의요일</th>
		<th id="lectureList" style="width: 15%;">강의시간</th>
		<th id="lectureList" style="width: 10%;">강의실</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${myList }" var="mi">
	<tr>
		<td><input type="checkbox" name="checkRow2" value="${mi.lecture_code }" /></td>
		<td>${mi.grade }</td>
		<td>${mi.lecture_section }</td>
		<td>${mi.department_name }</td>
		<td>${mi.lecture_name }</td>
		<td>${mi.professor_name }</td>
		<td>${mi.lecture_day }</td>
		<td>${mi.start_time } - ${mi.end_time }교시</td>
		<td>${mi.lecture_room }</td>
	</tr>
</c:forEach>

</tbody>
</table>
<br>
</div>
<button id="btnDelete">내 강의 삭제</button>
</form>
<br>
<button onclick="location.href='/timetable/recommend'">추천 시간표 생성</button>

<br><br><br><br>

