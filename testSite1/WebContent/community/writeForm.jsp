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
	                    <input  placeholder="제목을 입력해 주세요" name="title"  required/>
	                </div>
	                <div id="contentdom">
	                    <textarea placeholder="내용을 입력해 주세요" name="content" required/></textarea>
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