<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="bean" class="com.bit.user.UserBean"></jsp:useBean>
	<jsp:setProperty property="*" name="bean"/>
	<%@ include file="../../../template/sql.jspf" %>
	<%
		String sql = "insert into user (id,password,nickName) values('"
					+bean.getId()+"','"
					+bean.getPw()+"','"
					+bean.getNickName()+"')";
		System.out.println(sql);
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	response.sendRedirect("../login.jsp");
	%>
</body>
</html>