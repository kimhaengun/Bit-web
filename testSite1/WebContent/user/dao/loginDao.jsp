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
	<jsp:useBean id="user" class="com.bit.user.UserBean" scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="user"/>
	<%@ include file="../../../template/sql.jspf" %>
	<%
		String sql = "select id, nickName from user where id='"
					+user.getId()+"' and password = '"
					+user.getPw()+"'";
		System.out.println(sql);
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				user.setId(rs.getString("id"));
				user.setNickName(rs.getString("nickName"));
				System.out.println("로그인 후 bean 확인");
				System.out.println(user.getId()+", "+user.getNickName());
			}else{
				user.setId("");
			}
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		System.out.println(user.getId());
		if(user.getId()==null || user.getId()==""){
				response.sendRedirect("../../user/login.jsp?loginResult=false");							
		}else{
				response.sendRedirect("../../");	
		}
		
		
	%>
</body>
</html>