<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bit.model.EmpDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="../css/table.css" rel="stylesheet">
<%@include file="../template/head.jsp" %>
</head>
<body>
	<%@include file="../template/header.jsp" %>
	<%@include file="../template/menu.jsp" %>
			<h1>리스트 페이지</h1>
			<div class="table">
				<div class="thead">
					<span>empno</span>
					<span>ename</span>
					<span>hiredate</span>
					<span>sal</span>
				</div>
				<% 
					List<EmpDto> list = (List<EmpDto>)request.getAttribute("list");
					for(EmpDto bean : list){
				%>
				<div class="tbody">
				<a href="emp.do?id=<%=bean.getId()%>">
					<span><%=bean.getEmpno() %></span>
					<span><%=bean.getEname() %></span>
					<span>
						<%
							java.util.Date d = bean.getHiredate();
							DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
							out.print(df.format(d));
						%>
					</span>
					<span><%=bean.getSal() %></span>
				</a>
				</div>
				<%} %>
			</div>
			<p><a class="btn" href="add.do">입력</a></p>
	<%@include file="../template/footer.jsp" %>
</body>
</html>