<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstl</h1>
	<p><c:out value="1234"></c:out></p>
	<p><c:out value="${1234}"></c:out></p>
	<c:set var="msg1" value="abcd"></c:set>
	<p><c:out value="${msg1}"></c:out></p>
	<p><c:set var="msg2">ABCD</c:set></p>
	<p><c:out value="${msg2}"></c:out></p>
	<hr/>
	<%
		pageContext.setAttribute("temp", new Object());
	%>
	<c:set var="msg3" value="${temp }"></c:set>
	<p><c:out value="${msg3 }">으이으이으이</c:out></p>
	<p>${msg3 eq null ? '나도' : msg3 }</p>
</body>
</html>