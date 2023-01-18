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
				<h1>페이징된 게시판</h1>
				<table border="1" cellspacing="0" align="center" width="600">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
					</tr>
					<%@ page import="java.sql.*,java.util.*" %>
					<%
						String msgP = request.getParameter("page");
						int p = 1;
						if(msgP!=null){
							p= Integer.parseInt(msgP);	
						}
						
						// String sql = "select num,sub,id,nalja from bbs01 where num>=(select max(num)-10 from bbs01)-10*"+p+"and num<=(select max(num) from bbs01)-10*"+p+" order by num desc";
						String sql = "select num,sub,id,nalja from (select num,sub,id,nalja, @rownum:=@rownum+1 as rn from bbs01 , (select @rownum:=0 from dual)R order by num desc)R2 where rn>=1+10*"+(p-1)+" and rn<=10+10*"+(p-1)+";";
						Map<String, String> env = System.getenv();
						String driver = "com.mysql.jdbc.Driver";
						String url = "jdbc:mysql://localhost:3306/lecture";
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
						<td><%=rs.getInt(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getDate(4) %></td>
					</tr>
					<% 
						}
							}finally{
							if(rs!=null)rs.close();
							if(stmt!=null)stmt.close();
							if(conn!=null)conn.close();
						}
					%>
				</table>
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