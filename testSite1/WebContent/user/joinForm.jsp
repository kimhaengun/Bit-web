<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<link href="../css/myProject.css" rel="stylesheet">
<title>Insert title here</title>
	<script type="text/javascript">
		var form,joinform, id, pw, checkPw, nickName, p;
		var check=false;
		var checkname;
		window.onload=function(){
			form = document.querySelector('form');
			joinform = document.querySelector('#joinform');
			id = document.querySelector('#id');
			pw = document.querySelector('#pw');
			checkPw = document.querySelector('#checkPw');
			nickName = document.querySelector('#nickName');
			
			//아이디 중복체크
			$('#checkBtn').click(function(){
					console.log('클릭');
						$.ajax({
							url:'over.do',
							data:{cmd:$('#id').val()},
							method:'get',
							contentType:'text/plain; encoding=UTF-8',
							dataType:"text",
						}).done(function(data){
							//응답
							if(data==='ok'){
								//동일 유저가 있음
								check=false;
								$('#joinform>span').text("*중복 아이디 입니다.");
							}else{
								//동일 유저 없음
								check=true;
								checkname=$('#id').val();
								console.log('check name, ',checkname);
								$('#joinform>span').text("*사용할 수 있는 아이디 입니다.");
								//$('#id').prop('readonly',true);
							}
						});
					return false;
					});
			
			
			//input Validation
			form.onsubmit=function(){
				console.log('form 클릭');

				
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
				if(check==false || id.value!=checkname){
					alert('아이디 중복 체크를 진행해 주세요');
					$('#checkBtn').show();
					return false;
				}
			
			
				return true;
			}
			
			
		}
	</script>
</head>
<body>
	<%@include file="../includes/menu.jsp" %>

	<form action="../user/dao/joinDao.jsp" method="post">
	<div id="content">
		<div id="jointext">회원가입</div>
		<div id="joinform">
				<span>*아이디 중복체크는 필수사항입니다.</span>

				<div>
					<div id="checkBtn">
						<a >중복체크</a>
					</div>	
					<input placeholder="아이디" type="text" name="id" id="id">

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