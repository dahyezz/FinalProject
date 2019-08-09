<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	
	//select태그 동작
	//$('select').selectpicker();
	
	$("#updateForm").submit(function() {
		
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
.ed>h3 {
	font-weight: bold;
	font-size: 30px;
}

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
	width: 100px;
	float: left;
	text-align: center; 
}

.freeUpdate #content{
	width:100%;
}

.freeUpdateTable {
	font-size: 14px;
	line-height: 1.5;
	border: none;
	margin-bottom: 15px;
	font-family: 'NanumSquare', sans-serif;
}
.freeUpdateTable tr th {
	font-weight: 700;
	white-space: nowrap;
	width:100px;
}
.freeUpdateTable tr th, .freeUpdateTable tr td {
	color: #34314c;
	text-align: left;
	padding: 10px 10px 0 0;
	border: none;
}

#btnUpdate {
	background-color: #47b8e0;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff;
  font-size: 13	px;
  padding: 5px 10px;
  border: none;
  text-decoration: none;
  
  margin-left: 7px;
  margin-bottom: 2px;
}

#btnCancel {
background-color: #ff7473;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff ;
  font-size: 13	px;
  padding: 5px 10px;
  border: none;
  text-decoration: none;
}
</style>

<div class="freeUpdate">

<div class="ed board-header padding-horizontal-small@s margin-bottom-small" style="text-align: left;">
	<h3>자유게시판</h3>
	<p>여러분들의 생각을 자유롭게 작성해주세요</p>
</div>

<form action="/free/update?boardno=${board.boardno }" method="post" id="updateForm">

	<input type="hidden" id="boardno" value="${board.boardno }">
	
	<table class="freeUpdateTable">
	<tr>
		<th>글번호</th>
		<td>${board.boardno }</td>
	</tr>
	<tr>
		<th>태그</th>
		<td>
			<select name="tag" class="selectpicker">
			<!-- 관리자 수정일 때 -->
			<c:if test="${nick eq 'admin' }">
				<c:if test="${board.tag eq '공지' }">
					<option value="공지" selected>공지</option>
					<option value="잡담" disabled>잡담</option>
					<option value="연애" disabled>연애</option>
					<option value="정보공유" disabled>정보공유</option>
				</c:if>
				<c:if test="${board.tag eq '잡담' }">
					<option value="공지" disabled>공지</option>
					<option value="잡담" selected>잡담</option>
					<option value="연애">연애</option>
					<option value="정보공유">정보공유</option>
				</c:if>
				<c:if test="${board.tag eq '연애' }">
					<option value="공지" disabled>공지</option>
					<option value="잡담">잡담</option>
					<option value="연애" selected>연애</option>
					<option value="정보공유">정보공유</option>
				</c:if>
				<c:if test="${board.tag eq '정보공유' }">
					<option value="공지" disabled>공지</option>
					<option value="잡담">잡담</option>
					<option value="연애">연애</option>
					<option value="정보공유" selected>정보공유</option>
				</c:if>
			</c:if>
			
			<!-- 일반 회원 수정일 때 -->
			<c:if test="${nick ne 'admin' }">
				<c:if test="${board.tag eq '잡담' }">
					<option value="잡담" selected>잡담</option>
					<option value="연애">연애</option>
					<option value="정보공유">정보공유</option>
				</c:if>
				<c:if test="${board.tag eq '연애' }">
					<option value="잡담">잡담</option>
					<option value="연애" selected>연애</option>
					<option value="정보공유">정보공유</option>
				</c:if>
				<c:if test="${board.tag eq '정보공유' }">
					<option value="잡담">잡담</option>
					<option value="연애">연애</option>
					<option value="정보공유" selected>정보공유</option>
				</c:if>
			</c:if>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" style="width:800px;" value="${board.title }"/></td>
	</tr>
	<tr>
		<th>내용</th>
	</tr>
	</table>
	
	<textarea id="summernote" name="content">${board.content }</textarea>
	
	<div class="text-center">	
	<button id="btnUpdate">수정 적용</button>
	<button type="button" id="btnCancel" onclick="history.go(-1)">취소</button>
	</div>
</form>

</div>

