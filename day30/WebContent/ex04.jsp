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
	//내장 객체의 지원은 스크립트릿에서만 지원 
	//= body안에서만 out.println() 사용 가능 
	//선언부 내에서 사용 불가능함
	%>
	<p>스크립트 su1 = <%out.print(su1); %></p>
	<p>스크립트 su1 = <%=su2 %></p>
	<p>선언부</p>
	<%!
		int su2 = 4321;
		public void function(){
			System.out.println("선언부");
		}
	%>
	<%
		function();
	%>
</body>
</html>
