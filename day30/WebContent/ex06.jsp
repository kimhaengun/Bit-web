<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사용자 요청 파라미터(쿼리스트링)</h1>
	<p>id:<%=request.getParameter("id") %></p>
	<p>pw:<%=request.getParameter("pw") %></p>

	
</body>
</html>