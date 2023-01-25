<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../template/header.jspf" %>
	<%@ include file="../template/menu2.jspf" %>
	<%@ page import="java.sql.*,java.util.*" %>
	<%@ include file = "../template/head.jspf"%>
	<%
		String param1 = request.getParameter("num");
		int num = Integer.parseInt(param1);
		int kor=0;
		int eng=0;
		int math=0;
		String sql = "select * from stu33 where num="+num;
		
		
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				kor = rs.getInt("kor");
				eng = rs.getInt("eng");
				math = rs.getInt("math");
			}
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
			
		}
		
	%>
		<h2>수정 페이지</h2>
		<form action="update.jsp">
		<table width="600" align="center">
			<tr>
				<td>학번</td>
				<td><input type="text" name="num" value="<%=num%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>국어</td>
				<td><input type="text" name = "kor" value="<%=kor%>"></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><input type="text" name = "eng" value="<%=eng%>"></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><input type="text" name = "math" value="<%=math%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
					<input type="button" value="뒤로" onclick="history.back()">
				</td>
			</tr>
		</table>
		</form>
	<%@ include file="../template/footer.jspf" %>
</body>
</html>