<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<style type="text/css">
	.navbar-brand>img{
		height: 100%;
	}
	.modal-footer form {
		display: inline;
	}
</style>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
        <img alt="Brand" src="${pageContext.request.contextPath }/resources/imgs/logo2.jpg ">
      </a>
    </div>
    <a class="navbar-text text-uppercase" href="${pageContext.request.contextPath }/">home</a>
    <a class="navbar-text text-uppercase" href="${pageContext.request.contextPath }/intro">intro</a>
    <a class="navbar-text text-uppercase" href="${pageContext.request.contextPath }/dept/list">dept</a>
    <a class="navbar-text text-uppercase navbar-right" href="#">login</a>
  </div>
</nav>
<ol class="breadcrumb">
	<li><a href="${pageContext.request.contextPath }/">home</a></li>
	<li><a href="${pageContext.request.contextPath }/dept/list">List</a></li>
	<li class="active">Insert</li>
</ol>
<div class="page-header">
	<h1>Update page<small> Edit page</small></h1>
</div>

<form action="update" method="post">
  <div class="form-group">
    <label for="">deptno</label>
    <input type="text" class="form-control" id="deptno" placeholder="deptno" name="deptno" value="${bean.deptno }">
  </div>
  <div class="form-group">
    <label for="">dname</label>
    <input type="text" class="form-control" id="dname" placeholder="dname" name="dname" value="${bean.dname }">
  </div>
  <div class="form-group">
    <label for="">loc</label>
    <input type="text" class="form-control" id="loc" placeholder="loc" name="loc" value="${bean.loc}">
  </div>
<div class="btn-group btn-group-vertical btn-block" role="group" aria-label="...">
  <button type="submit" class="btn btn-primary">수정</button>
  <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#myModal">삭제</a>
  <button type="reset" class="btn btn-default">취소</button>
  <button type="button" class="btn btn-default" onclick="history.back();">뒤로</button>
 </div>
</form>

	


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">삭제 확인</h4>
      </div>
      <div class="modal-body">
        <p>삭제 하겟나</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <form action="delete" method="POST">
        	<input type="hidden" name="deptno" value="${bean.deptno }">
        	<button class="btn btn-danger" type="submit">삭제</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>