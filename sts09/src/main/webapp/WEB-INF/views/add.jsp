<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Home</title>
</head>
<body>
<form action="./" method="post">
	<div>
		<input name="deptno" />
	</div>
	<div>
		<input name="dname" />
	</div>
	<div>
		<input name="loc" />
	</div>
	<div>
		<button>입력</button>
	</div>
</form>
</body>
</html>
