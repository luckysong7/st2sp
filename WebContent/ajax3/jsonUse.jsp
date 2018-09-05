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
<style type="text/css">
	#result{
		border : 1px dotted #0000ff;
		
	}
	
	div{
		margin: auto;
		width: 600;
		height: 100%;
	}
</style>
<script type="text/javascript">
	function useJson(){
		var userArray = [
		    {
		    	userId: "sambahong",
		    	name: "홍진영",
		    	age: 30,
		    	phone: [
		    	        {home : [
		    	                "031-111-1111","032-222-2222"]},
		    			{office :["02-333-3333","041-555-5555"]}
		    	        ] 
		    },
		    {
		    	userId: "zico",
		    	name: "지코",
		    	age: 27,
		    	phone: [{},{}] 
		    },
		    {
		    	userId: "luckysong7",
		    	name: "송재훈",
		    	age: 15,
		    	phone: [{},{}] 
		    }
		                 
		];
		
		// 한개의 데이터 가져오기
		var id = userArray[0].userId;
		var name = userArray[0].name;
		var age = userArray[0].age;
		var homephone1 = userArray[0].phone[0].home[0];
		var homephone2 = userArray[0].phone[0].home[1];
		var officephone1 = userArray[0].phone[1].office[0];
		var officephone2 = userArray[0].phone[1].office[1];
		
		var printData = id + " , " + name + " , " + age + "<br/>";
		printData += "userArray[0].phone[1].office[0] : " + officephone1 + "<br/>";
		printData += "userArray[0].phone[1].office[1] : " + officephone2 + "<br/>";
		
		// 전체 데이터 
		for(var i = 0 ; i < userArray.length; i++){
			var userId = userArray[i].userId;
			var userName = userArray[i].name;
			var userAge = userArray[i].age;
			
			printData += userId + " , " + userName + " , " + userAge + "<br/>";
		}
		
		var resultDiv = document.getElementById("result");
		resultDiv.innerHTML = printData;
		
		
	}
	
	window.onload = function(){
		useJson();
	}
</script>
</head>
<body>
<h1>JSON(Javescript Object Notation)</h1>
<hr/>
<br/>
<div id = "result"></div>

</body>
</html>