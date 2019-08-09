<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<script type="text/javascript">
$(document).ready(function(){
	$("#insertMy").click(function(){
		alert('내 시간표로 저장되었습니다');
	});
});
</script>
   
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
body {
	background-color: #47b8e017;
}
</style>
<body>
<div>
<h3><i class="far fa-calendar-plus"></i>&nbsp;&nbsp;추천시간표&nbsp;&nbsp;<i class="far fa-calendar-plus"></i></h3>
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
 <tr><th>09:00-10:00</th>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 1}">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1}">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if> 
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
  </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>

 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
  </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
  </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
  </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>10:00-11:00</th>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 2 || ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 2 || ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td> 
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 2 || ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 2 || ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 2 || ri.start_time eq 1 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 2 || mi.start_time eq 1 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>11:00-12:00</th>
 <td> 
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 3 || ri.end_time eq 3 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 3 || ri.end_time eq 3 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 3 || ri.end_time eq 3 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if> 
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 3 || ri.end_time eq 3 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 3 || ri.end_time eq 3 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>12:00-13:00</th>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 4 || ri.end_time eq 4 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 4 || ri.end_time eq 4 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 4 || ri.end_time eq 4 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 4 || ri.end_time eq 4 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 4 || ri.end_time eq 4 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 4 || mi.end_time eq 4 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>13:00-14:00</th>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 5 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 5 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 5 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 5 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 5 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td> </tr>
 <tr><th>14:00-15:00</th>
  <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 6 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 6 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 6 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 6 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 6 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>15:00-16:00</th>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 7 || ri.end_time > 6 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 7 || ri.end_time > 6 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 7 || ri.end_time > 6 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 7 || ri.end_time > 6 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 7 || ri.end_time > 6 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td> 
 </tr>
 <tr><th>16:00-17:00</th>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 8 || ri.end_time > 7 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 8 || ri.end_time > 7 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 8 || ri.end_time > 7 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 8 || ri.end_time > 7 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 8 || ri.end_time > 7 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '금' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 </tr>
 <tr><th>17:00-18:00</th>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 9 || ri.end_time > 8 }">
 <c:if test="${ri.lecture_day eq '월' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '월' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 9 || ri.end_time > 8 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 9 || ri.end_time > 8 }">
 <c:if test="${ri.lecture_day eq '수' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '수' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 9 || ri.end_time > 8 }">
 <c:if test="${ri.lecture_day eq '목' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '목' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 </td>
 <td>

 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 9 || ri.end_time > 8 }">
 <c:if test="${ri.lecture_day eq '금' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
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
<form action="/timetable/showtable/recommendation/recommendlist" method="post" >
<button style="background:#2b90d9;color: #fff;" class="btn btn-outline-info" id="insertMy">내 시간표로 담기</button>
</form>
<br><br>
<button style="background:#2b90d9;color: #fff;" class="btn btn-outline-info" onclick="location.href='/timetable/lecturelist'">강의 목록으로</button>
</div>
</body>
