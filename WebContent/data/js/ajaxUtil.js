
var xmlHttp;   

function createXMLHttpRequest() {
	
    var xmlReq = false;

    if (window.XMLHttpRequest) {        	
    	
    	//IE가 아니면(IE11은 버전을 안보여줌)
		//IE11 부터는 이코딩으로 객체생성
    	xmlReq = new XMLHttpRequest();
        
    } else if (window.ActiveXObject) {
		try {
			// IE5.0 이후버전
			xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				// IE5.0 이전버전
				xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				// Unable to create an XMLHttpRequest with ActiveX
			}
		}
	}

	return xmlReq;
}
