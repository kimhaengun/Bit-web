<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>파일업로드</h1>
	<form method="post" enctype="multipart/form-data">
		<div>
			<label>name</label>
			<input name="name"/>
		</div>
		<div>
			<label>File</label>
			<input type="file" name="file1"/>
		</div>
		<div>
			<button>전송</button>
		</div>
	</form>
</body>
</html>