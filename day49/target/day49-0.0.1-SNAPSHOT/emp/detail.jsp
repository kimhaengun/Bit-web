<%@page import="com.bit.model.EmpDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../template/head.jsp" %>
<script type="text/javascript">
$(function(){
	   var callback = function(){
	      history.back();
	   }
	   $('form button').eq(1).show();
	   $('form button').eq(2).hide();
	   $('form button').eq(3).click(callback);
	   $('form').one('submit',function(){
	      $('form button').eq(1).hide();
	      $('form button').eq(2).show();
	      $('form button').eq(3).off('click',callback).click(function(){
	         location.reload();
	      });
	      /*
	      $('form button').eq(3).click(function(){
	         location.reload();
	      });
	      */
	      $('.row>span').filter(":odd").each(function(idx,ele){
	         var val = $(this).html();
	         var name = $(this).prev().html();
	         if(idx==0)
	            $(this).html('<input name="'+name+'" value="'+val+'" readonly/>');
	         else if(idx!=4)
	            $(this).html('<input name="'+name+'" value="'+val+'"/>');
	      });
	      return false;
	   });
	})

</script>
</head>
<body>
	<%@include file="../template/header.jsp" %>
	<%@include file="../template/menu.jsp" %>
	<h2>상세페이지</h2>
	<%
		
		EmpDto bean=(EmpDto)request.getAttribute("bean");
	%>
	<form method="post">
	<input type="hidden" name="id" value="<%=bean.getId()%>">
	<div class="table">
		<div class="row">
			<span>empno</span>
			<span><%=bean.getEmpno() %></span>
			<span>ename</span>
			<span><%=bean.getEname() %></span>
		</div>
		<div class="row">
			<span>sal</span>
			<span><%=bean.getSal() %></span>
			<span>job</span>
			<span><%=bean.getJob() %></span>
			<span>hiredate</span>
			<span><%=bean.getHiredate() %></span>
		</div>
		<button class="btn">수정</button>
		<button class="btn" type="button">삭제</button>
		<button class="btn" type="reset">취소</button>
		<button class="btn" type="button">뒤로</button>
	</div>
	</form>
	<%@include file="../template/footer.jsp" %>
</body>
</html>