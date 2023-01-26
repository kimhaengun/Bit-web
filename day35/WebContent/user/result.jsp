<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="com.bit.UserBean"></jsp:useBean>
	<jsp:setProperty property="*" name="user"/>
	<%@ page import="java.sql.*,com.bit.LocalSql" %>
	<%
		if("GET".equals(request.getMethod())){
			response.sendRedirect("../login/login.jsp");
			return ;
		}
		
		//비밀번호 일치
		if(!user.getPw().equals(user.getRe())){
			response.sendRedirect("join.jsp?id="+user.getId());
			return ;
		}
		String sql = "insert into user35 values (0,'"+user.getId()+"', md5('"+user.getPw()+"'));";
		
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = LocalSql.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	%>
	
	<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>