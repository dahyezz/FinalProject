<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도보기</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChZNHc4ZUNUcN_AN7p53YMNMhVoEw2sTQ"></script>

<script type="text/javascript">
$(document).ready(function() {

	var myLatlng = new google.maps.LatLng(37.557015, 127.076571); // 위치값 위도 경도
	var Y_point			= 37.557015;		// Y 좌표
	var X_point			= 127.076571;		// X 좌표
	var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle		= "상미수산";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

	// 말풍선 내용
	var contentString	= '<div>' +	'<h5>상미수산</h5>'+'</div>';
	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
						zoom: zoomLevel,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
	var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
	});
	var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
			);
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
});

</script>

<style type="text/css">
#map_ma {
	width: 500px;
	height: 500px;
/* 	right: 10px; */
/* 	display: none; */
}
</style>
</head>
<body>

<div id="map_ma"></div>


</body>
</html>