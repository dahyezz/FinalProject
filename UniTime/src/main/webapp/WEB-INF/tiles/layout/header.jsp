<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.header_wrap {
	background-color: #ffc952;
}
.header a{
	font-size: 30px;
	text-decoration: none;
	
	color: #34314c;
}
.nav-justified>li>a {
	color: #34314c;
}
.header {
	text-align: center;
}

.loginstatus {
	text-align: right;
}
.loginstatus a{
	font-size: 15px;
	color: #34314c;
	text-decoration: none;
}
.nav>li>a:focus, .nav>li>a:hover { 
	background-color: #ffc952;
}

</style>

<div class="header_wrap">
<div class="loginstatus">
	<c:if test="${login }">
		<a href="/member/logout">로그아웃</a>
		<c:if test="${nick eq 'admin' }">
			<a href="/main">사이트</a>
		</c:if>
		<c:if test="${nick ne 'admin' }">
			<a href="/member/mypage">마이페이지</a>
		</c:if>
	</c:if>
	<c:if test="${empty login }">
		<a href="/member/login">로그인</a>
		<a href="/member/join">회원가입</a>
	</c:if>
</div>

<div class="header">
	<a href="/kg_main">슬기로운 대학생활</a>
	<p>KH대학교 커뮤니티</p>
</div>

<div class="container-fluid">
	<ul class="nav nav-pills nav-justified">
		<c:if test="${nick ne 'admin' }">
			<li><a href="/timetable/lecturelist">시간표 추천</a></li>
			<li><a href="/free/list">자유게시판</a></li>
			<li><a href="/lecture/list">강의평가</a></li>
			<li><a href="/used/list">중고장터</a></li>
			<li><a href="/tasty/list">테이스티로드</a></li>
		</c:if>
		<c:if test="${nick eq 'admin'}">
			<li><a href="/admin/site">사이트관리</a></li>
			<li><a href="/admin/board">게시판관리</a>
				<ul>
					<li><a href="/free/list" >자유게시판</a></li>
					<li><a href="/lecture/list">강의평가</a></li>
					<li><a href="/used/list">중고장터</a></li>
					<li><a href="/tasty/list">테이스티로드</a></li>
				</ul>
			</li>
			<li><a href="/admin/member">회원리스트</a></li>
			<li><a href="/admin/black">블랙리스트</a></li>
		</c:if>
	</ul>
</div>

</div>