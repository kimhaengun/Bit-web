<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bean" class="com.bit.model.DeptVo"></jsp:useBean>
	<jsp:setProperty property="deptno" name="bean" value="1000000"/>
	<!-- 숫자 3자리 마다 , 찍기 -->
	<fmt:formatNumber value="${bean.deptno }" var="su"></fmt:formatNumber>
	<!-- 숫자 -->
	<fmt:parseNumber value="${10000}" var="su2" ></fmt:parseNumber>
	<fmt:formatNumber value="${su2+1 }" var="su3" pattern="$ ###,###,###"></fmt:formatNumber>
	<p>
		${su} - ${su2+1} - ${su3 }
	</p>
	
	
	<!-- 날짜 -->
	<%
		pageContext.setAttribute("nalja", new Date());
	%>
	<fmt:formatDate value="${nalja }" var="nal" pattern="yyyy-MM-dd hh:mm"/>
	<p>${nal }</p>
</body>
</html>