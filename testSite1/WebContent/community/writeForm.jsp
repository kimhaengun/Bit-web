<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/myProject.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<style type="text/css">
	
	#content_cm{
		width: 1000px;
		height: 500px;
		margin: 10px auto; 
		border: 2px solid #a9a9a9;
		border-radius: 10px;
		padding:10px;
	}
	#contentLeft{
		width:10%;
		height:100%;
		border-right: 2px solid #a9a9a9;
		text-align: center;
        float: left;
	}
	#contentLeft>div{
        margin-top: 36px;
		font-size: 20px;
		font-weight: bold;
	}
	#contentRight{
		width:88%;
		height:100%;
        float: right;
        

	}
	#contentRight>div:nth-child(1){
        font-size: 30px;
		text-align: center;
	}
	
	#contentRight>div:nth-child(2){
        width: 100%;
        margin: 10px auto;
        text-align: center;
	}
	#cmWriteFormContent{
		margin-top: 10px;
	}
	#cmWriteFormContent>div>button{
		width: 150px;
		height: 40px;
		margin-top: 12px;
		color: white;
		background-color: #0c1254;
		font-size: 20px;
		border-radius: 10px;
	}
	#titledom>input{
		width: 95%;
		height: 60px;
		border: 2px solid #a9a9a9;
		margin-top: 10px;
		border-radius: 10px;
		font-size: 20px;
		font-weight: bold;
	}
	#contentdom>textarea{
		margin-top: 10px;
		width: 95%;
		height: 300px;
		border-radius: 10px;
		overflow: auto;
		border: 2px solid #a9a9a9;
		font-size: 15px;
	}

}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>


	<%@include file="../includes/menu.jsp" %>
	<%
		//로그인 안된 사용자 글쓰기 접근 시 로그인 페이지로 이동
		if("GET".equals(request.getMethod())){
			if(user.getId()==null||"".equals(user.getId())){
				response.sendRedirect("../user/loginForm.jsp");
			}
		}
	%>
	<form action="../community/write" method="post">
	<div id="content_cm">
		<div id="contentLeft">
			<div>게시판</div>
		</div>
		<div id="contentRight">
			<div>작성</div>
			<div id="cmWriteFormContent">
				<input type="hidden" name="id" value="<%=user.getId() %>"/>
	                <div id="titledom">
	                    <input  placeholder="제목을 입력해 주세요" name="title" />
	                </div>
	                <div id="contentdom">
	                    <textarea placeholder="내용을 입력해 주세요" name="content"/></textarea>
	                </div>
	            <div>
	                <button>등록</button>
	            </div>
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>