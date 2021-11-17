<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=454cf995c30c224dddca3632f6bb1f65&libraries=LIBRARY,services,clusterer,drawing"></script>
<script>

</script>
<div id="map" style="width:500px;height:500px;"></div>
<div id="clickLatlng"></div>
<p>
    <button onclick="hideMarkers()">마커 감추기</button>
    <button onclick="showMarkers()">마커 보이기</button>
    <input type="button" value="경규오빠" onclick="location.href='kkk.do'">
    <input type="button" value="호텔 정보" onclick="location.href='hotel.do'">
    <input type="button" value="키워드 검색" onclick="location.href='keyword.do'">
</p> 
<div>
	<ul>
		<li>33.46741435358188,126.5185556108704<input type="button" value="+" onclick="show()"></li>
	</ul>
</div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];

//선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다.
var linePath = [];

//선을 넣을 배열(맞아?)
var lines = [];

// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    // 클릭한 위치에 마커를 표시합니다 
    addMarker(mouseEvent.latLng); 
    
    //클릭한 위치에 선을 표시한다네요
    addLine(mouseEvent.latLng);
    
    //클릭한 위도, 경도 정보를 가져옵니다.
    var latlng = mouseEvent.latLng;
    
    var message = '위도 ' + latlng.getLat() + '경도 ' + latlng.getLng();
    var divNode = document.createElement('div');
    
    var spanTextNode = document.createTextNode(message);
    divNode.appendChild(spanTextNode);
    
    var resultNode = document.getElementById('clickLatlng'); 
    resultNode.appendChild(divNode);
});


// 마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: position
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
}

//선을 생성하고 지도위에 표시하는 함수(맞아?)
function addLine(position) {
	
	linePath.push(position);
	
	
	//지도에 표시할 선을 생성합니다.
	var polyline = new kakao.maps.Polyline({
		path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	
	//지도에 선을 표시합니다.
	polyline.setMap(map);
	
	//생성된 선을 일단 냅다 넣어
	lines.push(polyline);
	
}

// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    } 
    for (var i = 0; i<lines.length; i++){
    	lines[i].setMap(map);
    }
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map)    
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkers(null);    
}


</script>
</body>
</html>