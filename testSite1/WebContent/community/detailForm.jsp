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
	#contentRightDetail{
		width:88%;
		height:100%;
        float:right;

	}
	#contentRightDetail>div:nth-child(1){
        font-size: 30px;
		text-align: center;
	}
	
	#contentRightDetail>div:nth-child(2){
        width: 100%;
        margin: 0px auto;
        text-align: left;
	}
	#detailFormContent{
		margin-top: 10px;
	}

	#detailtitledom>p{
		width: 95%;
		height: 30px;
		
		margin-top: 20px;
		
		font-size: 40px;
		font-weight: bold;
	}
	#detailcontentdom>textarea{
		margin-top: 10px;
		width: 98%;
		height: 300px;
		border-radius: 10px;
		overflow: auto;
		border: 2px solid #a9a9a9;
		font-size: 15px;
		padding: 5px;
	}
	#detailInfodom{
		margin-top:-20px;
		margin-bottom: -20px;
	}
	#detailInfodom>p:nth-child(2){
		font-weight: bold;
	}
	#detailInfodom>p, #detailInfodom>div, #detailInfodom>div>p{
		display: inline-block;
	}
	#detailInfodom>div{
		margin-left: 10px;
	}
	#detailInfodom>div>p{
		color: gray;
		font-size: 13px;
	}
	#detailfooterdom{
		margin-top: 10px;
	}
	#detailfooterdom>a {
		margin-left: 10px;
	}

}
</style>
<script type="text/javascript">
	$(function(){
		$('#detailfooterdom').find('a').last().click(function(){
			var url = $(this).attr('href');
			var param = url.substring(url.indexOf('?')+1);
			var url = url.substring(0,url.indexOf('?'));
			
			console.log(url+"\n"+param);
			if(confirm('삭제하시겠습니까')){
				$.post(url, param, function(){
					location.replace('list');
					
				});					
			}
			return false;
		})
	})
</script>
</head>
<body>


	<%@include file="../includes/menu.jsp" %>

	<div id="content_cm">
		<div id="contentLeft">
			<div>게시판</div>
		</div>
		<div id="contentRightDetail">
			<div>상세보기</div>
			<%
				CommunityDto dto = (CommunityDto)request.getAttribute("communityInfo");
			%>
			<div id="detailFormContent">
				<input type="hidden" name="id" value="<%=user.getId() %>"/>
	                <div id="detailtitledom">
	                    <p ><%=dto.getTitle() %></p>
	                </div>
	                <div id="detailInfodom">
	                	<p>작성자 :</p>
	                	<p><%=dto.getId() %></p>
	                	<div>
	                		<p>작성일 :</p>
	                		<p><%=dto.getHiredate() %></p>
	                	</div>
	                	<div>
		                	<p>조회수 :</p>
		               		<p><%=dto.getCounts() %></p>
	                	</div>
	                </div>
	                <div id="detailcontentdom">
	                    <textarea readonly/><%=dto.getContent() %></textarea>
	                </div>
	            <div id="detailfooterdom">
	            	<button>댓글</button>
	            	<%
	            		if(dto.getId().equals(user.getId())){ %>
	                		<a href="edit?communityNo=<%=dto.getCommunityNo()%>">수정</a>
		                	<a href="delete?communityNo=<%=dto.getCommunityNo()%>">삭제</a>
	                <%}%>
	            </div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>