<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<table width="100%">
		<tr>
			<td>
			<jsp:useBean id="login" class="com.bit.UserBean" scope="session"></jsp:useBean>
			<%if(login.isResult()){ %>
			<p>
				<jsp:getProperty property="id" name="login"/>님 접송중
			</p>
			<%}else{%>
			<p>로그인 안한 사용자</p>
			<%
			}
				%>
			<img alt="" src="/day35/imgs/logo.jpg" height="120"></td>
		</tr>
