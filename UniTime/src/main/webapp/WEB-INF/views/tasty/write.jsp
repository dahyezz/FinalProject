<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- select태그 부트스트랩 적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/js/bootstrap-select.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
		
	$('#summernote').summernote({
		height: 300,
		minHeight: 300,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR',
		placeholder: '음식사진은 최소 한 장 이상 첨부해주세요.<br> 불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다.',
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
// 		callbacks: {
// 			onImageUpload: function(files, editor){
// 				for(var i=files.length-1; i>=0; i--) {
// 					sendFile(files[i], this);
// 				}
// 			}
// 		}
		
	});
	
	//취소 버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	//select태그 동작
	$('select').selectpicker();
	
});

function postForm() {
	
	if(writeForm.storeName.value==""){
		alert("음식점명을 입력해주세요");
		writeForm.storeName.focus();
		return false;
	}
	
	if(writeForm.loc.value==""){
		alert("위치를 입력해주세요");
		writeForm.loc.focus();
		return false;
	}
	
	$('textarea[name="content"]').val($('#summernote').summernote('code'));
}

function sendFile(file, el){
	var form_data = new FormData();
	form_data.append('tastyFile', file);
	
	$.ajax({
		data: form_data
		, type: "POST"
		, url: "/tasty/write"
		, cache: false
		, contentType: false
		, enctype: "multipart/form-data"
		, processData: false
		, success: function(data) {

			
		}
	});
}

</script>

<div class="page-header">
	<h3>게시글 작성</h3>
</div>

<div>
<form action="/tasty/write" method="post" onsubmit="return postForm()" name="writeForm">

	<div class="container">
<!-- 		<span class="input-group-addon" id="basic-addon1">종류</span> -->
		<select id="tag" name="tag" class="selectpicker" style="height:30px">
			<option value="술">술</option>
			<option value="밥">밥</option>
			<option value="카페">카페</option>
		</select>
		
		<select name="score" class="selectpicker" style="height:30px">
			<option value="5">5</option>
			<option value="4">4</option>
			<option value="3">3</option>
			<option value="2">2</option>
			<option value="1">1</option>
		</select>
		
	</div>


	<div class="input-group">
		<span class="input-group-addon" id="basic-addon1">음식점이름</span>
		<input type="text" class="form-control" name="storeName" style="width:100%"/>
	</div>
	<div class="input-group">
		<span class="input-group-addon" id="basic-addon1">위치</span>
		<input type="text"  class="form-control" name="loc" style="width:100%"/>
	</div>

	
	<input type="hidden" name="writer" value="${nick }" />
	<textarea name="content" id="content" style="display: none;"></textarea>
	<div id="summernote"></div>

<div class="text-center">	
	<button type="submit" class="btn btn-info">작성</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>

</form>
</div>
    