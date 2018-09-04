<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=cp%>/data/js/ajaxUtil.js"></script>
<script type="text/javascript">

	function sendIt(){
		
		//XmlHttpRequest 객체 생성
		xmlHttp = createXMLHttpRequest();
		
		var query = "";
		var su1 = document.getElementById("su1").value;
		var su2 = document.getElementById("su2").value;
		var oper = document.getElementById("oper").value;
		
		//Get방식으로 데이터 전송
		query = "test1_ok.jsp?su1="+su1+"&su2="+su2+"&oper="+oper;
		
		xmlHttp.onreadystatechange = callback; // 사용자 정의 함수 (callback) 
		// 작업을 수행하고 다시 돌아왔을때 수행한느 함수를 callback 함수라고 함
		xmlHttp.open("GET",query,true);
		//true 속성은 비동기 방식으로 데이터를 전송
		xmlHttp.send("null");
		//post 은 방식이면 send 안에 매개변수로 값을 넣어주면 된다 !!
		
		
		
	}
	
	// test1_ok 에 갔다가 callback()로 돌아옴
	function callback(){
		//결과적으로 완료가 되었다면 4와 200만 체크해주면 됩니다
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				printData(); 
			}
		}
	}
	
	function printData(){
		
		var result = xmlHttp.responseXML.getElementsByTagName("root")[0];
		
		var out = document.getElementById("resultDIV");
		
		out.innerHTML = "";
		out.style.display = "";
		
		var value = result.firstChild.nodeValue;
		out.innerHTML = value;
		
		
	}


</script>

</head>
<body>

<input type="text" id ="su1" />

<select id ="oper">
	<option value="hap">더하기</option>
	<option value="sub">빼기</option>
	<option value="mul">곱하기</option>
	<option value="div">나누기</option>
</select>

<input type="text" id ="su2" />

<input type ="button" value=" = " onclick = "sendIt();"> <br/><br/>

<div id ="resultDIV" style="display: none;"></div>

</body>
</html>