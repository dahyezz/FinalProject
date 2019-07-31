<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	var reaseon;
	var textReason;
	
	//라디오버튼 선택 시
	$("input:radio").on('click', function(){

		reason = $('input[name="reason"]:checked').val();

		if(reason == '기타'){
			document.getElementById('reasonText').removeAttribute("disabled");
			var count = 1;

			$("#reasonText").on('keyup', function(){
			    if($(this).val().length>500){
			    
			    	if(count==1){
			    		document.getElementById("overflow").innerHTML += 
			    			"<span style='color:red;'>최대 500자까지 작성 가능합니다</span>"
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
	
	$('#btnReport').click(function() {

		var result = reason;
		
		if(reason == '기타')
			result = textReason;

		var reportConfirm=confirm("신고하시겠습니까?");
		
		if(reportConfirm){
			$form=($("<form>")
					.attr("action", "/free/report")
					.attr("method", "post")
					).append(
							$("<input>").attr("name", "boardname").val($("#boardname").val()),
							$("<input>").attr("name", "boardno").val($("#boardno").val()),
							$("<input>").attr("name", "commentno").val($("#commentno").val()),
							$("<input>").attr("name", "reason").val(result),
							$("<input>").attr("name", "nickname").val($("#nickname").val())
					).appendTo($(document.body));
			
			$form.submit();
		}
		
		window.close();
	});
	
});
</script>

<style type="text/css">
.reason {
	border: 1px solid blue;
}
</style>

</head>
<body>

<h1>신고하기</h1>
<hr>

<p>신고는 반대 의견을 표시하는 기능이 아닙니다</p>
<p>신고 대신 반대 의견이나 [대댓글]을 적어 보시는 것은 어떨까요?</p>
<p>다른 의견에 대한 경청과 예의를 갖춘 토론이 댓글을 더 가치있게 합니다.</p>


<div class="reason">

	<input type="hidden" id="boardname" value="free">
	<input type="hidden" id="boardno" value="${badReport.boardno }">
	<input type="hidden" id="commentno" value="${badReport.commentno }">
	<input type="hidden" id="nickname" value="${badReport.nickname }">
	
	<h5>신고사유</h5>
	
	<label><input type="radio" name="reason" value="영리목적/홍보성" />영리목적/홍보성</label>
	<label><input type="radio" name="reason" value="불법정보" />불법정보</label><br>
	<label><input type="radio" name="reason" value="음란성/선정성" />음란성/선정성</label>
	<label><input type="radio" name="reason" value="욕설/인신공격" />욕설/인신공격</label><br>
	<label><input type="radio" name="reason" value="개인정보노출" />개인정보노출</label>
	<label><input type="radio" name="reason" value="같은 내용의 반복 게시(도배)" />같은 내용의 반복 게시(도배)</label><br>
	<label><input type="radio" name="reason" value="기타" />기타</label><br>
	
	<div id="inputReason">
		<div id="overflow"></div>
		<textarea id="reasonText" rows="3" cols="50" name="reason" placeholder="기타 항목 선택 후 입력해주세요(최대 500자)" disabled="disabled"></textarea>
	</div>
	
	<p>허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니, 유의하시어 신중하게 신고해 주세요</p>
	<p>신고해주신 내용은 운영정책 및 서비스 약관에 따라 처리됩니다.</p>
	<p>명예훼손, 저작권 등 신고자의 권리가 침해된 경우에는 권리침해 신고센터로 문의해주세요.</p>

	<button id="btnCancle" onclick="window.close();">취소</button>
	<button id="btnReport">신고</button>
</div>
</body>
</html>