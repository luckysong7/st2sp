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
<script type="text/javascript" src ="<%=cp%>/data/js/log.js"></script>
<script type="text/javascript" src ="<%=cp%>/data/js/member.js"></script>
<script type="text/javascript">
	function memberClass(){
			
		// 1. member.js 없이 실행 (메모리상에 객체가 생성)
		var object1 = {	}; // 객체
		object1.id = "suzi"; // 변수 초기화
		object1.name = "배수지";

		log("log1: " + object1.id + " , " + object1.name);
		
		// 2. member.js 없이 실행 (메모리상에 객체가 생성)
		var object2 = {	}; // 객체
		object2.id = "luckysong7"; // 변수 초기화
		object2.name = "송재훈";

		log("log2: " + object2.id + " , " + object2.name);
		
		// 3. Member클래스 객체 생성후 변수명으로 호출
		var member = new Member("Christal","크리스탈","서울");
		log("member1: " + member.id + " , " + member.name + " , " + member.addr);
		
		// 4. setter 로 초기화시키고 변수명으로 호출
		member.setValue("sambahong","홍진영","제주");
		log("member2: " + member.id + " , " + member.name + " , " + member.addr);
		
		// 5. getter 로 호출
		var memberInfo = member.getValue();
		log("member.getValue(): " + memberInfo);
		
		
	}
	
	window.onload = function(){
		memberClass();
	}
</script>
</head>
<body>

	
<h1>자바스크립트 클래스 사용</h1>
<hr/>
<div id = "console"></div>


</body>
</html>
