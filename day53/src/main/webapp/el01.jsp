<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 표현식</h1>
	<p><%="abcd" %></p>
	<p>${"abcd"}</p>
	<table>
		<tr>
			<td>자료형</td>
			<td>jsp</td>
			<td>el</td>
		</tr>
		<tr>
			<td>숫자 (10진수 정수)</td>
			<td><%=1234 %></td>
			<td>${"1234"}</td>
		</tr>
		<tr>
			<td>숫자 (실수)</td>
			<td><%=3.14 %></td>
			<td>${3.14}</td>
		</tr>
		<tr>
			<td>연산 (정수)</td>
			<td><%= 1+2+3 %></td>
			<td>${1+2+3 }</td>
		</tr>
		<tr>
			<td>연산 (정수)</td>
			<td><%=6*2 %></td>
			<td>${6*2 }</td>
		</tr>
		<tr>
			<td>연산 (정수)</td>
			<td><%=6/2 %></td>
			<td>${6/2 }</td>
		</tr>
		<tr>
			<td>문자열</td>
			<td><%='A' %></td>
			<td>${'A' }</td>
		</tr>
		<tr>
			<td>문자열</td>
			<td><%="ABC" %></td>
			<td>${"ABC" }</td>
		</tr>
		<tr>
			<td>boolean</td>
			<td><%=true %></td>
			<td>${true }</td>
		</tr>
		<tr>
			<td>boolean</td>
			<td><%=false %></td>
			<td>${false }</td>
		</tr>
		
		<tr>
			<td>Object</td>
			<td><%=new Date() %></td>
			<td>${null }</td>
		</tr>
		<tr>
			<td>Object</td>
			<td><%="" %></td>
			<td>${"" }</td>
		</tr>
		<jsp:useBean id="bean" class="java.util.Date"></jsp:useBean>
		<tr>
			<td>객체</td>
			<td><%=bean %></td>
			<td>${bean}</td>
		</tr>
	</table>
</body>
</html>