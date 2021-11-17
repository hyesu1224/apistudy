<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>맵 실험</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function show(){
   var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay'; /*URL*/
   var param = 'serviceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&numOfRows=10000&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=B&listYN=Y&areaCode='+document.getElementById('areaC').value+'&sigunguCode='+document.getElementById('areaC2').value;
   sendRequest(url, param, showResult, 'GET');
}
function showResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var doc = XHR.responseXML;
         console.log(doc);
         var items = doc.getElementsByTagName('item');
         var msg ='';
         for(var i=0;i<items.length;i++){
            var item = items[i];
            var count=i+1;
            var title = item.getElementsByTagName('title').item(0).firstChild.nodeValue;
            var addr = item.getElementsByTagName('addr1').item(0).firstChild.nodeValue;
            msg+=count+'번 숙박 : '+title+' 주소 : '+addr+'\n';
         }
         console.log(msg);
      }
   }
}
</script>
</head>
<body>
<input type="text" name="areaCode" id="areaC">
<input type="text" name="areaCode2" id="areaC2">
<input type="button" value="정보 확인하기" onclick="show()">
<table border="1" id="setTable">
   
</table>
</body>
</html>