<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" >
	<%
		Object cookID = request.getAttribute("cookID");
		Object cookCk = request.getAttribute("cookCk");
		if(cookID==null){
			cookID=new String();
		}
		if(cookCk==null){
			cookCk=new String();
		}
	%>
		<div>
			<label>id</label>
			<input name="id" value="<%= cookID %>"/>
		</div>
		<div>
			<label>pw</label>
			<input name="pw" type="password"/>
		</div>
		<div>
			<button>로그인</button>
		</div>
		<div>
			<input type="checkbox" name="ck" <%=cookCk %>/>아이디 저장
		</div>
	</form>
</body>
</html>