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
   
<div>
<h3>추천시간표</h3>
<br>
<table class="table table-bordered" style="width:500px;height:350px;">
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
<%--  <c:forEach items="${recommendList }" var="ri"> --%>
 <tr><th>09:00-10:00</th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>

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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 </tr>
 <tr><th>10:00-11:00</th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th> 
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 </tr>
 <tr><th>11:00-12:00</th>
 <th> 
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
 </th>
 <th>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 3 || ri.end_time eq 3 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 3 || mi.end_time eq 3 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 </tr>
 <tr><th>12:00-13:00</th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 </tr>
 <tr><th>13:00-14:00</th>
 <th>
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
 </th>
 <th>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 5 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 5 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th> </tr>
 <tr><th>14:00-15:00</th>
  <th>
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
 </th>
 <th>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 6 || ri.end_time eq 6 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 6 || mi.end_time eq 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 </tr>
 <tr><th>15:00-16:00</th>
 <th>
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
 </th>
 <th>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 7 || ri.end_time > 6 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 7 || mi.end_time > 6 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th> 
 </tr>
 <tr><th>16:00-17:00</th>
 <th>
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
 </th>
 <th>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 8 || ri.end_time > 7 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 8 || mi.end_time > 7 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>
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
 </th>
 </tr>
 <tr><th>17:00-18:00</th>
 <th>
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
 </th>
 <th>
 <c:forEach items="${recommendList }" var="ri">
 <c:if test="${ri.start_time eq 9 || ri.end_time > 8 }">
 <c:if test="${ri.lecture_day eq '화' }">${ri.lecture_name }</c:if>
 </c:if>
 </c:forEach>
 <c:forEach items="${myList }" var="mi">
 <c:if test="${mi.start_time eq 9 || mi.end_time > 8 }">
 <c:if test="${mi.lecture_day eq '화' }">${mi.lecture_name }</c:if>
 </c:if>
 </c:forEach></th>
 <th>
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
 </th>
 <th>
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
 </th>
 <th>

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
 </th>
 </tr>
 </tbody>
</table>

<br>
<!--  onclick="location.href='/timetable/showtable/recommendation/recommendlist'" -->
<form action="/timetable/showtable/recommendation/recommendlist" method="post" >
<button id="insertMy">내 시간표로 담기</button>
</form>
<br><br>
<button onclick="location.href='/timetable/lecturelist'">강의 목록으로</button>
</div>
<br><br><br><br><br><br><br><br>
