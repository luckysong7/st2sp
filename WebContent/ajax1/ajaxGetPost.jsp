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
<script type="text/javascript">
	var XMLHttpRequest;
	
	function getXmlHttpRequest(){
		if(window.ActiveXObject){//IE인 경우
			try {
				// 5.0 이후
				XMLHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				// 5.0 이전
				XMLHttpRequest = new ActiveXObject("Microsoft");
				
			}
		}else{
		 	// IE 가 아닌경우 
			XMLHttpRequest = new XMLHttpRequest();
		}
		
	}
	
	
	function ajaxRequestGet(){
	
		var data = document.myForm.greeting.value ;
		
		if(data== ""){
			alert("데이터 입력");
			document.myForm.greeting.focus();
			return ;
		}
		
		XMLHttpRequest.open("GET","ajaxGetPost_ok.jsp?greeting="+data,true);
		XMLHttpRequest.onreadystatechange = viewMessage;
		XMLHttpRequest.send(null);
		
	}
	
	function ajaxRequestPost(){
		
		var data = document.myForm.greeting.value ;
		
		if(data== ""){
			alert("데이터 입력");
			document.myForm.greeting.focus();
			return ;
		}
		
		XMLHttpRequest.open("POST","ajaxGetPost_ok.jsp",true);
		
		XMLHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencode"); // 정석 
		
		
		XMLHttpRequest.onreadystatechange = viewMessage;
		XMLHttpRequest.send("greeting=" + data);
		
		
	}
	
	function viewMessage(){
		var divE = document.getElementById("printDiv");
		if(XMLHttpRequest.readyState == 1 || XMLHttpRequest.readyState == 2 || XMLHttpRequest.readyState == 3 ){
			//요청 페이지 정보를 설정 (1)       // 요청을 보내기 시작 (2) 	   // 서버에서 응답이 오기 시작 (3)
			divE.innerHTML = "<image src = '../image/processing.gif' width = '50' height = '50' />"
			
			
		}else if(XMLHttpRequest.readyState == 4){
			// 서버 응답 완료 (4)
			// Data받기
			divE.innerHTML = XMLHttpRequest.responseText;
			
		}else{
			divE.innerHTML = "<font color = 'red'>" + XMLHttpRequest.status + "에러발생" + "</font>";
		}
			
	}
	
	window.onload = function(){
		getXmlHttpRequest();
	}
	
	
	
	
</script>


</head>
<body>
<h1>AjaxGetPost</h1>
<hr/>
<form action="" name = "myForm" >
	<input type = "text" name ="greeting" />
	<input type = "button" value ="Get전송" onclick="ajaxRequestGet();" > 
	<input type = "button" value ="POST전송" onclick="ajaxRequestPost();" > 
	
	<div id ="printDiv" style = "border : 1px solid blue; width: 50%"></div>
</form>
</body>
</html>