<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 한글 -->
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="bean" class="com.bit.EmpBean"></jsp:useBean>
	<jsp:setProperty property="sub" name="bean"/>
	<jsp:setProperty property="id" name="bean"/>
	<jsp:setProperty property="content" name="bean"/>
	<%!
		String checkMsg(String msg){
		msg = msg.replace("--", "­­");
		msg = msg.replace("'", "＇");
		msg = msg.replace(",", "，");
		msg = msg.replace("<", "＜");
		msg = msg.replace(">", "＞");
		msg = msg.replace("(", "（");
		msg = msg.replace(")", "）");
		msg = msg.replace("%", "％");
		return msg;
	   }
	%>
	<%
		if(request.getMethod().equals("GET")){
			response.sendRedirect("add.jsp");
			return ;
		}
		String sub = bean.getSub();
		String id = bean.getId();
		String content = bean.getContent();
		//문자열 검사 (인젝션 막기)
		sub = checkMsg(sub);
		
		
		String sql = "insert into bbs35 values(0,'"+id+"','"+sub+"','"+content+"',0)";
		
		Connection conn = null;
		Statement stmt = null;
		
		try{
			conn=LocalSql.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		response.sendRedirect("list.jsp");
	%>
	<%@ page import="com.bit.LocalSql, java.sql.*" %>
	
</body>
</html>