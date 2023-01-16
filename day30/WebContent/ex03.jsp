<!-- Page / utf-8 = 통신 기준 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 자바 기준 -->    
<%@ page import="java.util.Date"%>

<!-- taglib = 외부 라이브러리 -->    
<!-- include = 다른 문서 포함-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 문서 기준 utf-8 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>디렉티브 <%out.print(new Date()); %></h1>
	<ul>
		<li>page</li>
		<li>taglib</li>
		<li>include</li>		
	</ul>
</body>
</html>