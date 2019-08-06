<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	$(".emailCheck").click(function() {
		var query = {
			email : $("#email").val()
		};
		
		console.log( $("#email").val() );
		
		var email = $("#email").val();
		
		$.ajax({
			type: "post"
			, url: "/member/pwFind"
			, dataType: "json"
			, data: {
				email: email
			}
			, success: function(data){
				console.log(data.success)
				if(data.success){
					if(data.success){
						$(".result .msg").text("메일이 발송되었습니다");
						$(".result .msg").attr("style", "color:#47b8e0");
						
					} else {
						$(".result .msg").text("없는 이메일입니다");
						$(".result .msg").attr("style", "color:#f00");
					}
				}
			}
		});
	});
})
</script>

<style type="text/css">
.pwFind{
	background-color : #eeeff1;
	margin:-7px;
	padding-top:15px;
	padding-left:15px;
}
.pwFind input[type="text"]{
	width:300px;
	height:30px;
	border-radius: 5px;
	border:1.5px solid #ccc;
	font-size:20px;
	padding-left:10px;
}
.pwFind label{
	width:300px;
	height:30px;
	font-size:20px;
	padding-left:10px;
	font-weight:bold;
}
.pwFind input[type="button"]{
	margin-left:100px;
	width:125px;
	background-color:#0080ff;
	border:#0080ff;
	color:white;
	font-size:12px;
	font-weight:bold;
	border-radius: 5px;
	padding: 10px;
	cursor:pointer;
}
#result{
	height:70px;
	font-weight:bold;
	color:#0080ff;
	text-align:center;
	margin-top:20px;
}
</style>

</head>
<body>

<div class="pwFind">

<form action="/member/pwFind" method="post">

	<label for="email">이메일</label><br>
	<input type="text" id="email" name="email" placeholder="이메일을 입력하세요"/><br><br>
	<p class="result"><span class="msg">이메일을 확인해 주십시오.</span>
	<input type="button" value="비밀번호 찾기" class="emailCheck">
</form>

<div id="result"></div> 

</div>


