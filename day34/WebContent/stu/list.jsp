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
				<h2>학생 성적 리스트</h2>
				<table width="600" align="center">
					<tr>
						<th>학번</th>
						<th>국어</th>
						<th>영어</th>
						<th>수학</th>
					</tr>
					<%@ page import="com.bit.stu.StuDao, java.util.*" %>					
					<%
						StuDao dao = new StuDao();
						ArrayList<int[]> list = dao.selectAll();
						for(int i=0; i<list.size(); i++){
							
						int[] stu = list.get(i);
					%>
					<tr>
						<td><%=stu[0] %></td>
						<td><%=stu[1] %></td>
						<td><%=stu[2] %></td>
						<td><%=stu[3] %></td>						
					</tr>
					<%} %>
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