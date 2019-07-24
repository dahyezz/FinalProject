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
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR',
		placeholder: '불건전한 언어 사용, 타인 비방 및 게시판 운영을 방해하는 행위가 확인되면 서비스 이용이 제한될 수 있습니다.',
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
		]
	});
	
	//취소 버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	//select태그 동작
	$('select').selectpicker();
	
});

function postForm() {
    $('textarea[name="content"]').val($('#summernote').summernote('code'));
}

//-------------- 별점 관련 ----------------------------------
var locked = 0;

function show(star){ //마우스 오버시 채워진 별로 나타나도록 함
	if(locked)
		return;
	var i;
	var image;
	var el;
	
	for(i=1; i<=star; i++){
		image = 'image'+i;
// 		console.log(image);
		el = document.getElementById(image);
// 		console.log(el)
		el.src = "/image/star.PNG";
	}
}

function noshow(star){ //mouse enter
	if(locked)
		return;
	var i;
	var image;
	var el;
	
	for(i=1; i<=star; i++){
		image='image'+i;
		el = document.getElementById(image);
		el.src = "/image/star0.PNG";
	}
}

function mark(star){
	lock(star);
// 	alert("선택:"+star);
	document.getElementById("score").value=star
}

function lock(star){
	show(star);
	locked=1;
}
</script>

<style type="text/css">
img{
	width: 30px;
}
</style>

<div class="page-header">
	<h3>게시글 수정</h3>
</div>

<div>
<form action="/tasty/update" method="post" >
	<input type="hidden" name="boardno" value="${board.boardno }" />
	<div class="container">
<!-- 		<span class="input-group-addon" id="basic-addon1">종류</span> -->
		<select id="tag" name="tag" class="selectpicker" style="height:30px">
			<option value="술">술</option>
			<option value="밥">밥</option>
			<option value="카페">카페</option>
		</select>
		
<!-- 		<div id="rating"> -->
			<span>
				<img id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="/image/star0.PNG" >
				<img id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="/image/star0.PNG" >
				<img id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="/image/star0.PNG" >
				<img id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="/image/star0.PNG" >
				<img id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="/image/star0.PNG" >
			</span>
			<input type="hidden" name="score" id="score"/>
<!-- 		</div> -->
		
	</div>


	<div class="input-group">
		<span class="input-group-addon" id="basic-addon1">음식점이름</span>
		<input type="text" class="form-control" name="storeName" style="width:100%" value="${board.storeName }"/>
	</div>
	<div class="input-group">
		<span class="input-group-addon" id="basic-addon1">위치</span>
		<input type="text"  class="form-control" name="loc" style="width:100%" value="${board.loc }"/>
	</div>

	
	<input type="hidden" name="writer" value="${nick }" />
	<textarea name="content" id="summernote" style="display: none;">${board.content }</textarea>

<div class="text-center">	
	<button type="submit" class="btn btn-info">작성</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>

</form>
</div>
    