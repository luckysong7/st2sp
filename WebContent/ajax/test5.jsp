<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=cp%>/data/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
				$("#sendButton").click(
						function() {
							var params = "userId=" + $("#userId").val()
									+ "&userPwd=" + $("#userPwd").val();

							$.ajax({
								type : "POST",
								url : "test5_ok.jsp",
								data : params,
								dataType : "json",
								success : function(args) {
									var str = "";
									
									for (var i = 0; i < args.length; i++) {

										str += "id=" + args[i].id;
										str += ",userId=" + args[i].userId;
										str += ",userPwd=" + args[i].userPwd+ "<br/>";

									}
									$("#resultDIV").html(str);
								},
								error : function(e) {
									alert(e.reponseText);
								}
							});

						});
			});
</script>

</head>

<body>

	<!-- jQuery만 -->
	아이디 :
	<input type="text" id="userId" />
	<br /> 패스워드 :
	<input type="text" id="userPwd" />
	<br />
	<input type="button" value="전송" id="sendButton" />

	<br />
	<br />
	<div id="resultDIV"></div>



</body>
</html>