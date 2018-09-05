<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	
%>

<%!
	
	String[] newsTitle = {
		
		"日 '92만 톤 방사능 오염수' 바다에 버리려는 이유는",
		"올해 2.9% 성장도 녹록지 않아…금리 인상 전망 [흐릿]",
		"대북특사단 내일 출발…北 '미국이 남북관계 가로막아'",
		"[영상] [이쯤이야]…맨손으로 비단뱀 잡고 웃는 할머니",
		"백사장 위 수상한 물체 가까이 보니…4.2m [대왕오징어]",
		"남친 카톡방 봤다가 시작된 악몽…[남친 챙겨주라]는 경찰"

	};

	String[] newsPublisher = {
			"중앙","동아","조선","한겨레","JDBC","TV조선"
	};

%>
		

{
	"count" : <%=newsTitle.length %>,
	"titles" : [
	
		<%for(int i = 0 ; i < newsTitle.length;i++){ 
		out.print("{");
		out.print("headline:\"" + newsTitle[i] + "\"");
		out.print(",");
		out.print("publisher:\"" + newsPublisher[i] + "\"");
		out.print("}");
		if(i != (newsTitle.length -1)){
			out.print(",");
		}
	} %>
	]	
}