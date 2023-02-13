<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/myProject.css" rel="stylesheet">
<title>Insert title here</title>
	<script type="text/javascript">
		var form,joinform, id, pw, checkPw, nickName, p;
		window.onload=function(){
			form = document.querySelector('form');
			joinform = document.querySelector('#joinform');
			id = document.querySelector('#id');
			pw = document.querySelector('#pw');
			checkPw = document.querySelector('#checkPw');
			nickName = document.querySelector('#nickName');
			
			form.onsubmit=function(){
				console.log('form 클릭');
				console.log(document.querySelector('#name'));
				
				for(ele of form.querySelectorAll('div')) {
					p = ele.querySelector('p');
					if(p) p.parentElement.removeChild(p);
				};
				
				// id값 없을 경우
				if(id.value==''){
					p = document.createElement('p');
					p.appendChild(document.createTextNode('*아이디를 입력해주세요.'));
					id.parentElement.appendChild(p);
					return false;
				}
				// pw값 없을 경우
				if(pw.value==''){
					p = document.createElement('p');
					p.appendChild(document.createTextNode('*비밀번호를 입력해 주세요.'));
					pw.after(p);
					return false;
				}
				// checkPw값 없을 경우
				if(checkPw.value==''){
					p = document.createElement('p');
					p.appendChild(document.createTextNode('*비밀번호 확인을 입력해주세요'));
					checkPw.after(p);
					return false;
				}
				// pw, checkPw 값이 다를 경우
				if(pw.value != checkPw.value){
					p = document.createElement('p');
					p.appendChild(document.createTextNode('*비밀 번호가 틀립니다.'));
					checkPw.after(p);
					return false;
				}
				// name값 없을 경우
				if(nickName.value==''){
					console.log('이름 없');
					p = document.createElement('p');
					p.appendChild(document.createTextNode('*이름을 입력해 주세요'));
					nickName.after(p);
					return false;
				}
				return true;
			}
			
		}
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
					<input placeholder="아이디" type="text" name="id" id="id">
					<button type="reset">중복체크</button>
				</div>
				<div>
					<input placeholder="비밀번호" type="password" name="pw" id="pw">
				</div>
				<div>
					<input placeholder="비밀번호 확인" type="password" name="checkPw" id="checkPw">
				</div>
				<div> 
					<input placeholder="이름" type="text" name="nickName" id="nickName">
				</div>
				<button type="submit">회원가입</button>
		</div>
	</div>
	</form>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
</body>
</html>