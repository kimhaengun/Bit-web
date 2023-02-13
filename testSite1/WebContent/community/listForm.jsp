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
	}
    table{
        width: 100%;
        margin: 0px auto;
        text-align: center;
        border-top: 2px solid black;
        border-bottom: 2px solid black;
        border-collapse: collapse;
    }
    table>thead>tr>td{
        font-size: 20px;
        font-weight: bold;
        background-color: rgb(230,230,250);
    }
    table>thead>tr>td:nth-child(1),table>thead>tr>td:nth-child(5){
        width: 10%;
    }
    table>thead>tr>td:nth-child(2){
        width: 50%;
    }
    table>thead>tr>td:nth-child(3){
        width: 15%;
    }
    table>thead>tr>td:nth-child(4){
        width: 15%;
    }
    th, td{
        height:33px;
        border-top: 1px solid #f2f2f2;
    }
    .pagination {
        text-align: center;
        margin-top: 10px;
        position: relative;
    }

    .pagination a {
        display: inline-block;
        color: black;
        padding: 8px 16px;
        text-decoration: none;
        }

    .pagination a.active {
    background-color: #4CAF50;
    color: white;
    border-radius: 5px;
    }

    .pagination a:hover:not(.active) {
    background-color: #ddd;
    border-radius: 5px;
    }
    #cmWriteBtn{
    	float: right;
    	position: absolute;
    	right: 10px;
    	top: 2px;
    	border-radius: 5px;
    }
    #cmWriteBtn>a{
        background-color: #0c1254;
    	color: white;
    	font-size: 15px;
    	height: 20px;
    	width: 70px;
    }
</style>
<script type="text/javascript">
	//$('#contentRight').children().eq(1);
	$('#cmWriteBtn>a').click()
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
				<table>
                    <thead>
                        <tr>
                            <td></td>
                            <td>제목</td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수 </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>111</td>
                        </tr>
                        <tr>
                            <td>15</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>1111</td>
                        </tr>
                        <tr>
                            <td>111</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>11111</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>11111</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>11111</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>11111</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>11111</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>11111</td>
                            <td>제목1</td>
                            <td>테스트1</td>
                            <td>2023=02=11</td>
                            <td>4</td>
                        </tr>
                        
                    </tbody>
                </table>
			</div>

            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">7</a>
                <a href="#">8</a>
                <a href="#">9</a>
                <a href="#">10</a>
                <a href="#">&raquo;</a>
                <div id="cmWriteBtn">
					<a href="writeForm.jsp">글작성</a>
				</div>
              </div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>