<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Id Check</title>
<script>
function useIdAndClose() {
	// 현재창을 띄운 부모창의 참조는 window.opener
	// 현재창 의미하는 window는 일반적으로 생략가능
	opener.document.frm.id.value = document.fr.userid.value;
	
	// 현재 창 닫기  window.close();  close();
	window.close();
}
</script>
</head>
<body>

<%--
* el ${ } 에서 Scope명 생략시 아래 순서대로 검색함 
pageScope -> requestScope -> sessionScope -> applicationScope
 --%>

<c:choose>
	<c:when test="${requestScope.isDuplicated}">
		사용중인 아이디 입니다.<br>
	</c:when>
	<c:otherwise>
		사용가능한 아이디 입니다.
		<input type="button" value="ID사용" onclick="useIdAndClose()">
	</c:otherwise>
</c:choose>

<form action="/member/joinIdCheck" method="get" name="fr">
	<input type="text" name="userid" value="${param.userid}">
	<input type="submit" value="중복체크">
</form>

</body>
</html>