<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();

	// 클라이언트 캐쉬 제거
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store"); // HTTP 1.0
	response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1

	// 세션 삭제후(로그아웃) 뒤로가기 접근방지
	response.setDateHeader("Expires", 0);
%>

<%=new Date()%>