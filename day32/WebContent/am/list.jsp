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
				<h1 align="center">리스트</h1>
				<table width="600" align="center" border="1" cellspacing="2">
					<tr >
						<th width="100">글번호</th>
						<th>제목</th>
						<th width="100">글쓴이</th>
						<th width="100">날짜</th>
					</tr>
					
					<%@ page import="java.sql.*,java.util.*" %>
					<%
						String sql = "select num, sub, id, nalja from bbs01 order by num desc";
						Map<String, String> env = System.getenv();
						String driver = "com.mysql.jdbc.Driver";
						String url = "jdbc:mysql://localhost:3306/lecture";
						String user = env.get("local.mysql.user");
						String password = env.get("local.mysql.password");
						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null;
						ArrayList<String[]> list = new ArrayList<String[]>();
						try{
							Class.forName(driver);
							conn = DriverManager.getConnection(url, user, password);
							stmt = conn.createStatement();
							rs=  stmt.executeQuery(sql);
							while(rs.next()){
								String[] arr = new String[4];
								arr[0] = rs.getInt(1)+"";
								arr[1] = rs.getString(2);
								arr[2] = rs.getString(3);
								arr[3] = rs.getDate(4).toString();
								
								list.add(arr);
						}}finally{
							if(rs!=null) rs.close();
							if(stmt!=null) stmt.close();
							if(conn!=null) conn.close();
							
						}
						for(int i = 0; i<list.size(); i++){
							String[] obj = list.get(i);
						
					%>
					<tr>
						<td><a href="detail.jsp?num=<%=obj[0] %>"><%=obj[0] %></a></td>
						<td><a href="detail.jsp?num=<%=obj[0] %>"><%=obj[1] %></a></td>
						<td><a href="detail.jsp?num=<%=obj[0] %>"><%=obj[2] %></a></td>
						<td><a href="detail.jsp?num=<%=obj[0] %>"><%=obj[3] %></a></td>
					</tr>
					<%
						}
					%>
				</table>
				<!-- 내용끝 -->
				<p align="center">
					<a href="add.jsp">입력</a>
				</p>
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