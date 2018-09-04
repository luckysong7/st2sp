function getXMLHttpRequest(){
	
	if(window.ActiveXObject){//IE인 경우
		try {
			// 5.0 이후
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			// 5.0 이전
			return new ActiveXObject("Microsoft");
			
		}
	}else if(window.XMLHttpRequest){
	 	// IE 가 아닌경우 
		return new XMLHttpRequest();
	}
	
}

// Ajax를 요청

var httpRequest = null;

function sendRequest(url,params,callback,method){
	
	httpRequest = getXMLHttpRequest();
	
	//method 처리 
	var httpMethod = method?method:"GET";
	
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	
	//data 처리 
	var httpParams = (params == null || params == "") ? null : params;
	
	//url 처리
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl += "?" + httpParams;
	}
	
	
	httpRequest.open(httpMethod,httpUrl, true);
	httpRequest.setRequestHeader("Content-type","application/x-www-form-urlencode"); // 정석 
	
	httpRequest.onreadystatechange = callback;
	
	httpRequest.send(httpMethod == "POST" ? httpParams: null);
	
	
}