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
		display:inline-block;
		border-right: 2px solid #a9a9a9;
		text-align: center;
	}
	#contentLeft>div{
		margin-top: 36px;
		font-size: 20px;
		font-weight: bold;
	}
	#contentRight{
		border:1px solid black;
		width:88%;
		height:100%;
		display:inline-block;
	}
	#contentRight div:nth-child(1){
		text-align: center;
	}
	
	#contentRight div:nth-child(2){
		background-color: black;
	}
</style>
<script type="text/javascript">
	//$('#contentRight').children().eq(1);
</script>
</head>
<body>
	<jsp:include page="../includes/header.jsp">
		<jsp:param value=".." name="path"/>
	</jsp:include>
	
	<jsp:include page="../includes/menu.jsp">
		<jsp:param value=".." name="path"/>
	</jsp:include>
	
	<div id="content_cm">
		<div id="contentLeft">
			<div>게시판</div>
		</div>
		<div id="contentRight">
			<div>목록</div>
			<div>
				맞냐
			</div>
			<div>
				페이징
			</div>
		</div>
	</div>
</body>
</html>