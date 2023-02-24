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
	<h1>주소</h1>
	<c:url value="bbs/../el01.jsp" var="link1">
		<c:param name="id" value="${'user1' }"></c:param>
		<c:param name="pw" value="${1234 }"></c:param>
	</c:url>
	<a href="${link1 }">link</a>
</body>
</html>