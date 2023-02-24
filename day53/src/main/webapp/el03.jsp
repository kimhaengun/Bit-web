<%@page import="com.bit.model.DeptVo, java.util.*"%>
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
		//생성만 하면 scope에 등록되어 있지 않기 때문에 값이 안나옴
		//useBean을 사용하면 scope의 Default값이 page이기 때문에 가능한거
		DeptVo bean1 = new DeptVo();
		//scope 등록
		pageContext.setAttribute("bean1", bean1);
		bean1.setDeptno(1111);
		bean1.setDname("user1");
		String[] arr1 = {"item1", "item2", "item3", "item4"};
		pageContext.setAttribute("arr1", arr1);
		List arr2 = new ArrayList();
		arr2.add(1111);
		arr2.add(2222);
		arr2.add(3333);
		arr2.add(4444);
		pageContext.setAttribute("arr2", arr2);
		Map map = new HashMap();
		map.put("key1","val1");
		map.put("key2","val2");
		map.put("key3","val3");
		map.put("key4","val4");
		pageContext.setAttribute("map", map);
		
	%>
	<!-- 
	<jsp:useBean id="bean2" class="com.bit.model.DeptVo" scope="page"></jsp:useBean>
	<p>bean1 : ${bean1.deptno }</p>
	<p>bean1 : ${bean1.dname }</p>
	 -->
	<p>${arr1 }</p>
	<ul>
		<li>${arr1[0] }</li>
		<li>${arr1[1] }</li>
		<li>${arr1[2] }</li>
		<li>${arr1[3] }</li>
	</ul>
	<p>${arr2 }</p>
	<ul>
		<li>${arr2[0] }</li>
		<li>${arr2[1] }</li>
		<li>${arr2[2] }</li>
		<li>${arr2[3] }</li>
	</ul>
	<p>${map }</p>
	<ul>
		<li>${map['key1'] }</li>
		<li>${map['key2'] }</li>
		<li>${map['key3'] }</li>
		<li>${map['key4'] }</li>
	</ul>
	<ul>
		<li>${map.key1 }</li>
		<li>${map.key2 }</li>
		<li>${map.key3 }</li>
		<li>${map.key4 }</li>
	</ul>
	<p>${bean1 }</p>
	<ul>
		<li>${bean1.deptno }</li>
		<li>${bean1.dname }</li>
		<li>${bean1.loc }</li>
		<li>${""}</li>
	</ul>
</body>
</html>