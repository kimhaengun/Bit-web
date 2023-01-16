<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
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
		Enumeration en = request.getParameterNames();
		while(en.hasMoreElements()){
			System.out.println(en.nextElement());
		}
		Map map = request.getParameterMap();
		Set<java.util.Map.Entry> set = map.entrySet();
		Iterator<java.util.Map.Entry> ite = set.iterator();
		while(ite.hasNext()){
			java.util.Map.Entry<String, String[]> entry = ite.next();
			System.out.println(entry.getKey()+":"+java.util.Arrays.toString(entry.getValue()));
		}
	%>
	<h1>사용자 요청 파라미터(쿼리스트링)</h1>
	<p>id:<%=request.getParameter("id") %></p>
	<p>pw:<%=request.getParameter("pw") %></p>
	<p>ta:<%=request.getParameter("ta") %></p>
	<p>ra:<%=request.getParameter("ra") %></p>
	<!-- 체크 박스 -->
	<p>ch:
		<%
			String[] values = request.getParameterValues("ch");
			out.print(java.util.Arrays.toString(values));
		 %>
	</p>
	<p>select:<%=request.getParameter("sel") %></p>
	
</body>
</html>