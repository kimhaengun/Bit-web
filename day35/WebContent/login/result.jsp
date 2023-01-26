<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="com.bit.UserBean" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="login"/>
	<%@ page import="java.sql.*, com.bit.LocalSql" %>
	<%
		//useBean life - scope
		// 4가지 scope
		// 1.page - 해당 페이지내에서 유지
		// 2.request - 동일 request
		// 3.session - 세션 유지 기간동안(서버에서) / 각각의 세션 
		// 4.application - 서버 시작~종료 까지 / 많은 사용자 접속 시 사용자당 유지해야함
		String sql = "select count(*) as cnt from user35 where id='"+login.getId()+"' and pw= md5('"+login.getPw()+"')";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			conn = LocalSql.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				login.setResult(rs.getInt("cnt")>0);
			}
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		response.sendRedirect("../");
	%>
	
</body>
</html>