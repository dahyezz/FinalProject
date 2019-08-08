<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style type = "text/css">
.footer {
	position: absolute;
	width: 100%;
	bottom: 0;
}
.menubar1{
margin-left: 0px;
margin-bottom: 30px;
width: 200px;
height:300px;
background:#47b8e017;
}
.menubar2{
margin-left: 220px;
margin-bottom: 30px;
width: 900px;
height:300px;
background:#47b8e017;
}
#memberDelete {
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
  color: #47b8e0;
  font-size: 12px;
  padding: 10px 20px 10px 20px;
  border: solid  #47b8e0 1px;
  text-decoration: none;
}

#btnModify {
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
  color: #47b8e0;
  font-size: 12px;
  padding: 10px 20px 10px 20px;
  border: solid  #47b8e0 1px;
  text-decoration: none;
}

#btnCancel {
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

</style>
<script type="text/javascript">
function inputCheck() {
	
	var join = document.joinForm;

	if(!join.password.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
	    alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 혼합하여 사용해주세요. 영문은 대소문자를 구분합니다.");
	    return false;
	}
}

function inputCheck() {
	
	var join = document.modifyForm;
	
	if(!join.password.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
	    alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 혼합하여 사용해주세요. 영문은 대소문자를 구분합니다.");
	    return false;
	}
}
	$(document).ready(function() {
		
		$(".nickCheck").click(function() {
			var query = {
				nickname : $("#nickname").val()
			};
			
			console.log( $("#nickname").val() );
			
			/* $.ajax({
				url : "/member/nickCheck",
				type : "post",
				data : query,
				success : function(data) {

					console.log(data);
					
					if (data == 1) {
						$(".result1 .msg").text("사용 불가한 닉네임입니다.");
						$(".result1 .msg").attr("style", "color:#f00");

						$("#btnJoin").attr("disabled", "disabled");
					} else {
						$(".result1 .msg").text("사용 가능한 닉네임입니다.");
						$(".result1 .msg").attr("style", "color:#00f");

						$("#btnJoin").removeAttr("disabled");
					}
				}
			}); // ajax 끝 */
		});

		//페이지 첫 접속 시 입력창으로 포커스 이동
		$("input").eq(0).focus();

		//패스워드 입력 창에서 엔터 입력 시 form submit
		$("input").eq(1).keydown(function(key) {
			if (key.keyCode == 13) {
				$(this).parents("form").submit();
			}
		})

		//수정완료 버튼 클릭 시 form submit
		$("#btnModify").click(function() {
			$(this).parents("form").submit();
		})

		//취소 버튼 누르면 뒤로가기
		$("#btnCancel").click(function() {
			history.go(-1);
		})
	});
</script>
<br><br><br>
<div class = "row">
<div class="col-sm-4">
<div class="menubar1" >
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
	<h3>${nick }님</h3><br><br>
	닉네임 : ${nick }<br><br>
	학번 : ${hakbun }
</div>
</c:if>
</div>
<div style="position: relative; left: 40px; bottom: -75px;">
<button type="button" id = "memberDelete" onclick="location.href='/member/memberDelete'">회원 탈퇴</button>
</div>
</form>
</div>
</div>

<!-- ------------------------------------------------------------------------------------------ -->

<div class="col-4">
<div class="menubar2" >
	<form action="/member/modify" method="post" name="modifyForm"
		onsubmit="return inputCheck()">
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

<div align="left" style=" position: absolute; margin-left : 30px">
	<h4>회원정보 수정</h4>
	<table>
<!--  	<tr>
		<th style="width: 100px" scope="row"><label>닉네임<input id="nickname" type="text" name="nickname" placeholder=" 닉네임을 입력하세요" /></label>
		<button type="button" class="nickCheck" id = "nickCheck">닉네임 확인</button></th>
	</tr>
	<tr>
		<th><p class="result1">
		<span class="msg">닉네임을 확인해 주십시오.</span></th>
	</tr> -->
	<tr>
		<th style="width: 100px" scope="row"><label>새 비밀번호<input id = "password" type="password" name="password" placeholder="새 비밀번호를 입력하세요" /></label></th>
		</tr>
	</table>
		<input type = "hidden" name = "hakbun" value = "${hakbun}">
		<button id="btnModify">수정완료</button>
		<button id="btnCancel">뒤로가기</button>
</div>
</c:if>
</div>

</form>
</div></div></div>
<br><br><br>



