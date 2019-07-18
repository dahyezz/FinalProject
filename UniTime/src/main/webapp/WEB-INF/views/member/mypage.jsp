<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.menubar{

margin-left: 0px;
margin-bottom: 30px;
width: 1100px;
height: 200px;

background:#E6E6E6;

}

.center{
width:250px;
margin: 0 auto;

} 

</style>

<br>
<br>
<br>

<nav>

<div class="col-4">
<div class="menubar" >
<form>

<div class="center">
<br>
<div>
${nickname }님<br>
학번 : ${hakbun }
</div>
</div>
<br>
<div class="center">
<button type="button" class="btn btn-info" onclick="location.href='/member/modify'">정보수정</button>
<button type="button" class="btn btn-info" onclick="location.href='/member/logout'">로그아웃</button>
</div>
</form>
<ul class="nav flex-column center">
  <li class="nav-item">
    <a style="color:#08298A;" class="nav-link" href="/mypage/user/written">내가 작성한 글</a>
  </li>
</ul>
<div class="center">
<br>
</div>
</div>
</div>

</nav>