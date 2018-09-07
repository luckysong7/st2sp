<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게 시 판(Struts2+Ajax)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/created.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/board/js/util.js"></script>
<script type="text/javascript">

    function sendIt() {
       
		f = document.myForm;

    	str = f.subject.value;
    	str = str.trim();
        if(!str) {
            alert("\n제목을 입력하세요. ");
            f.subject.focus();
            return;
        }
    	f.subject.value = str;

	    str = f.name.value;
    	str = str.trim();
        if(!str) {
            alert("\n이름을 입력하세요. ");
            f.name.focus();
            return;
        }
		/*
        if(!isValidKorean(str))  {
            alert("\n이름을 정확히 입력하세요");
            f.name.focus();
            return;
        }
		*/
	    f.name.value = str;

        if(f.email.value) {
	    	if(!isValidEmail(f.email.value)) {
                alert("\n정상적인 E-Mail을 입력하세요. ");
                f.email.focus();
                return;
	    	}
        }

    	str = f.content.value;
	    str = str.trim();
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }
    	f.content.value = str;

    	
    	
    	if(f.mode.value == 'created'){
    		f.action = "<%=cp%>/ibbs/created.action";
    	}else if(f.mode.value == 'updated'){
    		f.action="<%=cp%>/ibbs/updated.action?mode=${mode }";
    	}   	
        f.submit();
    }

</script>

</head>

<body>

<div id="bbs">
	<div id="bbs_title">
	게 시 판(Struts2+Ajax)
	</div>

	<form name="myForm" method="post" action="">
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd>
				      <input type="text" name="subject" value ="${dto.subject }" size="74" maxlength="100"  class="boxTF" />
				</dd>
			</dl>
		</div>

		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>
				      <input type="text" name="name" value ="${dto.name }" size="35" maxlength="20" class="boxTF" />
				</dd>
			</dl>
		</div>

		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>E-Mail</dt>
				<dd>
				      <input type="text" name="email" value ="${dto.email }" size="35" maxlength="50" class="boxTF" />
				</dd>
			</dl>
		</div>

		<div id="bbsCreated_content">
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd>
				      <textarea name="content" cols="63" rows="12" class="boxTA">
				      		${dto.content }
				      </textarea>
				</dd>
			</dl>
		</div>

		<div class="bbsCreated_noLine">
			
		</div>
	</div>

	<div id="bbsCreated_footer">
		<c:if test="${mode=='created'}">
		<input type="hidden" name = "boardNum" value ="${dto.boardNum }" />
		<input type="hidden" name = "pageNum" value ="${dto.pageNum }" />
		<input type="hidden" name = "mode" value ="${mode }" />
			<input type="button" value=" 등록하기 " class="btn2" 
       		 onclick="sendIt()"/>
        	<input type="reset" value=" 다시입력 " class="btn2" 
        	onclick="document.myFrom.subejct.focus();"/>
        	<input type="button" value=" 작성취소 " class="btn2" 
        	onclick="javascript:location.href='<%=cp%>/ibbs/list.action?pageNum=${pageNum }';"/>
		</c:if>
		
		
        <c:if test="${mode=='updated'}">
        <input type="hidden" name = "num" value ="${dto.num }" />
		<input type="hidden" name = "pageNum" value ="${dto.pageNum }" />
		<input type="hidden" name = "mode" value ="${mode }" />	
			<input type="button" value=" 수정하기 " class="btn2" 
       		 onclick="sendIt()"/>
        	<input type="button" value=" 수정취소 " class="btn2" 
        	onclick="javascript:location.href='<%=cp%>/ibbs/list.action?pageNum=${pageNum }';"/>
		</c:if>
		
		
	</div>

    </form>
</div>

</body>

</html>