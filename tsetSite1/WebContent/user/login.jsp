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
		
		width: 500px;
		margin: 30px auto;
	}
	#logintext{
		font-size: 20px;
		font-weight: bold;
	}
	#loginform{
		border:2px solid gray;
		width: 500px;
		border-radius: 10px;
	}
	#loginform>input{
		width:95%;
		margin:20px 10px 10px 10px;
		font-size: 20px;
	}
	#loginform>a{
		display:inline-block;
		text-decoration: none;
		color: #29B6F6;
		margin-left: 10px;
	}
	#loginform>button{
		height: 50px;
		margin: 10px 10px 20px 10px; 
		width: 480px;
		font-size: 30px;
		background-color: #0c1254;
		border:0px;
		border-radius: 10px;
		color: white;
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
	<form action="">
	<div id="content">
		<div id="logintext">ID 로그인</div>
		<div id="loginform">
				<input placeholder="아이디" type="text" name="id">
				<input placeholder="비밀번호" type="password" name="password">
				<a href="join.jsp">회원가입</a>
				<button>로그인</button>
		</div>
	</div>
	</form>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>