<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/myProject.css" rel="stylesheet">
<title>Insert title here</title>
	<script type="text/javascript">
		var form, loginform, id, pw, p;
		window.onload=function(){
			form = document.querySelector('form');
			id = document.querySelector('#id');
			pw = document.querySelector('#pw');
			
			form.onsubmit=function(){
				for(ele of form.querySelectorAll('div')) {
					p = ele.querySelector('p');
					if(p) p.parentElement.removeChild(p);
				};
				
				//id값 없을 경우
				if(id.value==''){
					p = document.createElement('p');
					p.appendChild(document.createTextNode('*회원 아이디를 입력해주세요.'));
					id.parentElement.appendChild(p);
					return false;
				}
				//pw값 없을 경우
				if(pw.value==''){
					p = document.createElement('p');
					p.appendChild(document.createTextNode('*회원 비밀번호를 입력해주세요.'));
					pw.parentElement.appendChild(p);
					return false;
				}
				return true;
			}
		};
	</script>
</head>
<% 
	String result="";
	if("GET".equals(request.getMethod())){		
		if(("false").equals(request.getParameter("Result"))){
				result="로그인 실패하였습니다.";
		}
	}
	System.out.println(result);
%>
<body>
	<%@include file="../includes/menu.jsp" %>
	<form action="../user/dao/loginDao.jsp" method="post">
	<div id="content">
		<div id="logintext">ID 로그인</div>
		<div id="loginform">
			<div>
				<input placeholder="아이디" type="text" name="id" id="id">
			</div>
			<div>
				<input placeholder="비밀번호" type="password" name="pw" id="pw">
			</div>
				<p>
					<%=result %>
				</p>
				<a href="joinForm.jsp">회원가입</a>
				<button type="submit">로그인</button>
		</div>
	</div>
	</form>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>