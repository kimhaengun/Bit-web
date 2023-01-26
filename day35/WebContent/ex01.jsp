<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- jsp:include는 독립적으로 실행되기 때문에 위에 선언된 su를 다른 jsp에서 쓰지 못함 -->
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/menu.jsp">
		<jsp:param value="." name="path"/>
	</jsp:include>
				<!-- 내용시작부분 -->
				<img alt="" src="/day35/imgs/seulmap.png" width="80%">
				<!-- 내용끝부분 -->
	<jsp:include page="template/footer.jsp"></jsp:include>

</body>
</html>