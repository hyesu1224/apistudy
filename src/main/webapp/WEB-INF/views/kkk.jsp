<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div id="map" style="width:7580%0px;height:100vh;"></div>

	<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=b8cc8a9140ffda30a4356a4ac796f64b&libraries=services,clusterer,drawing"></script>

    <script>
    var xhr = new XMLHttpRequest();
    var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList'; /*URL*/
    var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'0xlCgShade%2B08IbCA2oVyMO4MRgKm%2BTYolGYeceK2%2BtKWkbGcn6tiSzZqEaMaDsHNeApk5JtnVbOD25%2FFZwcmw%3D%3D'; /*Service Key*/
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('900'); /**/
    queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
    queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
    queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /**/
    queryParams += '&' + encodeURIComponent('cat1') + '=' + encodeURIComponent(''); /**/
    queryParams += '&' + encodeURIComponent('contentTypeId') + '=' + encodeURIComponent('12'); /**/
    queryParams += '&' + encodeURIComponent('areaCode') + '=' + encodeURIComponent(''); /**/
    queryParams += '&' + encodeURIComponent('sigunguCode') + '=' + encodeURIComponent(''); /**/
    queryParams += '&' + encodeURIComponent('cat2') + '=' + encodeURIComponent(''); /**/
    queryParams += '&' + encodeURIComponent('cat3') + '=' + encodeURIComponent(''); /**/
    queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /**/
    queryParams += '&' + encodeURIComponent('modifiedtime') + '=' + encodeURIComponent(''); /**/
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
        	var doc=this.responseXML;
        	
        	var items=doc.getElementsByTagName('item');
        	
    		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56728, 126.98003), // 지도의 중심좌표
		        level: 11, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

			// 지도를 생성한다 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
        	
            // 마커 클러스터러를 생성합니다 
            var clusterer = new kakao.maps.MarkerClusterer({
                map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
                averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
                minLevel: 5 // 클러스터 할 최소 지도 레벨 
            });
			
        	var msg='';
        	
            var markers = [];
        	
        	for(var i=0;i<items.length;i++){
        		
				var item=items[i];
				var mapx=item.getElementsByTagName('mapx')[0].firstChild.nodeValue;
				var mapy=item.getElementsByTagName('mapy')[0].firstChild.nodeValue;
				var title=item.getElementsByTagName('title')[0].lastChild.nodeValue; 
        		var addr1=item.getElementsByTagName('addr1')[0].lastChild.nodeValue; 
				
				
                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(mapy, mapx)
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: title +'<br>'+ addr1
                });
                
                markers.push(marker);
                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        	}
    		
            // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
            function makeOverListener(map, marker, infowindow) {
                return function() {
                    infowindow.open(map, marker);
                };
            }

            // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
            function makeOutListener(infowindow) {
                return function() {
                    infowindow.close();
                };
            }

            // 클러스터러에 마커들을 추가합니다
            clusterer.addMarkers(markers);
        }
    };
    
    xhr.send('');

    </script>
</body>
</html>