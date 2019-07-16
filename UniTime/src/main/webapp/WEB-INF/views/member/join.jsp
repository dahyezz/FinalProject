<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">

function inputCheck() {
	
	var join = document.joinForm;
	
	if (join.password.value != join.passwordCheck.value) {
		alert("비밀번호를 동일하게 입력해주세요");
		join.userpwCheck.focus();
		return false;
	}
}
	$(document).ready(function() {
		$(".idCheck").click(function() {

			var query = {
				userId : $("#hakbun").val()
			};

			$.ajax({
				url : "/member/idCheck",
				type : "post",
				data : query,
				success : function(data) {

					if (data == 1) {
						$(".result .msg").text("사용 불가");
						$(".result .msg").attr("style", "color:#f00");

						$("#btnJoin").attr("disabled", "disabled");
					} else {
						$(".result .msg").text("사용 가능");
						$(".result .msg").attr("style", "color:#00f");

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

	<form action="/member/join" method="post" name = "joinForm" onsubmit = "return inputCheck()">
		<table style="text-align: center; margin: auto;">
			<tr>
				<th style="width: 100px" scope="row"><label>학번<input
						type="text" name="hakbun" placeholder=" 학번을 입력하세요" /></label>
				<button type="button" class="idCheck">학번 확인</button></th>
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
						type="text" name="nickname" placeholder=" 닉네임을 입력하세요" /></label></th>
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

