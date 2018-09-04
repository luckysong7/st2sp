
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
	
	function requestGet(){
		XMLHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
// 		XMLHttpRequest = new XMLHttpRequest();
		if(document.myForm.userId.value == ""){
			alert("아이디 입력 !");
			document.myForm.userId.focus();
			return ;
		}
		
		var params = "?userId="+ document.myForm.userId.value;
		XMLHttpRequest.open("GET","ajaxId_ok.jsp"+params,true);
		XMLHttpRequest.onreadystatechange = viewMessage; // 콜백
		XMLHttpRequest.send(null);
		
	}
	
	function viewMessage(){
		if(XMLHttpRequest.readyState == 4){
			if(XMLHttpRequest.status == 200){
				var str = XMLHttpRequest.responseText;
				
				var divE = document.getElementById("resultDiv");
				
				divE.innerHTML = str; 
				
			}
		}else{
			var divE = document.getElementById("resultDiv");
			divE.innerHTML = "<img width = '15' height = '15' src ='../image/loading.gif' />";
		}
	}

</script>

</head>
<body>
<h1>Ajax ID 확인</h1>

<hr/>

<form action = "" name = "myForm">
	
	아이디 : <input type ="text" name ="userId" onkeyup="requestGet();"/>
	<!-- 키보드에서 손을 딱 떼는경우가 onkeyup -->
</form>
<br/>
<div id = "resultDiv" style = "color:red"></div>

</body>

</html>