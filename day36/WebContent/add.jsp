<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bean" class="com.bit.BbsBean"></jsp:useBean>
	<jsp:setProperty property="*" name="bean"/>
	<%@ include file="template/sql.jspf" %>
	<%
		if("POST".equals(request.getMethod())){
			//insert into bbs36 (sub,content,ref,seq,lvl) values ('test2','test',(select ifnull(MAX(num),0)+1 from bbs36 b),0,0);
			
			String sql="insert into bbs36 values ";
			sql+="((select max(num)+1 from bbs36 a),'";
			sql+=bean.getSub()+"','"+bean.getContent();
			sql+="',(select ifnull(max(num),0)+1 from bbs36 b),0,0)";
			try{
				conn = getConnection();
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
			}finally{
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}
			
			response.sendRedirect("list.jsp");
			return ;
		}
	%>
	<h1>입력</h1>
	<form action="" method="post">
		<input type="text" name = "sub" placeholder="제목 입력"><br>
		<textarea rows="" cols="" name = "content" placeholder="내용 입력"></textarea>
		<input type="submit" value="입력">
	</form>
</body>
</html>