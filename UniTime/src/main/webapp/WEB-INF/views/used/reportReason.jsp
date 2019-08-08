<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 대학생활</title>
<link rel="shortcut icon" type="image/x-icon" href="/image/logo.png" />
<link href="https://fonts.googleapis.com/css?family=Gothic+A1:400,600&display=swap" rel="stylesheet">
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	var reaseon;
	var textReason;
	
	//라디오버튼 선택 시
	$("input:radio").on('click', function(){

		reason = $('input[name="reason"]:checked').val();
// 		console.log(reason);

		if(reason == '기타'){
			document.getElementById('reasonText').removeAttribute("disabled");
			var count = 1;

			$("#reasonText").on('keyup', function(){
			    if($(this).val().length>500){
			    
			    	if(count==1){
			    		document.getElementById("zz").innerHTML += 
			    			"<span>최대 500자까지 작성 가능합니다</span>"
			    	}
			    	
			    	$(this).val($(this).val().substring(0,500));
			    	count = 0;

			    }
			});
			
			var oldVal = "";
			$("#reasonText").on('change', function() {
				
				var currentVal = $(this).val();
				if(currentVal  == oldVal)
					return;
				
				oldVal = currentVal;
				textReason = $(this).val();
			});

		}
		
		if(reason != '기타'){
			document.getElementById('reasonText').setAttribute("disabled", true);
		}
	})
	
	$('#declare').click(function() {

		var result = reason;

		if(reason == '기타')
			result = textReason;

// 		console.log(opener.document.getElementById("reason"))
		opener.document.getElementById("reason").value = result;
		window.close();

	})
	
});
</script>

<style type="text/css">
h1, h5, p {
	font-size: 12px;
	font-family: '돋움',dotum,sans-serif;
	line-height: 1.5;
}
input, select, textarea, button {
	vertical-align: middle;
	margin: 0 2px 0 0;
	padding: 0;
}
p {
	margin: 0;
}
body {
	margin-top: 0;
}
.pop_header {
	border-bottom: 1px solid #eeeec;
	padding: 27px 24px 9px;
}
.pop_body {
	position: relative;
	padding: 0 24px;
	margin: 0;
}
.declare_info {
	padding: 15px 0 10px 0;
	line-height: 19px;
	border-top: 1px solid #e3e6f5;
	letter-spacing: -1;
}
.reason {
	clear: both;
	padding: 18px 29px 0;
	border: 2px solid #dbe0f3;
} 
.reason_header {
	position: relative;
	font-size: 12px;
	height: 30px;
	margin-bottom: 14px;
}
.pop_header>h1 {
	font-family: 'Gothic A1', sans-serif;
	height: 24px;
/* 	height: 64px; */
	margin: 0 0 1px 20px;
	color: #000;
	font-size: 25px;
	letter-spacing: -1px;
	margin-left: 10px;
}
.reason_header>h5 {
	font-size: 12px;
	display: inline;
}
.reason_header>span {
	font-size: 13px;
	color: #3c3939;
}
.reason_select {
	overflow: hidden;
	clear: both;
	padding-left: 1px;
}
.reason_select>span {
	float: left;
	width: 47%;
	margin-bottom: 9px;
	font-size: 12px;
	line-height: 1.5;
}
.reason_select>label>input {
/* 	width: 180px; */
}
#inputReason {
	overflow: hidden;
	clear: both;
	height: 57px;
	padding-left: 11px;
	margin-bottom: 17px;
	border: 1px solid #dddce2;
	background: #fbfbfb;
}
#reasonText{
	width: 100%;
	display: block;
	padding-top: 5px;
	height: 52px;
	background-color: #fbfbfb;
	border: 0 none;
}
.closeBtn {
	overflow: hidden;
	width: 124px;
	height: 28px;
	margin: 14px auto 0;
	text-align: center;
}
.reason>p {
	font-size: 13px; 
}
.list_report {
	padding: 18px 0 8px 0;
	border-top: 1px solid #e9e9e9;
}
ul, li {
	list-style: none;
}
.list_report li {
	font-size: 12px;
	font-family: '돋움',dotum,sans-serif;
	padding-left: 16px;
	margin-bottom: 5px;
	line-height: 16px;
	color: #838383;
	letter-spacing: -1px;
	background-image: url("/image/check.png");
	background-position-x: -60px;
	background-position-y: -96px;
	background-size: initial;
	background-repeat: none;
	
}
</style>

</head>
<body>
<div class="pop_header">
	<h1>신고하기</h1>
</div>

<div class="pop_body">
	<div class="declare_info">
		<p>여러분의 적극적인 관심과 신고가 건전한 인터넷 문화를 만듭니다.</p>
		<p>모두가 웃으며 이용하는 즐거운 소통의 장이 될 수 있도록 슬대와 함께해 주세요.</p>
	</div>

<div class="reason">
	<div class="reason_header">
		<h5>사유선택 : </h5>
		<span>여러 사유에 해당되는 경우, 대표적인 1개를 선택해 주세요</span><br>
	</div>
	
	<div class="reason_select">
		<span><input type="radio" name="reason" value="영리목적/홍보성" />영리목적/홍보성</span>
		<span><input type="radio" name="reason" value="불법정보" />불법정보</span><br>
		<span><input type="radio" name="reason" value="음란성/선정성" />음란성/선정성</span>
		<span><input type="radio" name="reason" value="욕설/인신공격" />욕설/인신공격</span><br>
		<span><input type="radio" name="reason" value="개인정보노출" />개인정보노출</span>
		<span><input type="radio" name="reason" value="같은 내용의 반복 게시(도배)" />같은 내용의 반복 게시(도배)</span><br>
		<span><input type="radio" name="reason" value="기타" />기타</span><br>
			<div id="inputReason">
				<div id="zz"></div>
				<textarea id="reasonText" rows="3" cols="50" name="reason_input" placeholder="기타 항목 선택 후 입력해주세요(최대 500자)" disabled="disabled"></textarea>
			</div>
	</div>
	
	<ul class="list_report">
		<li>허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니, 유의하시어 신중하게 신고해 주세요</li>
		<li>신고해주신 내용은 운영정책 및 서비스 약관에 따라 처리됩니다.</li>
		<li>명예훼손, 저작권 등 신고자의 권리가 침해된 경우에는 권리침해 신고센터로 문의해주세요.</li>
	</ul>
</div>

<div class="closeBtn">
	<button id="cancle" onclick="javascript:window.close();">취소</button>
	<button id="declare">신고</button>
</div>
</div>
</body>
</html>