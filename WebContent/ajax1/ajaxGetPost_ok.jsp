<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	// 클라이언트 캐쉬 제거
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control","no-store"); // HTTP 1.0
	response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
	
	// 세션 삭제후(로그아웃) 뒤로가기 접근방지
	response.setDateHeader("Expires",0);
	
	/*
	if(request.getProtocol().equals("HTTP/1.1")){
		response.setHeader("Cache-Control","no-cache");
	}
	*/
	
%>
<%

	String greeting  = request.getParameter("greeting");

	for(int i = 0 ; i < 35000 ; i++){
		System.out.println("서버에서 작업중...");
	}
%>

<%= "server:" + greeting %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>