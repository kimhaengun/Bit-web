<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String path = request.getParameter("path");
    %>
	<div id="menu">
		<ul>
			<li><a href="<%=path %>/index.jsp">HOME</a></li>
			<li><a href="<%=path %>/community/listForm.jsp">게시물</a></li>
		</ul>
	</div>