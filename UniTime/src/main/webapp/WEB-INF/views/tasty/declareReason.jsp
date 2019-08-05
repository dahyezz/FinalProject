<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 대학생활</title>
<link rel="shortcut icon" type="image/x-icon" href="/image/logo.png" />
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
body {
	margin-top: 0;
}
.pop_header {
	height: 40px;
	background-color: #f6f6f6;
	border-bottom: 1px solid #eeeec;
	margin: 0;
	padding: 0;
}
.pop_header>h1 {
	height: 25px;
	margin: 13px 0 1px 20px;
	color: #000;
	font-size: 25px;
	letter-spacing: -1px;
	margin: 0;
	margin-left: 10px;
}
.reason_header>h5 {
	margin: 0;
	width: 80px;
	font-size: 15px;
	display: inline;
}
.reason_header>span {
	font-size: 13px;
	color: #3c3939;
}
.reason_select {
	margin-top: 10px;
}
.reason_select>label {
	display: inline-block;
	margin: 0 10px 5px 10px;
	width: 225px;
}
.reason_select>label>input {
/* 	width: 180px; */
}
#inputReason {
	width: 100%;
	margin-left: 30px;
	margin-top: 5px;
}
.closeBtn {
	text-align: center;
}
.reason>p {
	font-size: 13px; 
}
</style>

</head>
<body>
<div class="pop_header">
	<h1>신고하기</h1>
</div>

<p>
	신고는 반대 의견을 표시하는 기능이 아닙니다.<br>
	신고 대신 반대 의견이나 [대댓글]을 적어 보시는 것은 어떨까요?<br>
	다른 의견에 대한 경청과 예의를 갖춘 토론이 댓글을 더 가치있게 합니다.
</p>

<hr>

<div class="reason">
	<div class="reason_header">
		<h5>사유선택 : </h5>
		<span>여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요</span><br>
	</div>
	
	<div class="reason_select">
		<label><input type="radio" name="reason" value="영리목적/홍보성" />영리목적/홍보성</label>
		<label><input type="radio" name="reason" value="불법정보" />불법정보</label><br>
		<label><input type="radio" name="reason" value="음란성/선정성" />음란성/선정성</label>
		<label><input type="radio" name="reason" value="욕설/인신공격" />욕설/인신공격</label><br>
		<label><input type="radio" name="reason" value="개인정보노출" />개인정보노출</label>
		<label><input type="radio" name="reason" value="같은 내용의 반복 게시(도배)" />같은 내용의 반복 게시(도배)</label><br>
		<label><input type="radio" name="reason" value="기타" />기타</label><br>
			<div id="inputReason">
				<div id="zz"></div>
				<textarea id="reasonText" rows="3" cols="50" name="reason_input" placeholder="기타 항목 선택 후 입력해주세요(최대 500자)" disabled="disabled"></textarea>
			</div>
	</div>
	
	<p>허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니, 유의하시어 신중하게 신고해 주세요</p>
	<p>신고해주신 내용은 운영정책 및 서비스 약관에 따라 처리됩니다.</p>
	<p>명예훼손, 저작권 등 신고자의 권리가 침해된 경우에는 권리침해 신고센터로 문의해주세요.</p>

</div>

<hr>
<div class="closeBtn">
	<button onclick="javascript:window.close();">취소</button>
	<button id="declare">신고</button>
</div>

</body>
</html>