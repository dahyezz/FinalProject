<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- select태그 부트스트랩 적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/js/bootstrap-select.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
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

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
	width: 300px;
	float: left;
	text-align: center; 
}

.lectureWrite #content{
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

#btnWrite {
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

<div class="lectureWrite">

<div class="ed board-header padding-horizontal-small@s margin-bottom-small" style="text-align: left;">
	<h3>강의평가 게시판</h3>
	<p>여러분들의 강의 후기를 학우들에게 공유해주세요<br>※ 강의평가 게시판은 익명으로 작성됩니다</p>
</div>

<form action="/lecture/write" method="post">

	<table class="table table-condensed">
	<tr>
		<th>강의명</th>
		<td colspan="3">
			<select name="department_code" class="selectpicker">
				<option selected>- - - - - 강의명 선택 - - - - -</option>
				<c:forEach items="${timetableList }" var="i">
				<option value="${i.lecture_code }">${i.lecture_name } - ${i.professor_name }</option>
				</c:forEach>
			</select>
		</td>
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
		placeholder="불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다."></textarea>
		</td>
	</tr>
	</table>
	
	<div class="text-center">
	<button type="submit" id="btnWrite" >작성</button>
	<button type="button" id="btnCancel">취소</button>
	</div>
</form>

</div>
