<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script type="text/javascript">

$(document).ready(function() {
		
	$('#summernote').summernote({
		height: 300,
		minHeight: 300,
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
	//$('select').selectpicker();
	
	$("#writeForm").submit(function() {
		
		$(this).append($("<input>").attr("type", "hidden").attr("name", "boardno").val(${board.boardno }));
		var code = $('#summernote').summernote('code');
	    $('textarea[name="content"]').val(code);
		$(this).submit();
		
	});
});

function sendFile(file, el){
	//파일 전송을 위한 폼 데이터 생성
	var data = new FormData();
	data.append("file", file);
	data.append("boardno",$('#boardno').val());
	
	//ajax를 통해 파일 업로드 처리
	$.ajax({	
		data: data
		, dataType: "json"
		, type: "POST"
		, url: "/free/imageUpload"
		, cache: false
		, contentType: false
		, enctype: "multipart/form-data"
		, processData: false
		, success: function(data) {
			// 에디터에 이미지 출력
			$(el).summernote('editor.insertImage', "/freeImage?fileno="+data.fileno);
        	$('#boardno').val(data.boardno);
		}
	});
}
</script>

<style type="text/css">
.freeWrite table {
	border:1px solid #ccc;
}

.freeWrite th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
}

.freeWrite button {
	background:#ccf;
}

.freeWrite {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
.freeWrite #content{
	width:98%;
}
</style>

<div class="freeWrite">

<h1>글쓰기</h1>

<form action="/free/write" method="post" id ="writeForm" enctype="multipart/form-data">	
	<table class="table table-condensed">
	<tr>
		<th>작성자</th>
		<td>${nick }</td>
	</tr>
	<tr>
		<th>태그</th>
		<td colspan="3">
			<select name="tag">
			<c:if test="${nick eq 'admin' }">
				<option value="공지" selected>공지</option>
				<option value="잡담">잡담</option>
			</c:if>
			<c:if test="${nick ne 'admin' }">
				<option value="잡담" selected>잡담</option>
			</c:if>				
				<option value="연애">연애</option>
				<option value="정보공유">정보공유</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" style="width:600px;" name="title" /></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3"> <input type="file" name="file"/></td>
	</tr>
	<tr>
		<th colspan="4">내용</th>
	</tr>
	<tr>
		<td colspan="4">
		<textarea id="summernote" name="content"></textarea>
		</td>
	</tr>
	</table>
	
	<div class="text-center">	
	<button type="submit" id="btnWrite" >작성</button>
	<button type="button" id="btnCancel">취소</button>
	</div>
	
	<input type="hidden" name="boardno" id="boardno" value="1" />
</form>

</div>
