<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="template/header.jspf" %>
</head>
<body>
<%@include file="template/menu.jspf" %>

<div class="jumbotron">
  <h1>안녕!</h1>
  <p>My Site</p>
</div>

<%@include file="template/footer.jspf" %>
</body>
</html>