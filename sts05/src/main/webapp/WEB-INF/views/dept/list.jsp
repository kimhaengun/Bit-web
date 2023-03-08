<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/header.jspf" %>
</head>
<body>
<%@ include file="../template/menu.jspf" %>
	<ol class="breadcrumb">
  		<li><a href="${pageContext.servletContext.contextPath }/">Home</a></li>
  		<li class="active">list</li>
	</ol>
	<div class="page-header">
  		<h1>List page<small>dept list</small></h1>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>deptno</th>
				<th>dname</th>
				<th>loc</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="bean">
				<tr>
					<th><a href="#">${bean.deptno }</a></th>
					<th><a href="#">${bean.dname }</a></th>
					<th><a href="#">${bean.loc }</a></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p><a href="add" class="bn btn-primary btn-block">입력</a></p>
		
<%@ include file="../template/footer.jspf" %>
</body>
</html>