<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<style type="text/css">

table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type11 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    color: #fff;
    background: #2b90d9;
}
table.type11 td {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    background: #dae9f4;
}


.box select {
  background-color: #9baec8;
  color: white;
  padding: 10px;
  width: 120px;
  border: none;
  font-size: 15px;
  box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
  -webkit-appearance: button;
  appearance: button;
  outline: none;
}

.box::before {
  content: "\f13a";
  font-family: FontAwesome;
  position: absolute;
  top: 0;
  right: 0;
  width: 20%;
  height: 100%;
  text-align: center;
  font-size: 20px;
  line-height: 45px;
  color: rgba(255, 255, 255, 0.5);
  background-color: rgba(255, 255, 255, 0.1);
  pointer-events: none;
}

.box:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
  padding: 30px;
}
</style>

<div class="container">

<hr>
<h1><i class="far fa-clock"></i>&nbsp;&nbsp;${nick }님의 시간표 추천&nbsp;&nbsp;<i class="far fa-clock"></i> </h1>
<hr>

<div style="width:50%; float:left;padding:0px;">
<h3><i class="far fa-calendar-check"></i>&nbsp;&nbsp;내 시간표&nbsp;&nbsp;<i class="far fa-calendar-check"></i></h3>
<br>
<table class="type11" style="width:520px;height:350px;">
 <thead>
    <tr class="text-center">
     <th scope="col" style="width:100px">시간</th>
     <th scope="col" style="width:300px">월</th>
     <th scope="col" style="width:300px">화</th>
     <th scope="col" style="width:300px">수</th>
     <th scope="col" style="width:300px">목</th>
     <th scope="col" style="width:300px">금</th>
   </tr>
 </thead>
 <tbody class="text-center">
<%--  <c:forEach items="${myList }" var="mi"> --%>
 <tr><th>09:00-10:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1}">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>10:00-11:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>11:00-12:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>12:00-13:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>13:00-14:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td> </tr>
 <tr><th>14:00-15:00</th>
  <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>15:00-16:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td> 
 </tr>
 <tr><th>16:00-17:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>17:00-18:00</th>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td><c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 </tbody>
</table>
<br>
<form>
<h5>시간 우선순위 선택</h5>
<div class="box">
<select name="timepriority">
<option value="1">오전</option>
<option value="4">오후</option>
</select>
</div>
<br>

<h5>추가할 과목 수</h5>
<div class="box">
<select name="classNum">
<option value="1">1개</option>
<option value="2">2개</option>
<option value="3">3개</option>
<option value="4">4개</option>
<option value="5">5개</option>
</select>
</div>
<br>
<br>

<button style="background:#2b90d9;color: #fff;"class="btn btn-outline-info" id="ajax" onclick="location.href='/timetable/ajax/recommendlist'">추천 시간표 보기</button>
</form>
<br><br>
</div>

<div style="width:50%;float:right;left-padding:100px;">
<c:import url="/timetable/showtable/recommendation/recommendlist"></c:import>
</div>

</div>
<br><br><br><br><br><br><br><br>