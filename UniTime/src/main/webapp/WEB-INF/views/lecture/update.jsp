<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

$(document).ready(function() {
	
	//별점
	$('.starRev_team input').click(function(){
		
		//해당 <input>태그를 클릭 시, 부모를 한번 타고 올라가서 다른 <input>에 class="on"을 add/remove 하면서 변화를 준다.
		$(this).parent().children('input').removeClass('on');
		$(this).addClass('on').prevAll('input').addClass('on');
		  
		//선택한 값 넣어주기	
		$("#team_project").val($(this).val());
		return false;
	});
	
	$('.starRev_home input').click(function(){
		$(this).parent().children('input').removeClass('on');
		$(this).addClass('on').prevAll('input').addClass('on');

		$("#homework").val($(this).val());
		return false;
	});
	
	$('.starRev_total input').click(function(){
		$(this).parent().children('input').removeClass('on');
		$(this).addClass('on').prevAll('input').addClass('on');
		  
		$("#total_score").val($(this).val());
		return false;
	});

});
</script>

<style type="text/css">
.lectureUpdate table {
	border:1px solid #ccc;
}

.lectureUpdate th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
}

.lectureUpdate {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
.lectureUpdate #content{
	width:98%;
}

.star{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
  border:none;
}
.star.on{
	background-position:0 0;
	border:none;
}
</style>

<div class="lectureUpdate">

<h1>글쓰기</h1>

<form action="/lecture/update?boardno=${board.boardno }" method="post">

	<table class="table table-condensed">
	<tr>
		<th>글번호</th>
		<td colspan="3">${board.boardno }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>※ 강의평가 게시판은 익명으로 작성됩니다.</td>
	</tr>
	<tr>
		<th>강의명</th>
		<td colspan="3">${timetable.lecture_name } - ${timetable.professor_name }</td>
	</tr>
	<tr>
		<th>조별과제</th>
		<td colspan="3">
		<div class="starRev_team">
			<input type="text" class="star on" value="1">
			<input type="text" class="star" value="2">
			<input type="text" class="star" value="3">
			<input type="text" class="star" value="4">
			<input type="text" class="star" value="5">
			<input type="hidden" name="team_project" id="team_project">
		</div></td>
	</tr>
	<tr>
		<th>과제량</th>
		<td colspan="3">
		<div class="starRev_home">
			<input type="text" class="star on" value="1">
			<input type="text" class="star" value="2">
			<input type="text" class="star" value="3">
			<input type="text" class="star" value="4">
			<input type="text" class="star" value="5">
			<input type="hidden" name="homework" id="homework">
		</div></td>
	</tr>
	<tr>
		<th>총점</th>
		<td colspan="3">
		<div class="starRev_total">
			<input type="text" class="star on" value="1">
			<input type="text" class="star" value="2">
			<input type="text" class="star" value="3">
			<input type="text" class="star" value="4">
			<input type="text" class="star" value="5">
			<input type="hidden" name="total_score" id="total_score">
		</div></td>
	</tr>
	<tr>
		<th colspan="4">내용</th>
	</tr>
	<tr>
		<td colspan="4">
		<textarea id="content" name="content" rows="10" cols="100" 
		placeholder="불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다.">${board.content }</textarea>
		</td>
	</tr>
	</table>
	
	<div class="text-center">
	<button type="submit" id="btnUpdate">수정 적용</button>
	<button type="button" id="btnCancel" onclick="history.go(-1)">취소</button>
	</div>
</form>

</div>

