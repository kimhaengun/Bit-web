<%@page import="java.util.Map"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
	<div align="center">
	<h1 align="center">EMP List</h1>
	<table width="600" border="1" align="center">
		<tr>
			<td>empno</td>
			<td>ename</td>
			<td>hiredate</td>
			<td>money</td>
		</tr>
		
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				Map<String, String> env = System.getenv();
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lecture", env.get("local.mysql.user"), env.get("local.mysql.password"));
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select empno, ename, hiredate, sal+ifnull(comm,0) from emp;");
				while(rs.next()){
					
			%>
		<tr>
			<td><%= rs.getString(1)%></td>
			<td><a href="detail.jsp?empno=<%= rs.getString(1)%>"><%= rs.getString(2)%></a></td>
			<td><%= rs.getString(3)%></td>
			<td><%= rs.getString(4)%></td>						
		</tr>
		<%  } }finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
			
		}
		%>
	</table>
	<p><a href="add.jsp">입력</a></p>
	</div>
</body>
</html>