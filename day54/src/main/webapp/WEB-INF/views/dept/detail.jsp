<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../template/menu.jspf" %>
	<h1>상세페이지</h1>
	<form action="update.do">
		<div>
			<label>deptno</label>
			<input name="deptno" value="${bean.deptno }">
		</div>
		<div>
			<label>dname</label>
			<input name="dname" value="${bean.dname }">
		</div>
		<div>
			<label>loc</label>
			<input name="loc" value="${bean.ename }">
		</div>
		<div>
			<button>수정</button>
		</div>
	</form>
</body>
</html>