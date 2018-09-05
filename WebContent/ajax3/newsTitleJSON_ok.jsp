<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	
%>
{
	"count":4,
	"titles": [
		
		{
			"publisher" : "조선일보",
			"headline" : "日 '92만 톤 방사능 오염수' 바다에 버리려는 이유는"
		},
		
		{
			"publisher" : "동아일보",
			"headline" : "올해 2.9% 성장도 녹록지 않아…금리 인상 전망 [흐릿]"
		},
		
		{
			"publisher" : "중앙일보",
			"headline" : "대북특사단 내일 출발…北 '미국이 남북관계 가로막아'"
		},
		
		{
			"publisher" : "매일경제",
			"headline" : "[영상] [이쯤이야]…맨손으로 비단뱀 잡고 웃는 할머니"
		}
		
	]
	

}

