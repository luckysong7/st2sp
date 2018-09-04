<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	String userId = request.getParameter("userId");
	
	String str = "";
	
	if(!userId.equals("")){
		// 서버의 작업 시간을 임의로 설정
// 		for(int i = 0 ; i < 5000 ; i ++){
// 			System.out.println("delay.." + i);
			
// 		}
		
		if(userId.startsWith("suzi")){
			str = userId + "는 유효한 아이디 입니다.";
			
		} else{
			str = userId + "는 유효한 아이디가 아닙니다.";
			
		}
	}
%>

<%=str %>
