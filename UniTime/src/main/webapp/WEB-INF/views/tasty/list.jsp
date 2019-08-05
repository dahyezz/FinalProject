<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/perfect-scrollbar.min.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&amp;subset=devanagari,latin-ext" rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">

<!-- select태그 부트스트랩 적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.10/dist/js/bootstrap-select.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script type="text/javascript">
$(document).ready(function() {
	
	$('#searchType').selectpicker();
	
	$('#btnWrite').click(function() {
		$(location).attr("href","/tasty/write");
	})
	
	//체크 삭제 버튼 동작
	$("#btnDelete").click(function() {
		
		// 선택된 체크 박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
		// 체크된 대상들을 map으로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var names = map.get().join(",");
		
// 		console.log($checkboxes)
// 		console.log("map : " +map);
// 		console.log("names : " + names);

		//전송 폼
		var $form = $("<form>")
				.attr("action","/tasty/listDelete")
				.attr("method", "POST")
				.append(
					$("<input>")
							.attr("type","hidden")
							.attr("name", "names")
							.attr("value", names)
				);
		$(document.body).append($form);
		$form.submit();
				
	});
	
	//검색 버튼 동작
	$('#btnSearch').click(function () {
		
		var search = document.getElementById('search').value;
		console.log(search);
		
	});
	
	$('#searchType').on('change', function() {
		
		var selected = $(this).val();
		console.log(selected);
		
		var text = 	document.getElementById('keyword');
		var select = document.getElementById('tagSelected');

		if(selected == 'tag'){
			
			text.setAttribute('name', 'except');
			text.style.display="none";
			
// 			elem.parentNode.removeChild(elem);
			select.setAttribute('name', 'keyword');
// 			select.className='selectpicker';
// 			select.setAttribute('class','selectpicker');
			select.style.display='inline';
			
			
		}
		
		if(selected != 'tag'){
			
			if(text.style.display == 'none'){
				
				text.setAttribute('name', 'keyword');
				text.style.display="inline"
				
				select.setAttribute('name', 'except');
				select.style.display="none"
			}
			
		} 
	})
	
});

// 전체 체크/체크해제 되는 동작
function checkAll() {
	
	//checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");
	
	// checkAll 체크 상태 
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ){
		$checkboxes.each(function() {
			this.checked = true;
		});
	} else {
		$checkboxes.each(function() {
			this.checked = false;
		});
	}
}

</script>

<style type="text/css">
.ed>h3 {
	font-weight: bold;
	font-size: 30px;
}
.ed>span {
	font-size: 20px;
}
.tasty .pagination>li:first-child {
	border-radius: 500px 0 0 500px;
}
.tasty .pagination>li {
	display: inline-block;
	margin: 0;
	background-color: #f8f8f8;
}

tasty .pagination {
	border-radius: 500px !important;
}
.pagination-sm>li>a, .pagination-sm>li>span{
	border-radius: 15px;
}

#btnWrite {
  background-color: #47b8e0;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff;
  font-size: 13	px;
  padding: 5px 10px;
  margin: 5px;
  float: right;
  border: none;
  text-decoration: none;
}
#btnSearch {
  background-color: #47b8e0;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #fff;
  font-size: 13	px;
  padding: 7px 10px;
/*   margin: 5px; */
  border: none;
  text-decoration: none;
}


.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn){
	width: 80px;
}
.bootstrap-select>.dropdown-toggle {
	width: 80px !important;
}
.bootstrap-select .dropdown-menu {
	min-width: 80px !important;
}
.form-control {
	display: inline;
	width: 200px;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
	color: #34314c;
	background-color: #47b8e0;
	border-color: #47b8e0;
}
.pagination-sm>li:first-child>a, .pagination-sm>li:first-child>span {
	border-radius: 15px;
/* 	background-color: #47b8e017; */
}
.pagination-sm>li:last-child>a, .pagination-sm>li:last-child>span {
	border-radius: 15px;
}
.pagination>li>a, .pagination>li>span {
	color: #34314c;
	border: none;
}

</style>

<div class="ed board-header padding-horizontal-small@s margin-bottom-small" style="text-align: left;">
	<h3>테이스티로드</h3>
	<span>숨겨진 맛집을 찾아서!</span>
	<button id="btnWrite">글쓰기</button>
</div>

<div class="clearfix"></div>

<div class="card-columns">

<c:forEach items="${list }" var="i">
	 
<!-- 	<div class="card-wrap"> -->
<%-- 		<a class="overlay overlay-fill overlay-top" href="/tasty/view?boardno=${i.boardno }" ></a> --%>
	<div class="card" onclick="location.href='/tasty/view?boardno=${i.boardno}'">

		<div class="card-image">
		<c:if test="${i.fileno eq 0 }">
			<img id="thumbnail" class="card-image-top img-fluid" src="/image/default.jpg" alt="Card image cap">	
		</c:if>

		<c:if test="${i.fileno ne 0 }">
			<img id="thumbnail" class="card-image-top img-fluid" alt="Card image cap" src="/tastyImage?fileno=${i.fileno }">
		</c:if>
		</div>
		
		<div class="card-block">
			
			<h2 style="color:gold;" class="text-bold text-row-medium margin-bottom-small">
				<c:if test="${i.score eq 1 }">★</c:if>
				<c:if test="${i.score eq 2 }">★★</c:if>
				<c:if test="${i.score eq 3 }">★★★</c:if>
				<c:if test="${i.score eq 4 }">★★★★</c:if>
				<c:if test="${i.score eq 5 }">★★★★★</c:if>
			</h2>
			
			<h4 class="card-title">${i.storeName }</h4>
			<span class="text-small" style="color:#ff7473;">
				<center>${i.loc }</center>
			</span>
			<span class="text-small"><center>${i.writer }</center>
			</span>
			<p class="cmt"><img id="cmt" src="/image/comment.PNG"> ${i.commentCnt }</p>
			
		</div>
	</div>
<!-- 	</div> -->
	
</c:forEach>
</div>

<c:if test="${nick eq 'admin' }">
<button id="btnDelete" class="btn btn-warning pull-left">삭제</button>
<div class="clearfix"></div>
</c:if>

<!-- <div class="content text-center pagination-container"> -->
<div class="pagination-container padding-horizontal-small@s">
	<ul class="tasty pagination pagination-sm">
		<!-- 이전 페이지 -->
		<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
		<c:if test="${paging.curPage eq 1 }">
		<li class="disabled prev">
			<span>&lt;</span>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne 1 }">
			<c:if test="${paging.curPage >= 1 && paging.curPage <=10 }">
			<li>
				<a href="/tasty/list?curPage=${paging.curPage-1 }"><span>&lt;</span></a>
	   	 	</li>
			</c:if>
			<c:if test="${paging.curPage > 10 }">
			<li>
				<a href="/tasty/list?curPage=${paging.curPage-10 }"><span>&lt;</span></a>
	   	 	</li>
			</c:if>
	    </c:if>

		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }"
	     var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
			<c:if test="${paging.curPage eq i}">
			<li class="active">
				<c:if test="${searchType eq null and keyword eq null }">
					<a href="/tasty/list?curPage=${i }">${i }</a>
				</c:if>
				<c:if test="${searchType ne null and keyword ne null }">
					<a href="/tasty/list?curPage=${i }&searchType=${searchType }&keyword=${keyword }">${i }</a>
				</c:if>
			</li>
			</c:if>
		
			<c:if test="${paging.curPage ne i}">
			<li>
				<c:if test="${searchType eq null and keyword eq null }">
					<a href="/tasty/list?curPage=${i }">${i }</a>
				</c:if>
				<c:if test="${searchType ne null and keyword ne null }">
					<a href="/tasty/list?curPage=${i }&searchType=${searchType }&keyword=${keyword }">${i }</a>
				</c:if>
			</li>
			</c:if>
			
	    </c:forEach>
		
		<!-- 다음 페이지 -->
		<c:if test="${paging.curPage eq paging.totalPage }">
		<li class="disabled">
			<span>&gt;</span>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne paging.totalPage }">
		<li>
			<a href="/tasty/list?curPage=${paging.curPage+10 }&searchType=${searchType }&keyword=${keyword }">
			<span>&gt;</span>
		</a>
		</li>
		</c:if>
	</ul>
</div>



<div class="tastySearch" id="tastySearch">
<form action="/tasty/list" method="get">
	<select name="searchType" id="searchType" class="selectpicker" style="vertical-align: middle;">
		<option value="total" selected>전체</option>
		<option value="tag">종류</option>
		<option value="loc">위치</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>
	
	<select name="except" id="tagSelected" style="display:none; vertical-align: middle;" >
		<option value="술">술</option>
		<option value="밥">밥</option>
		<option value="카페">카페</option>
	</select>
	
	<input type="text" name="keyword" id="keyword" class="form-control" style="vertical-align: middle;"/>
	<button id="btnSearch">검색</button>
</form>
</div>


<div class="clearfix"></div>