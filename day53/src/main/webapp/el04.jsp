<%@page import="com.bit.model.DeptVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	<jsp:useBean id="bean1" class="com.bit.model.DeptVo"></jsp:useBean>
	<jsp:setProperty property="deptno" name="bean1" value="1111"/>
	<jsp:setProperty property="dname" name="bean1" value="user1"/>
	 -->
	 <%
	 	DeptVo bean2=new DeptVo(1111,"user1",null);
	 	DeptVo bean3=new DeptVo(2222,"user2",null);
	 	DeptVo bean4=new DeptVo(3333,"user3",null);
	 	DeptVo bean5=new DeptVo(4444,"user4",null);
	 	//우선순위 page > req > sess > appli
	 	pageContext.setAttribute("bean", bean2);
	 	request.setAttribute("bean", bean3);
	 	session.setAttribute("bean", bean4);
	 	application.setAttribute("bean", bean5);
	 %>
	<p>${bean}</p>
	<p>${pageScope.bean}</p>
	<p>${requestScope.bean}</p>
	<p>${sessionScope.bean}</p>
	<p>${applicationScope.bean}</p>
	
	<hr/>
	<%
		request.getContextPath();
	%>
	<p>${request }</p>
	<p>${response }</p>
	<p>${pageContext.request.contextPath }</p>
</body>
</html>