<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="100%">
		<tr>
			<td><img alt="logo" src="/day32/imgs/logo.png" height="100"></td>
		</tr>
		<tr>
			<td background="/day32/imgs/mn.png" >
				<p align="center">
					<a href="/day32/">HOME</a>
					<a href="/day32/am/list.jsp">AM</a> 
					<a href="/day32/pm/list.jsp">PM</a>
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 내용작성 --> 
				<%@ page import="java.util.*,java.sql.*" %>
				<%
					int num = Integer.parseInt(request.getParameter("num"));
					String sub ="";
					String id = "";
					String content = "";
					Date nalja = null;
					Map<String, String> env = System.getenv();
					String driver = "com.mysql.jdbc.Driver";
					String url = "jdbc:mysql://localhost:3306/lecture";
					String user = env.get("local.mysql.user");
					String password = env.get("local.mysql.password");
					
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					
					String sql = "select sub, id, nalja, content from bbs01 where num="+num;
					try{
						Class.forName(driver);
						conn = DriverManager.getConnection(url, user, password);
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						if(rs.next()){
							sub = rs.getString(1);
							id = rs.getString(2);
							nalja = rs.getDate(3);
							content = rs.getString(4);
						}
					}finally{
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
						
					}
					
				%>
				<h1 align="center"><%=num %>번 게시글 수정</h1>
				<form action="update.jsp?num="<%=num %>>
				<table align="center" width="600">
				<input type="hidden" name = "num" value="<%=num %>">
					<tr>
						<td bgcolor="gray">제목</td>
						<td colspan="3"><input type="text" name = "sub" value="<%=sub %>"></td>
					</tr>
					<tr>
						<td bgcolor="gray" width="100">글쓴이</td>
						<td><%=id %></td>
						<td bgcolor="gray" width="100">날짜</td>
						<td><%=nalja %></td>
					</tr>
					<tr>
						<td colspan="4" height="300">
							<textarea name = "content" cols="40" rows="5"><%=content %></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="submit" value="수정">
							<input type="reset" value="취소">
							
						</td>
					</tr>
				</table>
				</form>
				<!-- 내용끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="6" background="/day32/imgs/footer.png">
				<p>&copy;88888888888888888888888888</p>
			</td>
		</tr>
	</table>
</body>
</html>