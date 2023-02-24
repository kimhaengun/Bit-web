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
</style>
<script type="text/javascript">
	//$('#contentRight').children().eq(1);
	$(function(){
		//class="active"
	})
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
                    	if(list.size()>0){
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
                    	}else{
                    %>  
                       <tr>
                            <td>현재 데이터가 없습니다.</td>
                           
                        </tr>
                    <%} %>       
                    </tbody>
                </table>
			</div>

            <div class="pagination">
            <%
            	int start=0;
            	if(list.size()<1){
            		start=0;
   					CommunityDto dt = new CommunityDto();
            		dt.setPageCount(10);
            		list.add(dt);
            	}else{
            		
            	start = 0+5*((list.get(0).getPageCount()-1)/5);
            	}
            	int end = start+5;
            	if(end>(list.get(0).getPageCount())){
            		end=list.get(0).getPageCount();
            	}
            	
            %>
                <a href="#">&laquo;</a>
            <%	 %>
            <% 
            	String select = "";

            	for(int i = start; i<end; i++){
            		if((i+1)==list.get(0).getPage()){
            			select="active";
            		}else{
            			select="";
            		}
            %>
                <a href="list?page=<%=i+1 %>" class="<%=select%>"><%=i+1 %></a>
            <% }%>
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