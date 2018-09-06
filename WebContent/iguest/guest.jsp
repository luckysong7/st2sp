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
<title>Ajax 방명록</title>
<link rel = "stylesheet" href = "<%=cp%>/data/css/style.css" type = "text/css" />
<script  type="text/javascript" src ="<%=cp %>/data/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	// 처음 화면이 시작되면 데이터를 보여줄 페이지 
	$(function(){
		listPage(1);
		
	});
	
	// 등록버튼클릭
	$(document).ready(function(){
		
		$('#sendButton').click(function(){
			
			var params = "name=" + $('#name').val()
						+ "&email=" + $('#email').val()
						+ "&content=" + $('#content').val();
			
			$.ajax({
				type : "POST",
				url : "<%=cp%>/iguest/created.action",
				data : params,
				// true 일때만 작동
				success : function(args){
					$('#listData').html(args);
					
					//초기화작업
					$('#name').val("");
					$('#email').val("");
					$('#content').val("");
					
				},
				beforeSend: showRequest,
				error: function(e){
					alert(e.responseText);
				} 	
			});
		});
	});
	
	function showRequest(){
		// 유효성 검사
		var name = $.trim($("#name").val());
		var email = $.trim($("#email").val());
		var content = $.trim($("#content").val());
		
		if(!name){
			alert("\n이름을 입력하세요.");
			$("#name").focus();
			return false;
		}
		if(!email){
			alert("\n이메일을 입력하세요.");
			$("#email").focus();
			return false;
		}
		if(!content){
			alert("\n내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		if(content.length > 200){
			alert("\n 내용은 200자까지만 입력 가능합니다.");
			$("#content").focus();
			return false;
		}
		
		return true; 
		// 반드시 리턴값 true 가 있어야 함 
		// true 가 없으면 실행되지 않음 !!
		
		
	}
	
	function listPage(page){
		
		var url ="<%=cp%>/iguest/list.action";
		$.post(url,{pageNum:page},function(args){
			$("#listData").html(args);
		});
		$("#listData").show();
		
	}
	
	function deleteData(num,page){
		var url = "<%=cp%>/iguest/deleted.action";
		
		$.post(url,{num:num,pageNum:page},function(args){
			$("#listData").html(args);
		});
		
	}
	

</script>

</head>
<body>

<br/><br/>
<center>
<table width="600" border="2" cellpadding="0" cellspacing="0" bordercolor="#e6d4a6" align="center"> 
	<tr height="40">
		<td style="padding-left: 20px;"><b>방명록</b></td>
	</tr>
</table>

<br/><br/>

<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="600" colspan="4" height="3" bgcolor="#e6d4a6">
		</td>
	</tr>
	<tr>
		<td width="60" height="30" bgcolor="#eeeeee" align="center">
			<b>작성자</b>			
		</td>
		<td width="240" height = "30" style ="padding-left: 10px;">
			<input style="width: 50" type="text" id ="name" size = "35" maxlength="20" class ="boxTF" />
		</td>
		
		<td width="60" height="30" bgcolor="#eeeeee" align="center">
			<b>이메일</b>
		</td>
		<td width="240" height = "30" style ="padding-left: 10px;">
			<input style="width: 200" type="text" id ="email" size = "35" maxlength="50" class ="boxTF" />
		</td>
	</tr>
	
	<tr>
		<td width="600" colspan="4" height="2" bgcolor="#e6d4a6"></td>
	</tr>
	
	<tr>
		<td width="60" height="30" bgcolor="#eeeeee" align="center">
			<b>내용</b>
		</td>
		<td width="540" colspan="3" style="padding-left: 10px;">
			<textarea rows="3" cols="84" class = "boxTA" style="height: 50px;" id = "content"></textarea>
		</td>
	</tr>
	
	<tr>
		<td width="600" colspan="4" height="2" bgcolor="#e6d4a6"></td>
	</tr>
	
	<tr>
		<td width="600" colspan="4" height="30" align="right" style="padding-right: 15px; ">
		<input type="button" value="등록하기" class ="btn2" id = "sendButton" />	
		</td>
	</tr>
</table>

<br/>
<span id = "listData" style="display: none"></span>
</center>
</body>
</html>