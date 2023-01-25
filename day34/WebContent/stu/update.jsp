<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "../template/head.jspf"%>
<%
	String param1 = request.getParameter("num");
	String param2 = request.getParameter("kor");
	String param3 = request.getParameter("eng");
	String param4 = request.getParameter("math");
	int num = 0;
	int kor = 0;
	int eng = 0;
	int math = 0;
	try{
		
	num = Integer.parseInt(param1);
	kor = Integer.parseInt(param2);
	eng = Integer.parseInt(param3);
	math = Integer.parseInt(param4);
	
	}catch(NumberFormatException e){
		response.sendRedirect("edit.jsp?err=%EC%9E%85%EB%A0%A5%EC%9D%84%20%ED%99%95%EC%9D%B8%ED%95%98%EC%84%B8%EC%9A%94&num="+num+"&kor="+param2);
		return ;
	}
	if((kor<0 || kor>100)||(eng<0 || eng>100)||(math<0 || math>100)){
		response.sendRedirect("edit.jsp?err=%EC%9E%85%EB%A0%A5%EC%9D%84%20%ED%99%95%EC%9D%B8%ED%95%98%EC%84%B8%EC%9A%94&num="+num+"&kor="+param2);
		return ;
	}
	
	String sql = "update stu33 set kor="+kor+", eng = "+eng+", math="+math+" where num="+num;
	try{
		stmt = getConnection().createStatement();
		stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null)stmt.close();
		if(getConnection()!=null)getConnection().close();
	}
	response.sendRedirect("detail.jsp?num="+num);
%>
</body>
</html>