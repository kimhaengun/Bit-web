<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body background="imgs/bg.jpg">
	<table width="800" align="center" style="background: white">

		<%@ include file="header.jsp"%>
		<%@ include file="menu.jsp"%>

		<tr align="center">
			<td colspan="6"  height="500" valign="top">
			<%@ page import = "java.util.*,java.sql.*" %>
			<%
				String sql = "select num, sub, id, nalja, content from bbs01 where num ="+request.getParameter("num");
				System.out.println(sql);
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/lecture";
				Map<String, String> env = System.getenv();
				String user = env.get("local.mysql.user");
				String password = env.get("local.mysql.password");
				
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				try{
					Class.forName(driver);
					conn = DriverManager.getConnection(url, user, password);
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					if(rs.next()){
			%>
				<h1>상세보기 : <%=rs.getString(1) %></h1>
				<table width="600">
					<tr>
						<td>제목</td>
						<td colspan="3"><%=rs.getString(2) %></td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td><%=rs.getString(3) %></td>
						<td>날짜</td>
						<td><%=rs.getDate(4) %></td>
					</tr>
					<tr>
						<td colspan="4" height="20">
							<%=rs.getString(5) %>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<a href="edit.jsp?num=<%=rs.getString(1) %>">수정</a>
							<a href="delete.jsp?num=<%=rs.getString(1) %>">삭제</a>
						</td>
					</tr>
				</table>
			<%}}finally{
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}
				%>
			</td>
		</tr>
		
		<%@ include file="footer.jsp"%>	
	</table>
</body>
</html>