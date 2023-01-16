<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    table, tr, th, td { border:1px solid black; border-collapse:collapse; text-align:center; }
</style>
</head>
<body>
	<table border="1">
	
		<% for(int i =1; i<10; i++) {%>
	
			<td>
			<%out.println(i); %>단
			</td>
		
		<% } %>
		
		<% for(int i = 1; i<10; i++) {%>
			<tr>
			<%for(int j = 1; j<10; j++) {%>
				<td>
					<%out.println(j+"*"+i+"="+i*j); %>
				</td>
			<%}%>
			</tr>
		<% }%> 
	</table>
	
</body>
</html>