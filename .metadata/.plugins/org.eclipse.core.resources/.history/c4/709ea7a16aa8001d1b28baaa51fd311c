<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/myProject.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../includes/header.jsp">
		<jsp:param value=".." name="path"/>
	</jsp:include>
	<jsp:include page="../includes/menu.jsp">
		<jsp:param value=".." name="path"/>
	</jsp:include>
	
	<form action="../user/dao/loginDao.jsp" method="post">
	<div id="content">
		<div id="logintext">ID 로그인</div>
		<div id="loginform">
				<input placeholder="아이디" type="text" name="id">
				<input placeholder="비밀번호" type="password" name="pw">
				<a href="join.jsp">회원가입</a>
				<button type="submit">로그인</button>
		</div>
	</div>
	</form>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>