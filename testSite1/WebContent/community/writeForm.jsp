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
        margin-bottom: 10px;
	}
	
	#contentRight>div:nth-child(2){
        width: 100%;
        margin: 0px auto;
        text-align: center;
        background-color: #a9a9a9;
	}
</style>
<script type="text/javascript">
	
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
			<div>작성</div>
			<div id="cmWriteFormContent">
                <div>
                    <input  placeholder="제목을 입력해 주세요"/>
                </div>
                <div>
                    <input placeholder="내용을 입력해 주세요"/>
                </div>
			</div>
            <div>
                <button>수정</button>
                <button>삭제</button>
                <button>글작성</button>
            </div>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>