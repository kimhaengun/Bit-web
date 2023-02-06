<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/myProject.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
	#content{
		
		background-color: red;
	}
</style>
</head>
<body>
	<jsp:include page="../includes/header.jsp">
		<jsp:param value=".." name="path"/>
	</jsp:include>
	<jsp:include page="../includes/menu.jsp">
		<jsp:param value=".." name="path"/>
	</jsp:include>
	<div id="content">
		<h1>Login</h1>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>