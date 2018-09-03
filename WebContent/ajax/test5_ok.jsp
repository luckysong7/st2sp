<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	String result = "";
	
	for(int i = 1 ; i <= 3; i++){
		result += "{\"id\":\""+i;
		result += "\",\"userId\":\"" + userId;
		result += "\",\"userPwd\":\"" + userPwd + "\"},";
	}
	// 키 : 값 
	// {"id":"1" , "userId":"abc", "userPwd":"123"},
	// {"id":"1" , "userId":"abc", "userPwd":"123"},
	// {"id":"1" , "userId":"abc", "userPwd":"123"},
	
	// 마지막 쉼표 제거
	result = result.substring(0,result.length()-1);
	result = "["+result +"]";
	
	out.print(result);
%>

