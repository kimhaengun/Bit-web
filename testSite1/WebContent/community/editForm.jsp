<%@page import="com.bit.dto.CommunityDto"%>
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
		CommunityDto dto = (CommunityDto)request.getAttribute("dto");
		if("GET".equals(request.getMethod())){
			//로그인 안된 사용자 글쓰기 접근 시 로그인 페이지로 이동
			if(user.getId()==null||"".equals(user.getId())){
				response.sendRedirect("../user/loginForm.jsp");
			}
			//게시글 id와 로그인한 id가 다를 시 리스트 페이지로 이동
			if(!dto.getId().equals(user.getId())){
				response.sendRedirect("list");
			}
		}
	%>
	<form action="../community/edit" method="post">
	<div id="content_cm">
		<div id="contentLeft">
			<div>게시판</div>
		</div>
		<div id="contentRight">
			<div>수정</div>
			<div id="cmWriteFormContent">
				<input type="hidden" value="<%=dto.getCommunityNo() %>" name="communityNo"/>
				<input type="hidden" name="id" value="<%=user.getId() %>"/>
	                <div id="titledom">
	                    <input  value="<%=dto.getTitle() %>" name="title" />
	                </div>
	                <div id="contentdom">
	                    <textarea name="content"/><%=dto.getContent() %></textarea>
	                </div>
	            <div>
	                <button>수정</button>
	            </div>
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>