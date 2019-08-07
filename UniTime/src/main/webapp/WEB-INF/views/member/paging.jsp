<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
var paging;
var nickname = $('#nickname').val();

function page(paging, board) {
	
// 	console.log(board);
	
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
		var curPage = $(this).val();
		
		if(board == 'tasty')	getTastyPage(curPage);
		if(board == 'free')		getFreePage(curPage);
		if(board == 'lecture')	getLecturePage(curPage);
		if(board == 'used')		getUsedPage(curPage);
		
	});
	
	$('.goNextPage').click(function() {
		var curPage = Number(paging.endPage)+1;

		if(board == 'tasty')	getTastyPage(curPage);
		if(board == 'free')		getFreePage(curPage);
		if(board == 'lecture')	getLecturePage(curPage);
		if(board == 'used')		getUsedPage(curPage);
	});
	
	$('.goBackPage').click(function() {
		var curPage = Number(paging.startPage)-1;

		if(board == 'tasty')	getTastyPage(curPage);
		if(board == 'free')		getFreePage(curPage);
		if(board == 'lecture')	getLecturePage(curPage);
		if(board == 'used')		getUsedPage(curPage);
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
			var results = data.tastyList;
			var str = '<tr>';
			$.each(results, function(i){
				var writtendate = dateFormat(results[i].writtendate);
				
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + "></td>";
				str += "<td>"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].tag + "</td>";
				str += "<td style='width: 3%'><a href='/tasty/view?boardno=" + results[i].boardno + "'>" + results[i].storeName+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += "<td style='width: 15%'>"+writtendate+"</td>";
				str += " </tr>";
			});  
			$('#tastyResult').empty();
			$('#tastyResult').append(str);	
			
			page(paging,'tasty');
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
				var writtendate = dateFormat(results[i].writtendate);
				
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + "></td>";
				str += "<td>"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].tag + "</td>";
				str += "<td style='width: 3%'><a href='/free/view?boardno=" + results[i].boardno + "'>" + results[i].title+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += "<td style='width: 15%'>"+writtendate+"</td>";
				str += "</tr>";
			});  
 
			$('#freeResult').empty();
			$('#freeResult').append(str);	
			
			page(paging,'free');
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
			var results = data.lectureList;
			var str = '<tr>';
			$.each(results, function(i){
				var writtendate = dateFormat(results[i].writtendate);
				
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + "></td>";
				str += "<td>"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].lecture_section + "</td>";
				str += "<td style='width: 3%'><a href='/lecture/view?boardno=" + results[i].boardno + "'>" + results[i].lecture_name+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += "<td style='width: 15%'>"+writtendate+"</td>";
				str += " </tr>";
			});  
			$('#lectureResult').empty();
			$('#lectureResult').append(str);	
			
			page(paging,'lecture');
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
				var writtendate = dateFormat(results[i].writtendate);
				
				str += "<td><input type='checkbox' name='checkRow' value = " + results[i].boardno + "></td>";
				str += "<td>"+results[i].boardno+"</td>";
				str += "<td style='width: 3%'>" + results[i].tag + "</td>";
				str += "<td style='width: 3%'><a href='/used/view?boardno=" + results[i].boardno + "'>" + results[i].product+"</a></td>";
				str += "<td style='width: 3%'>"+results[i].price+"</td>";
				str += "<td style='width: 3%'>"+results[i].hit+"</td>";
				str += "<td style='width: 15%'>"+writtendate+"</td>";
				str += " </tr>";
			});  
			$('#usedResult').empty();
			$('#usedResult').append(str);	
			
			page(paging,'used');
		}
		, error: function() {
			console.log("error")
		}
	});
}

function dateFormat(writtendate){
	
	var dt = new Date(writtendate);

	var yyyy = dt.getFullYear().toString();
    var mm = (dt.getMonth() + 1).toString();
    var dd = dt.getDate().toString();
    
    writtendate = yyyy+'.'+mm+'.'+dd;

	return writtendate;
}
</script>


<ul class="pagination pagination-sm">
</ul>
