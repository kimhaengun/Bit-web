<%@page import="com.bit.stu.StuDao"%>
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
			<td align="center">
				<h1>학생성적관리프로그램(web)</h1>	
			</td>
		</tr>
		<tr>
			<td bgcolor="gray" align="center">
				<p>
				<a href="../" style="">home</a>
				<a href="./list.jsp" style="">list</a>
				<a href="./add.jsp" style="">insert</a>
				<a href="#" style="">etc</a>
				</p>				
			</td>
		</tr>
		<tr>
			<td align="center">
			<%@page import="java.sql.*,com.bit.stu.LocalMysql" %>
			<%
				int num = Integer.parseInt(request.getParameter("num"));
				int kor = 0;
				int eng = 0;
				int math = 0;
				int tot = 0;
				
				String sql = "select kor,eng,math,kor+eng+math from stu33 where num="+num;
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				
				try{
					stmt = LocalMysql.getConnection().createStatement();
					rs = stmt.executeQuery(sql);
					if(rs.next()){
						kor = rs.getInt(1);
						eng = rs.getInt(2);
						math = rs.getInt(3);
						tot = rs.getInt(4);
						
					}
				}finally{
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(LocalMysql.getConnection()!=null) LocalMysql.getConnection().close();	
				}
			%>
				<h2><%=num %>번 학생 성적</h2>
				
				<table width="600" align="center">
					<tr>
						<td>학번</td>
						<td><%=num %></td>
					</tr>
					<tr>
						<td>국어</td>
						<td><%=kor %></td>
					</tr>
					<tr>
						<td>영어</td>
						<td><%=eng %></td>
					</tr>
					<tr>
						<td>수학</td>
						<td><%=math %></td>
					</tr>
					<tr>
						<td>합계</td>
						<td><%=tot %></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="gray" align="center">
				&copy; dqwkdjwqldhwqkdhwqiyghqygdwqhbdwq
			</td>
		</tr>
	</table>
</body>
</html>