<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
%>

<c:if test="${totalDataCount!=0 }">
	<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
		<c:forEach var = "dto" items = "${lists }">
		<tr>
			<td height="1" colspan="2" bgcolor="#999999">
			</td>
		</tr>
		
		<tr height="30">
			<td width="300" style="padding-left: 10px;">
				No ${dto.listNum }.${dto.name }
				(<a href="mailto:${dto.email }">${dto.email }</a>)
			</td>
			<td width="300" align="right" style="padding-right: 10px;">
				${dto.created }&nbsp;
				<a href="javascript:deleteData('${dto.num }','${pageNum }');">
				삭제
				</a>
			</td>
		</tr>
	
		<tr>
			<td height="30" style="padding-left: 10px;" colspan="2">
				${dto.content }
			</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="2" bgcolor="#dbdbdb" height="2"></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				${pageIndexList }
			</td>
		</tr>
	</table>
</c:if>
