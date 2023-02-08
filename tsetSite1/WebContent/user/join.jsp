<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/myProject.css" rel="stylesheet">
<title>Insert title here</title>
	<script type="text/javascript">
		var form
	</script>
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
					<input placeholder="아이디" type="text" name="id">
					<button>중복체크</button>
				</div>
				<p>아이디를 입력해주세요</p>
				<input placeholder="비밀번호" type="password" name="pw">
				
				<input placeholder="비밀번호 확인" type="password" name="checkPw">

				<input placeholder="닉네임" type="text" name="nickName">

				<button type="submit">회원가입</button>
		</div>
	</div>
	</form>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>