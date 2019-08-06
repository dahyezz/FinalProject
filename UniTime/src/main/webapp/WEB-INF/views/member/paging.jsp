<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
var paging;
var nickname = $('#nickname').val();

function page() {
	
	$('.pagination').empty();

	if(paging.block != 1){            //첫번째 블럭이 아니면
    	$(".pagination").append("<li class=\"goBackPage\"><a><</a></li>");        //뒤로가기버튼 활성화
    }else{
    	$(".pagination").append("<li class=\"disabled\"><a><</a></li>");        //뒤로가기버튼 비활성화
    }


    for(var i=paging.startPage ; i<=paging.endPage ; i++){        //시작페이지부터 종료페이지까지 반복문
    	$(".pagination").append("<li class=\"goPage\" value=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화
    	//     	if(paging.curPage == i){                            //현재페이지가 반복중인 페이지와 같다면
//             	$(".pagination").append("<li class=\"disabled active\"><a>"+i+"</a></li>");    //버튼 비활성화
//     	}else{
//     		$(".pagination").append("<li class=\"goPage\" value=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화
//     	}
    }

    if(paging.curPage < paging.totalPage){            //전체페이지블럭수가 현재블럭수보다 작을때
    	$(".pagination").append("<li class=\"goNextPage\"><a>></a></li>");         //다음페이지버튼 활성화
    }else{
    	$(".pagination").append("<li class=\"disabled\"><a>></a></li>");        //다음페이지버튼 비활성화
    }

	$('.goPage').click(function(){
// 		console.log("clicked")
		var curPage = $(this).val();
// 		console.log(curPage);
		getTastyPage(curPage);
	});
	
	$('.goNextPage').click(function() {
		var curPage = Number(paging.endPage)+1;
// 		console.log(curPage);
		getTastyPage(curPage);
	});
	
	$('.goBackPage').click(function() {
		var curPage = Number(paging.startPage)-1;
// 		console.log(curPage);
		getTastyPage(curPage);
	});
}

function getTastyPage(curPage) {
		
	$.ajax({
		type: "get"
		, url: "/member/tastyList"
		, dataType: "json"
		, data: {
			"nickname":nickname,
			"curPage": curPage
		}
		, success: function(data){
			paging = data.paging;
// 			console.log(paging);
			var results = data.tastyList;
			var str = '<tr>';
			$.each(results, function(i){
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + ">"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].tag + "</td>";
				str += "<td style='width: 3%'><a href='/tasty/view?boardno=" + results[i].boardno + "'>" + results[i].storeName+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += " </tr>";
			});  
			$('#tastyResult').empty();
			$('#tastyResult').append(str);	
			
			page(paging);
		}
		, error: function() {
			console.log("error")
		}
	});
}

function getFreePage(curPage) {
	

	$.ajax({
		type: "get"
		, url: "/member/freeList"
		, dataType: "json"
		, data: {
			"nickname":nickname,
			"curPage": curPage
		}
		, success: function(data){
			paging = data.paging;
			var results = data.freeList;
			var str = '<tr>';
			$.each(results, function(i){
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + ">"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].tag + "</td>";
				str += "<td style='width: 3%'><a href='/tasty/view?boardno=" + results[i].boardno + "'>" + results[i].title+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += " </tr>";
			});  
			$('#freeResult').empty();
			$('#freeResult').append(str);	
			
			page(paging);
		}
		, error: function() {
			console.log("error")
		}
	});
}

function getLecturePage(curPage) {
	

	$.ajax({
		type: "get"
		, url: "/member/lectureList"
		, dataType: "json"
		, data: {
			"nickname":nickname,
			"curPage": curPage
		}
		, success: function(data){
			paging = data.paging;
			console.log(data.lectureList);
			var results = data.lectureList;
			var str = '<tr>';
			$.each(results, function(i){
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + ">"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].lecture_section + "</td>";
				str += "<td style='width: 3%'><a href='/tasty/view?boardno=" + results[i].boardno + "'>" + results[i].lecture_name+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += " </tr>";
			});  
			$('#lectureResult').empty();
			$('#lectureResult').append(str);	
			
			page(paging);
		}
		, error: function() {
			console.log("error")
		}
	});
}

function getUsedPage(curPage) {
	

	$.ajax({
		type: "get"
		, url: "/member/usedList"
		, dataType: "json"
		, data: {
			"nickname":nickname,
			"curPage": curPage
		}
		, success: function(data){
			paging = data.paging;
			var results = data.usedList;
			var str = '<tr>';
			$.each(results, function(i){
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + ">"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].tag + "</td>";
				str += "<td style='width: 3%'><a href='/tasty/view?boardno=" + results[i].boardno + "'>" + results[i].product+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += " </tr>";
			});  
			$('#usedResult').empty();
			$('#usedResult').append(str);	
			
			page(paging);
		}
		, error: function() {
			console.log("error")
		}
	});
}
</script>

<div class="text-center">
	<ul class="pagination pagination-sm">
	</ul>
</div>
