<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- select태그 부트스트랩 적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/js/bootstrap-select.min.js"></script>



<!-- tag sell 일때, 제품 가격 제대로 입력안했을 경우. -->
<%-- <c:if test="${tag eq 'SELL' }">
<script type="text/javascript">
$(document).ready(function() {
	$("#used-write").submit(function() {
		if(writeForm.price.value==""||writeForm.title.value==null){
			alert("판매할 제품의 가격을 정확히 입력하시라요.");
			writeForm.price.focus();
			return false;
		}
	}
})
</script>
</c:if> --%>


<script type="text/javascript">

$(document).ready(function() {
		
	$('#summernote').summernote({
		height: 300,
		minHeight: 300,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR',
		placeholder: '제품 사진은 최소 한 장 이상 첨부해주세요. 불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다.',
		toolbar: [
			['style', ['style']],
			['font', ['bold', 'italic', 'underline', 'clear']],
	        ['fontname', ['fontname']],
	        ['color', ['color']],
	        ['para', ['ul', 'ol', 'paragraph']],
	        ['height', ['height']],
	        ['table', ['table']],
	        ['insert', ['link', 'hr', 'picture']],
	        ['view', ['fullscreen', 'codeview']],
	        ['help', ['help']]
		],
		callbacks: {
			onImageUpload: function(files, editor){
				sendFile(files[0], this);
			}
		}
		
	});
	
	//취소 버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	//select태그 동작
	$('select').selectpicker();
	
	$("#used-write").submit(function() {
		
		
		if(writeForm.title.value==""||writeForm.title.value==null){
			alert("제목을 입력하시라요.");
			writeForm.title.focus();
			return false;
		}
		
		if(writeForm.product.value==""||writeForm.title.value==null){
			alert("제품명 입력하시라요.");
			writeForm.product.focus();
			return false;
		}
		
		
		$(this).append($("<input>").attr("type", "hidden").attr("name", "boardno").val(${usedboard.boardno }));
		var code = $('#summernote').summernote('code');
	    $('textarea[name="content"]').val(code);
		$(this).submit();
		
	});
	
});

function sendFile(file, el){
	//파일 전송을 위한 폼 데이터 생성
	var data = new FormData();
	data.append('img', file);
	
	//ajax를 통해 파일 업로드 처리
	$.ajax({	
		data: data
		, dataType: "json"
		, type: "POST"
		, url: "/used/productImage"
		, cache: false
		, contentType: false
		, enctype: "multipart/form-data"
		, processData: false
		, success: function(data) {
			console.log("성공");
			console.log(data);
			console.log(data.usedimgno)
			console.log(data.boardno)

			$(el).summernote('editor.insertImage', "/usedUpload?usedImgNo="+data.usedimgno);
		}
		, error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus+"  "+errorThrown)
		} 
	});
}
</script>



<input type="hidden" name="boardno" value="0" />

<div class="ed board-header padding-horizontal-small@margin-bottom-small">
	<h2>중고장터에서 거래하기</h2>
</div>


<div class="usedView">
<form action="/used/write" method="post" name="writeForm" id="used-write" enctype="multipart/form-data">

<div class="input-group">
	
	<span class="input-group-addon" id="input-group-addon1">
		태그
	</span>
	<select id="tag" name="tag" class="selectpicker" 
		style="width:30px">
		<option value="BUY">BUY</option>
		<option value="SELL">SELL</option>
	</select>
	
	
	<span class="input-group-addon" id="input-group-addon1">
		제목
	</span>
	<input type="text" class="form-control" name="title"
		style="width:100%" />
</div>
<div class="input-group">		
	<span class="input-group-addon" id="input-group-addon1">
		제품명
	</span>
	<input type="text" class="form-control" name="product"
		style="width:100%" />
	
	<span class="input-group-addon" id="input-group-addon1">
		가격
	</span>
	<input type="text" class="form-control" name="price"
		style="width:100%" />
</div>
	
	<input type="hidden" name="writer" value="${nick }" />
	<textarea name="content" id="content" 
		style="display: none;"></textarea>
	<div id="summernote"></div>
	
	
	<div id="text-center">
	    <button type="submit" id="btnWrite" class="btn btn-info">작성</button>
	    <button type="button" id="btnCancel" class="btn btn-info">취소</button>
	</div>
	

</form>
</div>

