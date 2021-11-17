var XHR=null;

function getXHR(){ //브라우저에 따라 어떤 객체를 생성해야하는지 판단
	if(window.ActiveXObject){
		return new ActiveXObject('Msxml2.XMLHTTP');
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}
}

function sendRequest(url, param, callback, method){
	XHR = getXHR();
	
	var newMethod = method?method:'GET';
	if(newMethod!='GET'&&newMethod!='POST'){
		newMethod = 'GET';
	}
	
	var newUrl = url;
	var newParam = (param==null||param=='')?null:param;
	
	if(newMethod=='GET'&&newParam!=null){
		newUrl=newUrl+'?'+newParam;
	}
	
	XHR.onreadystatechange = callback;
	XHR.open(newMethod,newUrl,true);
	XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR.send(newMethod=='POST'?newParam:null);	
}