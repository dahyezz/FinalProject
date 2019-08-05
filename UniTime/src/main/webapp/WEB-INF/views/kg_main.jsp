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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
  background-color: #ffc952;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #34314c;
  font-size: 13	px;
  padding: 5px 10px;
  margin: 5px;
  float: right;
  border: none;
  text-decoration: none;
}
#btnSearch {
  background-color: #ffc952;
  -webkit-border-radius: 5;
  -moz-border-radius: 5;
  border-radius: 5px;
  color: #34314c;
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
	background-color: #ffc952;
	border-color: #ffc952;
}
.pagination>li>a, .pagination>li>span {
	color: #34314c;
	border: none;
}

.list table, th {
	text-align: center;
}

</style>


<div style="border: 1px solid gold; float: right; width: 35%;">
<h4>중고장터</h4>
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr> 
		<th style="width: 8%;">번호</th>
		<th style="width: 10%;">테그</th>
		<th style="width: 37%;">제목</th>
		<th style="width: 25%;">품목</th>
		<th style="width: 20%;">작성자</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${usedboard}" var="i">
	<tr>
		<td>${i.boardno }<br><br></td>
		<td>${i.tag }</td>
		<td><a href="/used/view?boardno=${i.boardno }">${i.title }</a></td>
		<td>${i.product }</td>
		<td>${i.writer }</td>
	</tr>
</c:forEach>
</tbody>
</table>
<a href="/used/list">더보기</a>

</div>


<div style="border: 1px solid gold; float: left; width: 63%;">

<h4>공지사항</h4>
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">번호</th>
		<th style="width: 10%;">테그</th>
		<th style="width: 30%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 15%;">조회수</th>
		<th style="width: 15%;">날짜</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${notice}" var="i">
	<tr>
		<td>${i.boardno }</td>
		<td>${i.tag }</td>
		<td><a href="/free/view?boardno=${i.boardno }">${i.title }</a></td>
		<td>${i.writer }</td>
		<td>${i.hit }</td>
		<td><fmt:formatDate value="${i.writtendate }" pattern="yy-MM-dd" /></td>
	</tr>
</c:forEach>
</tbody>
</table>
<a href="/free/list">더보기</a>
</div>

<hr>



<div style="border: 1px solid gold; float: left; width: 63%;">
<h4>자유게시판</h4>
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">번호</th>
		<th style="width: 10%;">테그</th>
		<th style="width: 30%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 15%;">조회수</th>
		<th style="width: 15%;">날짜</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${freeboard}" var="i">
	<tr>
		<td>${i.boardno }</td>
		<td>${i.tag }</td>
		<td><a href="/free/view?boardno=${i.boardno }">${i.title }</a></td>
		<td>${i.writer }</td>
		<td>${i.hit }</td>
		<td><fmt:formatDate value="${i.writtendate }" pattern="yy-MM-dd" /></td>
	</tr>
</c:forEach>
</tbody>
</table>
<a href="/free/list">더보기</a>
</div>

<hr>




<div class="card-columns">
<table>
<tr>

<c:forEach items="${tastyboard }" var="i">
	 <td>
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
			<p class="cmt"><img src="/image/comment.PNG" style="width:20px; height: 20px;"> ${i.commentCnt }</p>
			
		</div>
	</div>
	</td>
</c:forEach>
</tr>
</table>
<a href="/tasty/list">더보기</a>
</div>






<br><br><br><br><br><br><br>
