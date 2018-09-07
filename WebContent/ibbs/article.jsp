<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게 시 판(Spring2.5+Ajax)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/article.css" type="text/css"/>
<script  type="text/javascript" src ="<%=cp %>/data/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function sendData(value){
		var num = "${dto.boardNum}";
		var pageNum = "${pageNum}";
		
		var url ="<%=cp%>/ibbs/";
		
		if(value == 'updated'){
			
			url += "updated.action?";
			
		}else if(value == 'deleted'){
			
			url += "deleted.action?"
		}
		
		url += "boardNum="+num;
		url += "&${params}";
		
		location.replace(url);
	}
</script>
<script type="text/javascript">

	// 처음 화면이 시작되면 데이터를 보여줄 페이지 
	$(function(){
		listPage(1);
		
	});
	
	// 등록버튼클릭
	$(document).ready(function(){
		
		$('#sendButton').click(function(){
			
			var params = "name=" + $('#name').val()
						+ "&content=" + $('#content').val();
			
			$.ajax({
				type : "POST",
				url : "<%=cp%>/ibbs/created2.action?boardNum=${boardNum}&pageNum=${pageNum}",
				data : params,
				// true 일때만 작동
				success : function(args){
					$('#listData').html(args);
					
					//초기화작업
					$('#name').val("");
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
		var content = $.trim($("#content").val());
		
		if(!name){
			alert("\n이름을 입력하세요.");
			$("#name").focus();
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
		
		var url ="<%=cp%>/ibbs/commentList2.action?boardNum=${boardNum}";
		$.post(url,{pageNum:page},function(args){
			$("#listData").html(args);
		});
		$("#listData").show();
		
	}
	
	function deleteData2(commentNum,boardNum,page){
		
		var url = "<%=cp%>/ibbs/deleted2.action";
		
		$.post(url,{commentNum:commentNum,boardNum:boardNum,pageNum:page},function(args){
			$("#listData").html(args);
		});
		
		
	}
	

</script>
</head>

<body>

<div id="bbs">
	<div id="bbs_title">
	게 시 판
	</div>
	<div id="bbsArticle">
		<div id="bbsArticle_header">
			${dto.subject }
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>${dto.name }</dd>
				<dt>줄수</dt>
				<dd>${lineSu }</dd>
			</dl>
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd>${dto.created }</dd>
				<dt>조회수</dt>
				<dd>${dto.hitCount }</dd>
			</dl>
		</div>
		<div id="bbsArticle_content">
			<table width="600" border="0">
			<tr><td style="padding: 20px 80px 20px 62px;" valign="top" height="200">
			${dto.content }
			</td></tr>
			</table>
		</div>
		<div class="bbsArticle_bottomLine">
			
			이전글 : 
			<c:if test="${!empty preSubject}">
			<a href="<%=cp %>/ibbs/article.action?${params }&num=${preNum }">
			${preSubject }
			</a>
			</c:if>
			
		</div>
		<div class="bbsArticle_noLine">
			다음글 : 
			<c:if test="${!empty nextSubject}">
				<a href="<%=cp %>/ibbs/article.action?${params }&num=${nextNum }">
				${nextSubject }
				</a>
			</c:if>
		</div>
	</div>
	<div class="bbsArticle_noLine" style="text-align:right">
		    From : ${dto.ipAddr }
	</div>
	<div id="bbsArticle_footer">
		<div id="leftFooter">
               <input type="button" value=" 수정 " class="btn2" 
               onclick="sendData('updated')"/>
               <input type="button" value=" 삭제 " class="btn2" 
               onclick="sendData('deleted')"/>
		</div>
		<div id="rightFooter">
               <input type="button" value=" 리스트 " class="btn2" 
               onclick="javascript:location.href='<%=cp%>/ibbs/list.action?${params }';"/>
		</div>
	</div>

</div>

<br/>&nbsp;<br/>

<div align="center">

<span id = "listData" style="display: none" ></span>

</div>
<div align="center">
<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="600" colspan="3" height="3" bgcolor="#e6d4a6">
		</td>
	</tr>
	<tr>
		<td width="60" height="30" bgcolor="#eeeeee" align="center">
			<b>작성자</b>			
		</td>
		
		<td width="240" height = "30" style ="padding-left: 10px;">
			<input style="width: 50" type="text" id ="name" size = "35" maxlength="20" class ="boxTF" />
		</td>
		
		<td rowspan="2" height="30" style ="padding-left: 10px;">
		<input type="button" value="등록하기" class ="btn2" id = "sendButton" />
		</td>	
	</tr>
	
	<tr>
		<td width="600" colspan="3" height="2" bgcolor="#e6d4a6"></td>
	</tr>
	
	<tr>
		<td width="60" height="30" bgcolor="#eeeeee" align="center">
			<b>내용</b>
		</td>
		<td width="540" colspan="3" style="padding-left: 10px;">
			<textarea rows="3" cols="84" class = "boxTA" style="height: 50px;" id = "content"></textarea>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<td width="600" colspan="3" height="2" bgcolor="#e6d4a6"></td>
	</tr>

</table>

<br/>

</div>

</body>

</html>