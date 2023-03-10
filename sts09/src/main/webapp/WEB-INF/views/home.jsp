
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Home</title>
</head>
<body>
<img alt="" src="resources/imgs/logo.jpg">
<ul>
	<c:forEach items="${list }" var="bean">
		<li><a href="${bean.deptno }">${bean.dname }-${bean.loc }</a></li>
	</c:forEach>
</ul>
<a href="./add">입력</a>
</body>
</html>
