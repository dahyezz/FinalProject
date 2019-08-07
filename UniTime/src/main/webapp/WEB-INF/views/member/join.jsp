<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>

#title {
	margin : auto;
	width: 1000px;
}
#wrap {
	margin : auto;
	width: 1000px;
	height: 250px;
	white-space: normal;
	overflow: auto;
	font-style: inherit;
}
#content{
	white-space: pre-line;
	font-size: small;
}
#end{
	margin : auto;
	width: 1000px;
}

#btnJoin, #btnNext{
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

#idCheck, #nickCheck, #emailCheck {
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
	
		$('.show1').show(); //페이지를 로드할 때 표시할 요소
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소

	$('.next1').click(function(){
		$('.show1').hide(); //클릭 시 첫 번째 요소 숨김
		$('.show2').show(); //클릭 시 두 번째 요소 표시
		
		return false;
	});
	
	$("#allChk").click(function(){
		//allChk가 클릭되어 있으면
		if($("#allChk").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);	//checkbox를 모두 체크
		} else{
			$("input[type=checkbox]").prop("checked",false);	//checkbox를 모두 체크 해제
		}
	});
		
	//각각의 체크박스가 해제되었을 때 allChk 체크 해제
	$("#chk1").click(function(){
		if(!$("#chk1").prop("checked")){
			$("#allChk").prop("checked",false);
		}
	});
	
	$("#chk2").click(function(){
		if(!$("#chk2").prop("checked")){
			$("#allChk").prop("checked",false);
		}
	});
	
	//필수 동의 항목 체크 여부
	$("#btnNext").click(function() {
		
		if(!$("#chk1").prop("checked") || !$("#chk2").prop("checked")){
			$(location).attr("href", "/member/join");
			alert('필수 동의 항목에 체크해 주십시오');
		}
		
		if($("#chk1").prop("checked") && $("#chk2").prop("checked")){
		}
	});
	
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
					$(".result .msg").attr("style", "color:#000000");

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
				dataType : "json",
				success : function(data) {

					console.log(data);
					
					if (data == 1) {
						$(".result1 .msg").text("사용 불가한 닉네임입니다");
						$(".result1 .msg").attr("style", "color:#f00");

						$("#btnJoin").attr("disabled", "disabled");
					} else {
						$(".result1 .msg").text("사용 가능한 닉네임입니다");
						$(".result1 .msg").attr("style", "color:#000000");

						$("#btnJoin").removeAttr("disabled");
					}
				}
			}); // ajax 끝
		});
		//----------------------------------------------------------------------------------------------------
		$("#emailCheck").click(function() {
			var query = {
				email : $("#email").val()
			};
			
			console.log( query );

			$.ajax({
				url : "/member/emailCheck",

				type : "post",
				data : query,

				dataType : "json",
				success : function(data) {
					
					console.log(data);
					
					if (data == 1) {
						$(".result2 .msg").text("사용 불가한 이메일입니다");
						$(".result2 .msg").attr("style", "color:#f00");

						$("#btnJoin").attr("disabled", "disabled");
					} else {
						$(".result2 .msg").text("사용 가능한 이메일입니다");
						$(".result2 .msg").attr("style", "color:#000000");

						$("#btnJoin").removeAttr("disabled");
					}
				} , error : function( e ) {
					console.log("error");
// 					console.log(e)
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

	<form action="/member/join" method="post" name="joinForm"
		onsubmit="return inputCheck()">
	<div class = show1>

<div id="title">	
	<h4> 이용약관 </h4>
</div>	
	
	
<div id="wrap" >

<pre id="content">		
<h3>제1장 총칙</h3> 


<span style="font-weight:bold">제1조 (목적)</span>

① 슬기로운 대학생활 - 서비스 약관(이하 "본 약관"이라 합니다)은 이용자가 슬기로운대학생활에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)를 이용함에 있어 이용자와 "슬기로운대학생활"의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. 

② 이용자가 되고자 하는 자가 "슬기로운대학생활"에서 정한 소정의 절차를 거쳐서 "약관동의" 단추를 누르면 본 약관에 동의하는 것으로 간주합니다. 본 약관에 정하는 이외의 이용자와 "슬기로운대학생활"의 권리, 의무 및 책임사항에 관해서는 전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다. 


<span style="font-weight:bold">제2조(이용자의 정의)</span> 

① "이용자"란 "슬기로운대학생활"에 접속하여 본 약관에 따라 "슬기로운대학생활" 회원으로 가입하여 "슬기로운대학생활"에서 제공하는 서비스를 받는 자를 말합니다.

 


<span style="font-weight:bold">제3조(회원 가입)</span> 

① 이용자가 되고자 하는 자는 "슬기로운대학생활"에서 정한 가입 양식에 따라 회원정보를 기입하고 "회원가입" 단추를 누르는 방법으로 회원 가입을 신청합니다. 

② "슬기로운대학생활"은 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다.

   1. 등록 내용에 허위, 기재누락, 오기가 있는 경우 

   2. 기타 회원으로 등록하는 것이 "슬기로운대학생활"의 기술상 현저히 지장이 있다고 판단되는 경우 

③ 회원가입계약의 성립시기는 "슬기로운대학생활"의 등록완료한 시점으로 합니다. 

④ 회원은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. 

<span style="font-weight:bold">제4조(서비스의 제공 및 변경)</span> 

① "슬기로운대학생활"은 이용자에게 아래와 같은 서비스를 제공합니다.

   1. 사이트내의 컨텐츠 이용 서비스

   2. 기타 "슬기로운대학생활"에서 자체 개발하거나 다른 회사와의 협력계약 등을 통해 회원들에게 제공할 일체의 서비스

② "슬기로운대학생활"은 그 변경될 서비스의 내용 및 제공일자를 제7조 제2항에서 정한 방법으로 이용자에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.


<span style="font-weight:bold">제5조(서비스의 중단)</span> 

① "슬기로운대학생활"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 "슬기로운대학생활"이 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다. 

② 제1항에 의한 서비스 중단의 경우에는 "슬기로운대학생활"은 제7조 제2항에서 정한 방법으로 이용자에게 통지합니다. 다만, "슬기로운대학생활"에서 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다. 



<span style="font-weight:bold">제6조(이용자 탈퇴 및 자격 상실 등)</span> 

① 이용자는 "슬기로운대학생활"에 언제든지 자신의 회원 등록을 말소해 줄 것(이용자 탈퇴)을 요청할 수 있으며 "슬기로운대학생활"은 위 요청을 받은 즉시 해당 이용자의 회원 등록 말소를 위한 절차를 밟습니다. 

② 이용자가 다음 각 호의 사유에 해당하는 경우, "슬기로운대학생활"은 이용자의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다. 

   1. 가입 신청 시에 허위 내용을 등록한 경우 

   2. 다른 사람의 "서비스" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우 

   3. "서비스"를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 

③ "슬기로운대학생활"은 이용자의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. 이 경우 이용자인 회원에게 회원등록 말소 전에 이를 통지하고, 소명할 기회를 부여합니다. 

<span style="font-weight:bold">제7조(이용자에 대한 통지)</span>

① "슬기로운대학생활"은 특정 이용자에 대한 통지를 하는 경우 "슬기로운대학생활" 의 회원정보에 기재된 E-mail 로 통지를 합니다.

② "슬기로운대학생활"은 불특정다수 이용자에 대한 통지를 하는 경우 "슬기로운대학생활" 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 

<span style="font-weight:bold">제8조(이용자의 개인정보보호)</span>

"슬기로운대학생활"은 관련법령이 정하는 바에 따라서 이용자 등록정보를 포함한 이용자의 개인정보를 보호하기 위하여 노력합니다. 이용자의 개인정보보호에 관해서는 관련법령 및 "슬기로운대학생활"에서 정하는 "개인정보보호정책"에 정한 바에 의합니다. 

<span style="font-weight:bold">제9조("슬기로운대학생활"의 의무)</span>

① "슬기로운대학생활"은 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다. 

② "슬기로운대학생활"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 

<span style="font-weight:bold">제10조(이용자의 ID 및 비밀번호에 대한 의무)</span>

① "슬기로운대학생활"은 관계법령, "개인정보보호정책"에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에 관한 관리책임은 각 이용자에게 있습니다. 

② 이용자는 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. 

③ 이용자는 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "슬기로운대학생활"에 통보하고 "슬기로운대학생활"의 안내가 있는 경우에는 그에 따라야 합니다. 

<span style="font-weight:bold">제11조(이용자의 의무)</span>

① 이용자는 다음 각 호의 행위를 하여서는 안됩니다. 

   1. 회원가입신청 또는 변경시 허위내용을 등록하는 행위 

   2. "슬기로운대학생활"에 게시된 정보를 변경하는 행위

   3. "슬기로운대학생활" 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위 

   4. 다른 회원의 ID를 도용하는 행위 

   5. 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지 ·화상·음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는게시하는 행위. 

   6. 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)의 전송 또는 게시하는 행위

   7. 슬기로운대학생활의 직원이나 슬기로운대학생활 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을 게시하거나 메일을 발송하는 행위

   8. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편으로 발송하는 행위

   9. 스토킹(stalking) 등 다른 이용자를 괴롭히는 행위

   10. 다른 이용자에 대한 개인정보를 그 동의 없이 수집,저장,공개하는 행위

   11. 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 방법으로 "슬기로운대학생활"의 서비스를 이용하여 영 리목적의 활동을 하는 행위

   12. "슬기로운대학생활"에서 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위

② 제1항에 해당하는 행위를 한 이용자가 있을 경우 "슬기로운대학생활"은 본 약관 제6조 제2, 3항에서 정한 바에 따라 이용자의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.

③ 이용자는 그 귀책사유로 인하여 "슬기로운대학생활"이나 다른 이용자가 입은 손해를 배상할 책임이 있습니다.

<span style="font-weight:bold">제12조(공개게시물의 삭제)</span>

이용자의 공개게시물의 내용이 다음 각 호에 해당하는 경우 "슬기로운대학생활"은 이용자에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고, 해당 이용자의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다. 

   1. 다른 이용자 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용

   2. 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용

   3. 범죄행위와 관련이 있다고 판단되는 내용

   4. 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용

   5. 기타 관계 법령에 위배된다고 판단되는 내용

<span style="font-weight:bold">제13조(저작권의 귀속 및 이용제한)</span>

① "슬기로운대학생활"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "슬기로운대학생활"에 귀속합니다. 

② 이용자는 "슬기로운대학생활"을 이용함으로써 얻은 정보를 "슬기로운대학생활"의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. 

③ 회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, 슬기로운대학생활은 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되게 합리적인 범위 내에서 다음과 같이 회원이 등록한 게시물을 사용할 수 있습니다. 

   1. 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물성을 해치지 않는 범위 내에서의 편집 저작물 작성 

   2. 미디어, 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 전시 혹은 홍보하게 하는 것. 단, 이 경우 슬기로운대학생활은 별도의 동의 없이 회원의 이용자ID/닉네임 및 관련 IP 외에 회원의 개인정보를 제공하지 않습니다. 

   3. 슬기로운대학생활은 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다

<span style="font-weight:bold">제14조(광고게재 및 광고주와의 거래) </span>

① 슬기로운대학생활은 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 회원은 회원이 등록한 게시물의 내용을 활용한 광고게재 및 기타 서비스상에 노출되는 광고게재에 대해 동의합니다. 

② 슬기로운대학생활은 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다

<span style="font-weight:bold">제15조(약관의 개정)</span>

① "슬기로운대학생활"은 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다. 

② "슬기로운대학생활"이 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일자 칠(7일) 이전부터 적용일자 전일까지 공지합니다. 

③ "이용자"는 변경된 약관에 대해 거부할 권리가 있습니다. "이용자"는 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사를 표명할 수 있습니다. "이용자"가 거부하는 경우 "슬기로운대학생활"은 당해 "이용자"와의 계약을 해지할 수 있습니다. 만약 "이용자"가 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다. 

<span style="font-weight:bold">제16조(재판관할)</span>

"슬기로운대학생활"과 이용자간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다.

 

 

 

①본 약관은 2019년 7월 31일부터 적용됩니다.

①본 약관은 2019년 7월 31일부터 커뮤니티 명칭 변경으로 인해 개정되었습니다.	
	
</pre>
</div>
<br><input type="checkbox" id = "chk1"/> 회원가입 이용약관에 동의합니다
<div id="end">
	<hr>
</div>

<div id="title">
	<h4>개인정보 취급방침 </h4>
</div>


<div id="wrap" >

<pre id="content">	

<h3>개인정보 취급방침</h3>

슬기로운대학생활(이하 “회사”)은 회사가 운영하는 인터넷 사이트를 이용하는 이용자님들의 개인정보를 매우 중요하게 생각하며 아래와 같은 개인 정보취급방침을 가지고 있습니다. 이 개인정보취급방침은 개인정보와 관련한 법령 또는 지침의 변경이 있는 경우 갱신되고, 정책의 변화에 따라 달라질 수 있으니 이용자께서는 슬기로운대학생활을 방문 시 수시로 확인하여 주시기 바랍니다. 회사의 개인정보취급방침은 다음과 같은 내용을 담고 있습니다. 

회사는 이용자에게 본인확인, 다양하고 편리한 인터넷 서비스를 제공하기 위하여 아래의 방법을 통해 개인정보를 수집하고 있습니다.


<span style="font-weight:bold">1. 개인정보의 처리 목적</span>

(‘슬기로운대학생활’) 은 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.

- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 이벤트 진행

 

<span style="font-weight:bold">2. 개인정보의 처리 및 보유 기간</span>

   ① 슬기로운대학생활은 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.

   ② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.

<span style="font-weight:bold">3. 개인정보의 제3자 제공에 관한 사항</span>

   ① 슬기로운대학생활은 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

   ② 슬기로운대학생활은  개발자에 한하여 개발 목적에 대한 심사 및 승인 이후 API Key 발급 및 인증을 통하여 회원 정보 중 일부를 전달 할 수 있습니다.

       - 개발자는 교내 편의 서비스 개발을 위해서만 사용 할 수 있습니다.

       - 전송되는 데이터는 통신구간에서 암호화되어 전송되며, 중요 사용자 정보(패스워드 등...) 은 제공되지 않습니다.

       - API Key의 사용기한은 발급일로부터 1년으로 하며, 규정 위반시 즉시 API Key의 사용이 중지 됩니다.

   ③ 슬기로운대학생활은 위 ①, ② 의 경우를 제외하고는 절대 제3자에게 정보를 제공하지 않습니다.

<span style="font-weight:bold">4. 개인정보처리 위탁</span>

   ① 슬기로운대학생활은 개인정보 업무처리를 위탁하지 않습니다.

<span style="font-weight:bold">5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법</span>

   이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.

   ① 정보주체는 슬기로운대학생활에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.

      1. 개인정보 열람요구

      2. 오류 등이 있을 경우 정정 요구

      3. 삭제요구

      4. 처리정지 요구

      6. 처리하는 개인정보의 항목 작성

<span style="font-weight:bold">6. 개인정보 항목의 처리</span>

   ① 슬기로운대학생활은 다음의 개인정보 항목을 처리하고 있습니다.

   1 (회원 관리)

      - 필수항목 : 이메일, 비밀번호, 로그인ID, 이름, 학과정보, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보

         o 위 항목 중 이름, 학과 정보는 추후 이벤트 진행을 위해 수집되며, 해당 이벤트는 사행성 정보를 포함하지 않습니다.

   2 (장기 미접속 회원에 대한 처리)

      - 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제29조제2항 및 동 시행령 제16조에 따라 1년 이상 로그인하지 않은 회원님의 개인정보를 별도의 저장공간으로 이동하여 보관합니다.

<span style="font-weight:bold">7. 개인정보의 파기</span>

   슬기로운대학생활은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.

      -파기절차

         이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.

      -파기기한

         이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.

<span style="font-weight:bold">8. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</span>

   ① 슬기로운대학생활은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.

   ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.

      가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.

      나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 단, 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.

<span style="font-weight:bold">9. 개인정보 보호책임자 작성</span>

   ① 슬기로운대학생활은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

 

   ▶ 개인정보 보호책임자 

   성명 : 김현우

   연락처 : 010-4795-9150, gjflrhlanf@naver.com

 

   ② 정보주체께서는 슬기로운대학생활의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 슬기로운대학생활은 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.

<span style="font-weight:bold">10. 개인정보 처리방침 변경</span>

①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.

<span style="font-weight:bold">11. 개인정보의 안전성 확보 조치</span>

슬기로운대학생활은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.

 

   1. 정기적인 자체 감사 실시

      개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.

 

   2. 해킹 등에 대비한 기술적 대책

      슬기로운대학생활은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.

 

   3. 개인정보의 암호화

      이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

 

   4. 접속기록의 보관 및 위변조 방지

      개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.

 

   5. 개인정보에 대한 접근 제한

      개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.

 

① 본 취급방침은 2019년 7월 31일부터 적용됩니다.

② 본 취급방침은 2019년 7월 29일 어플리케이션 출시로 인하여 개정되었습니다.


</pre>
</div>
<br><input type="checkbox" id = "chk2"/> 회원가입 개인정보 취급방침에 동의합니다.
<div id="end">
	<hr>
</div>

<label>
<span class="hide">이용약관동의</span>
<input type="checkbox" name="agree" id = "allChk"/> <span class="protxt"> 모든 이용약관에 동의합니다.</span>
<span class="probtn"></span>
</label>
	<div class = "next1">

	<div style="text-align: center">
	<button type="button" id="btnNext">NEXT</button>
	</div>
	<br><br><br>

	</div>
	</div>
		
		<div class = show2>
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
						id = "email" type="email" name="email"
						placeholder=" 이메일을 입력하세요" /></label>
						<button type="button" class="emailCheck" id = "emailCheck">이메일 확인</button></th>
			</tr>
			<tr>
				<th><p class="result2">
						<span class="msg">이메일을 확인해 주십시오.</span></th>
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
		</div>
	</form>

