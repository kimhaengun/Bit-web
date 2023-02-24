<%@page import="com.bit.model.DeptVo"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String[] arr1 = Arrays
						  .asList("item1", "item2", "item3", "item4")
						  .toArray(new String[]{});
	List list = Arrays
			  .asList("list1", "list2", "list3", "list4")
			  ;
	Set set = new HashSet(list);
	HashMap map = new HashMap();
	map.put("key1","val1");
	map.put("key2","val2");
	map.put("key3","val3");
	
	List<DeptVo> alist = Arrays.asList(
				new DeptVo(1111,"user1","test1"),
				new DeptVo(2222,"user2","test2"),
				new DeptVo(3333,"user3","test3"),
				new DeptVo(4444,"user4","test4")
			);
			
			
	
	pageContext.setAttribute("arr1", alist);
	
%>
	<h1>반복문</h1>
	<ol>
	<c:forEach begin="1" end="10" var="i" step="2" varStatus="status">
		<li>item${i}-${status.first }</li>
	</c:forEach>
	</ol>
	<ol>
		<c:forEach items="${arr1 }" var="item" varStatus="status">
			<li>${item.dname } - ${status.current } - ${status.index }</li>
		</c:forEach>
	</ol>
</body>
</html>