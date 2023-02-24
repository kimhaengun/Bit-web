<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../template/head.jsp" %>
<style type="text/css">
	form{
		width: 50%;
		margin: 0px auto;
		display: block;
	}
	.btn{
		width: 100%;
		
	}
	form>div{
		margin-bottom: 5px;
	}
	form>div>label{
		display:inline-block;
		width: 35%;
	}
	form>div>input{
		width: 61%;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$(':button').click(function(){
			history.back();
		});
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../template/header.jsp" %>
	<%@include file="../template/menu.jsp" %>
	<h1>입력</h1>
	<form method="post">
		<div>
			<label>empno</label>
			<input name="empno"/>
		</div>
		<div>
			<label>ename</label>
			<input name="ename"/>
		</div>
		<div>
			<label>job</label>
			<input name="job"/>
		</div>
		<div>
			<label>sal</label>
			<input name="sal"/>
		</div>
		<div>
			<button class="btn">submit</button>
			<button class="btn" type="reset">reset</button>
			<button class="btn" type="button">back</button>
		</div>
	</form>
	<%@include file="../template/footer.jsp" %>
</body>
</html>