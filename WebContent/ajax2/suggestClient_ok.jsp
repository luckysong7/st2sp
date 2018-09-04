<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%!

	String[] keywords = { "ajax","Ajax","Ajax실전 프로그래밍",
		"AJA","AZARA","자수","자전거","자라","자바","자바프로그래밍",
		"자바 서버 페이지","자바 스터디","astra","abirt",
		"자바 서비스","자바캔","ABC마트","Apple"
	};

	public List<String> search(String userKeyword){
		if(userKeyword==null || userKeyword.equals("")){
			return null;
		}
		
		//생략하면
		//소문자입력시 소문자, 대분자입력시 대문자
		userKeyword = userKeyword.toUpperCase();
	
		List<String> lists = new ArrayList<String>();
		
		for(int i=0;i<keywords.length;i++){
			if(keywords[i].startsWith(userKeyword)){
				lists.add(keywords[i]);
			}
		}
		return lists;
	}
%>

<%

	String userKeyword = request.getParameter("userKeyword");
	
	List<String> keywordList = search(userKeyword);
	
	out.print(keywordList.size());
	out.print("|");
	
	Iterator<String> it = keywordList.iterator();
	
	while(it.hasNext()){
		
		String value = (String)it.next();
		out.print(value);
		if(keywordList.size()-1 > 0){
			out.print(",");
		}
		
	}
	
%>



