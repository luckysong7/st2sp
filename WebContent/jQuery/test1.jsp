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
	<script type="text/javascript" src ="<%=cp %>/data/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
// 	window.onload = function(){
// 		alert("환영!!");
		
// 	}
	
// 	window.onload = function(){
// 		alert("ㄹㅇ 환영!!");
		
// 	}

	$(document).ready(function(){
		alert("안녕");
	});
	$(function(){
	alert("ㅎ2");
	});
	
	$(document).ready(function(){
		$(document.body).css("background","pink");
		
	});
	
	$(function(){
		$("<div><b>제이쿼리</b></div>").appendTo("body");
	});
</script>


</head>
<body>

</body>
</html>