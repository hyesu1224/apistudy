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
   var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /*URL*/
   var param = 'serviceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=100&listYN=Y&arrange=A&keyword='+document.getElementById('areaC').value+'&areaCode=1&sigunguCode=1';
   sendRequest(url, param, showResult, 'GET');
}
function showResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var doc = XHR.responseXML;
         console.log(doc);
         var items = doc.getElementsByTagName('item');
         var msg ='';
         var table = document.getElementById('setTable');
         for(var i=0;i<items.length;i++){
            var item = items[i];
            var count=i+1;
            var title = item.getElementsByTagName('title').item(0).firstChild.nodeValue;
            var addr = item.getElementsByTagName('addr1').item(0).firstChild.nodeValue;
            var image;
            if(item.getElementsByTagName('firstimage').length==0){
               image='img/noimage.png';
            }else{
               image=item.getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
            }
            var trNode = document.createElement('tr');
            var tdNode = document.createElement('td');
            var tdTextNode = document.createTextNode(count+'번 결과');
            var tdNode2 = document.createElement('td');
            var tdTextNode2 = document.createTextNode(title);
            var tdNode3 = document.createElement('td');
            var tdTextNode3 = document.createTextNode(addr);
            var tdNode4 = document.createElement('td');
            var imgNode = document.createElement('img');
            imgNode.setAttribute('src', image);
            table.appendChild(trNode);
            trNode.appendChild(tdNode);
            trNode.appendChild(tdNode2);
            trNode.appendChild(tdNode3);
            trNode.appendChild(tdNode4);
            tdNode.appendChild(tdTextNode);
            tdNode2.appendChild(tdTextNode2);
            tdNode3.appendChild(tdTextNode3);
            tdNode4.appendChild(imgNode);
         }
         console.log(msg);
      }
   }
}
</script>
</head>
<body>
<input type="text" name="areaCode" id="areaC">
<input type="button" value="정보 확인하기" onclick="show()">
<table border="1" id="setTable">
   
</table>
</body>
</html>