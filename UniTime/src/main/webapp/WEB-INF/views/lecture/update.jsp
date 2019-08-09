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
.ed>h3 {
	font-weight: bold;
	font-size: 30px;
}

.lectureUpdateTable {
	font-size: 14px;
	line-height: 1.5;
	border: none;
	margin-bottom: 15px;
	font-family: 'NanumSquare', sans-serif;
}
.lectureUpdateTable tr th {
	font-weight: 700;
	white-space: nowrap;
	width:100px;
}
.lectureUpdateTable tr th, .lectureUpdateTable tr td {
	color: #34314c;
	text-align: left;
	padding: 10px 10px 0 0;
	border: none;
}

.lectureUpdate #content{
	width:100%;
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

#btnUpdate {
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

#btnCancel {
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
</style>

<div class="lectureUpdate">

<div class="ed board-header padding-horizontal-small@s margin-bottom-small" style="text-align: left;">
	<h3>강의평가 게시판</h3>
	<p>여러분들의 강의 후기를 학우들에게 공유해주세요<br>※ 강의평가 게시판은 익명으로 작성됩니다</p>
</div>

<form action="/lecture/update?boardno=${board.boardno }" method="post">

	<table class="lectureUpdateTable">
	<tr>
		<th>글번호</th>
		<td>${board.boardno }</td>
	</tr>
	<tr>
		<th>강의명</th>
		<td>${timetable.lecture_name } - ${timetable.professor_name }</td>
	</tr>
	<tr>
		<th>조별과제</th>
		<td>
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
		<td>
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
		<td>
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
		<th>내용</th>
	</tr>
	</table>
	
	<textarea id="content" name="content" rows="10" cols="100" 
		placeholder="불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다.">${board.content }</textarea>
	
	<div class="text-center">
	<button type="submit" id="btnUpdate">수정 적용</button>
	<button type="button" id="btnCancel" onclick="history.go(-1)">취소</button>
	</div>
</form>

</div>

