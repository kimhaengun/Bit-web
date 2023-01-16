<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	//자바 코드
	out.println("<title>자바 스크립트</title>");
%>
</head>
<body>
	<h1>자바 스크</h1>
	<%
		int su1 = 1234;
	%>
	<p>스크립트 su1 = <%out.print(su1); %></p>
	<p>스크립트 su1 = <%=su1 %></p>
</body>
</html>