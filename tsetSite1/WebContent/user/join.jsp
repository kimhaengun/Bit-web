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
	#jointext{
		font-size: 20px;
		font-weight: bold;
	}
	#joinform{
		border:2px solid gray;
		width: 500px;
		border-radius: 10px;
	}
	#joinform>p{
		
		color: red;
		margin: 0px 0px 10px 10px;
	}
	#joinform>input{
		width:95%;
		margin:0px 10px 5px 10px;
		font-size: 20px;
	}
	#joinform>div{
		margin-bottom: 5px;
	}
	#joinform>div>input{
		margin-left:10px;
		margin-top:20px;
		font-size: 20px;
		width: 80%;
	}
	#joinform>div>button{
		height: 30px;
		background-color: 
	}
	#joinform>a{
		display:inline-block;
		text-decoration: none;
		color: #29B6F6;
		margin-left: 10px;
	}
	#joinform>button{
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
	
	<form action="../user/dao/joinDao.jsp" method="post">
	<div id="content">
		<div id="jointext">회원가입</div>
		<div id="joinform">
				<div>
					<input placeholder="아이디" type="text" name="userId">
					<button>중복체크</button>
				</div>
				<p>아이디를 입력해주세요</p>
				<input placeholder="비밀번호" type="password" name="userPw">
				
				<input placeholder="비밀번호 확인" type="password" name="checkPw">

				<input placeholder="닉네임" type="text" name="userNickName">

				<button type="submit">회원가입</button>
		</div>
	</div>
	</form>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>