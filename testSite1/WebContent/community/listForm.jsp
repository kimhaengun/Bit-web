<%@page import="com.bit.dto.CommunityDto"%>
<%@page import="java.util.List"%>
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
    table>tbody>tr>td:nth-child(2)>a,table>tbody>tr>td:nth-child(3)>a {
    	text-decoration: none;
    	color: black;
	}
	table>tbody>tr>td:nth-child(2)>a:hover,
	table>tbody>tr>td:nth-child(3)>a:hover {
		text-decoration: underline;
		color: blue;
	}
</style>
<script type="text/javascript">
	//$('#contentRight').children().eq(1);
	$('#cmWriteBtn>a').click()
</script>
</head>
<body>

	<%@include file="../includes/menu.jsp" %>
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
                    <% 
                    	List<CommunityDto> list = null;
                    	list = (List<CommunityDto>)request.getAttribute("communityList");
                    	int listsize = list.size();
                    	for(CommunityDto dto : list){
                    		
                    %>
                        <tr>
                            <td><%=listsize%></td>
                            <td><a href="detail?communityNo=<%=dto.getCommunityNo() %>"><%=dto.getTitle() %></a></td>
                            <td><a href="#"><%=dto.getId() %></a></td>
                            <td><%=dto.getHiredate() %></td>
                            <td><%=dto.getCounts() %></td>
                        </tr>                   
                    <%
                    	listsize--;
                    	}
                    %>     
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
                	<%if(user.getId()==null || "".equals(user.getId())) {%>
                		<a href="../user/loginForm.jsp">글작성</a>
                	<%}else{ %>
						<a href="write">글작성</a>
					<%} %>
				</div>
              </div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>