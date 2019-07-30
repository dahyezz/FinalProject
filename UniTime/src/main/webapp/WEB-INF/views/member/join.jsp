<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
#btnJoin {
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
  font-size: 15px;
  padding: 10px 20px 10px 20px;
  border: solid #47b8e0 1px;
  text-decoration: none;
}

#btnJoin:hover {
  text-decoration: none;
}
#btnCancel {
  background: #47b8e0;
  background-image: -webkit-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: -moz-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: -ms-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: -o-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: linear-gradient(to bottom, #47b8e0, #47b8e0);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  padding: 10px 20px 10px 20px;
  border: solid #ffffff 1px;
  text-decoration: none;
}

#btnCancel:hover {
  text-decoration: none;
}

#idCheck, #nickCheck {
  background: #47b8e0;
  background-image: -webkit-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: -moz-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: -ms-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: -o-linear-gradient(top, #47b8e0, #47b8e0);
  background-image: linear-gradient(to bottom, #47b8e0, #47b8e0);
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  font-family: Arial;
  color: #ffffff;
  font-size: 12px;
  padding: 5px 10px 5px 10px;
  border: solid #ffffff 1px;
  text-decoration: none;
}

</style>
<script type="text/javascript">

function inputCheck() {
	
	var join = document.joinForm;
	
	if (join.password.value != join.passwordCheck.value) {
		alert("비밀번호를 동일하게 입력해주세요");
		join.userpwCheck.focus();
		return false;
	}

	if(!join.password.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
	    alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 혼합하여 사용해주세요. 영문은 대소문자를 구분합니다.");
	    return false;
	}
}

	$(document).ready(function() {
		$(".idCheck").click(function() {
			
			var join = document.joinForm;
			
		    if (join.hakbun.value.length < 9 || join.hakbun.value.length > 9){
		        alert("학번은 9자 이여야 합니다.");
		        x.id.focus();
		        return;
		        }
			
		    //----------------------------------------------------------------------------------------------------
			var query = {
				hakbun : $("#hakbun").val()
			};
			
			console.log( $("#hakbun").val() );
			
			$.ajax({
				url : "/member/idCheck",
				type : "post",
				data : query,
				success : function(data) {

					console.log(data);
					
					if (data == 1) {
						$(".result .msg").text("이미 등록된 학번입니다");
						$(".result .msg").attr("style", "color:#f00");

						$("#btnJoin").attr("disabled", "disabled");
					} else {
						$(".result .msg").text("사용 가능한 학번입니다");
						$(".result .msg").attr("style", "color:#47b8e0");

						$("#btnJoin").removeAttr("disabled");
					}
				}
			}); // ajax 끝
		});
			//----------------------------------------------------------------------------------------------------
		$(".nickCheck").click(function() {
			var query = {
				nickname : $("#nickname").val()
			};
			
			console.log( $("#nickname").val() );
			
			$.ajax({
				url : "/member/nickCheck",
				type : "post",
				data : query,
				success : function(data) {

					console.log(data);
					
					if (data == 1) {
						$(".result1 .msg").text("사용 불가한 닉네임입니다");
						$(".result1 .msg").attr("style", "color:#f00");

						$("#btnJoin").attr("disabled", "disabled");
					} else {
						$(".result1 .msg").text("사용 가능한 닉네임입니다");
						$(".result1 .msg").attr("style", "color:#00f");

						$("#btnJoin").removeAttr("disabled");
					}
				}
			}); // ajax 끝
		});
			
		$("#idCheckBtn").unbind("click").click(function(e) {
			e.preventDefault();
			fn_userIDCHeck();
		});

		//페이지 첫 접속 시 입력창으로 포커스 이동
		$("input").eq(0).focus();

		//패스워드 입력 창에서 엔터 입력 시 form submit
		$("input").eq(1).keydown(function(key) {
			if (key.keyCode == 13) {
				$(this).parents("form").submit();
			}
		})

		//가입 버튼 클릭 시 form submit
		$("#btnJoin").click(function() {
			$(this).parents("form").submit();
		})

		//취소 버튼 누르면 뒤로가기
		$("#btnCancel").click(function() {
			history.go(-1);
		})
	});
</script>

<div style="text-align: center">
	<h3>회원가입</h3>
</div>


<div>

	<form action="/member/join" method="post" name="joinForm"
		onsubmit="return inputCheck()">
		<table style="text-align: center; margin: auto;">
			<tr>
				<th style="width: 100px" scope="row"><label>학번<input
						id="hakbun" type="text" name="hakbun" placeholder=" 학번을 입력하세요" /></label>
					<button type="button" class="idCheck" id = "idCheck">학번 확인</button></th>
			</tr>
			<tr>
				<th><p class="result">
						<span class="msg">학번을 확인해 주십시오.</span></th>
			</tr>
			<tr>
				<th style="width: 100px" scope="row"><label>이름<input
						type="text" name="name" placeholder=" 이름을 입력하세요" /></label></th>
			</tr>
			<tr>
				<th style="width: 100px" scope="row"><label>이메일<input
						type="email" name="email" placeholder=" 이메일을 입력하세요" /></label></th>
			</tr>
			<tr>
				<th style="width: 100px" scope="row"><label>닉네임<input
						id="nickname" type="text" name="nickname"
						placeholder=" 닉네임을 입력하세요" /></label>
					<button type="button" class="nickCheck" id = "nickCheck">닉네임 확인</button></th>
			</tr>
			<tr>
				<th><p class="result1">
						<span class="msg">닉네임을 확인해 주십시오.</span></th>
			</tr>
			<tr>
				<th style="width: 100px" scope="row"><label>패스워드<input
						type="password" name="password" placeholder=" 비밀번호를 입력하세요" /></label></th>
			</tr>
			<tr>
				<th style="width: 100px" scope="row"><label>패스워드확인<input
						type="password" name="passwordCheck" placeholder=" 비밀번호확인" /></label></th>
			</tr>
		</table>
		<br> <br>
		<button type="button" id="btnJoin" disabled="disabled"
			class="btn btn-info">이메일인증 후 가입</button>
		<button type="button" id="btnCancel" class="btn btn-danger">
			뒤로가기</button>
		<br> <br>
	</form>
</div>

