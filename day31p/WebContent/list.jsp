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
			<td colspan="6" valign="top" height="500">
				<h1 >게시판</h1>
				<table width="80%" border="1" cellspacing="0">
					<tr>
						<td width="80">글번호</td>
						<td>제목</td>
						<td width="100">글쓴이</td>
						<td width="100">날짜</td>
					</tr>
					<%@ page import="java.sql.*,java.util.*" %>
					<% 
						String sql = "select num,sub,id,nalja from bbs01 order by num desc";
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
							while(rs.next()){
					%>
					<tr>
						<td><%= rs.getInt(1) %></td>
						<td><a href="detail.jsp?num=<%= rs.getInt(1) %>"><%= rs.getString(2) %></a></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getDate(4)%></td>
						
					</tr>
					<% 	} }catch(Exception e){
							out.println("<tr><td colspan=\"4\">에러 발생 관리자에게 문의 바랍니다...</td></tr>");
						}finally{							
							if(rs!=null)rs.close();
							if(stmt!=null)stmt.close();
							if(conn!=null)conn.close();
						}
							
						
					%>
				</table>
					<p align="center">
						<a href="add.jsp">입력</a>
					</p>
				
			</td>
		</tr>
		<%@ include file="footer.jsp"%>	
	</table>
</body>
</html>