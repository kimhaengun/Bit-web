<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr >
			<td>
				<img alt="" src="imgs/logo.png" height="100">
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="gray">
				<a href="?title=home">home</a>
				<a href="?title=intro">INTRO</a>
				<a href="?title=/bbs/list">EMP</a>
				<a href="?title=/bbs/add">DEPT</a>
			</td>
		</tr>
		<tr>
			<td>
				<%
					boolean read = true;
					String title = request.getParameter("title");
					read = request.getParameter("read")!=null?false:true;
					title = title==null?"home":title;
					title+=".jsp";
				%>
				<jsp:include page="<%=title %>">
					<jsp:param value="<%=read %>" name="read"/>
				</jsp:include>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="gray">
				&copy; korea busan
			</td>
		</tr>
	</table>
</body>
</html>