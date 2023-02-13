<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String path = request.getContextPath();
    %>
    <jsp:useBean id="user" class="com.bit.user.UserBean" scope="session"></jsp:useBean>
	<div id="header">
		<div id="loginForm">
			<%if(user.getId()==null||user.getId()=="") {%>
				<a href="<%=path %>/user/loginForm.jsp">로그인</a>
				<a href="<%=path %>/user/joinForm.jsp">회원가입</a>
			<%}else{ %>
				<div id="q"><%=user.getId() %></div>
				<a href="<%=path %>/user/logout.jsp">로그아웃</a>
			<%} %>
		</div>
		<h1>Logo</h1>
	</div>