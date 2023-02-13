<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.model.EmpDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String root = request.getContextPath();
%>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	.container{
		width: 800px;
	}
	.container>div{}
	#header{
		overflow: hidden;
	}
	#header>h1{
		width: 205px;
		height: 42px;
		background-image: url("<%=root%>/imgs/logo2.jpg");
		text-indent:-999px;
		float: left;
	}
	#header>div{
		float: right;
	}
	#header>div>form{}
	#header>div>form button, #header>div>form a{
		border: 1px solid gray;
		border-radius: 2px;
		padding: 2px;
		background-color: darkgreen;
		color:#333333;
		text-decoration: none;
		font-size: 12px;
		display: inline-block;
	}
	#menu{
		background-color: gray;
	}
	#menu>ul{
		list-style: none;
		overflow: hidden;
		width: 400px;
		margin: 0px auto;
	}
	#menu>ul>li{
		float: left;
		width: 100px;
	}
	#menu>ul>li>a{
		display: block;
		height: 35px;
		border: 1px solid darkgray;
		box-sizing: border-box;
		text-align: center;
		line-height: 35px;
		text-decoration: none;
		color: white;
	}
	#content{}
	#content>h2{}
	#content>h2+form{}
	#content>h2+form>div{
		width:410px;
		margin: 10px auto;
	}
	#content>h2+form>div>span{
		display: inline-block;
		width: 100%;
		height: 35px;
		line-height: 40px;
	}	
	#content>h2+form>div>span:nth-child(2n){
		border-bottom: 1px solid gray;
	}
	#content>h2+form>div>span:nth-child(2n-1){
		border-left: 5px solid gray;
		padding-left: 5px;
		color: #333333;
	}
	#content>h1+form>div:last-child{
	}
	#content>div>div>a{
		text-shadow:-2px -2px 4px #000000;
		margin:50px auto;
		box-shadow:1px 1px 5px gray;
		text-align: right;
		display: inline-block;
		width: 100px;
		height: 50px;
		background-color: darkgreen;
		border-radius: 3px;
		text-align: center;
		line-height: 50px;
		color: white;
		font-weight: bold;
		text-decoration: none;
	}
	#content>h2+form>div>a:nth-child(2){
		background-color: red;
	}
	#footer{}
</style>
<script type="text/javascript" src="<%=root%>/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#content')
			.find('a')
			.last().click(function(){
				history.back();
			})
	})
</script>
</head>
<body>

	<div class="container">
		<div id="header">
			<h1>비트교육센터</h1>
			<div>
				<form action="<%=root%>/user/result.do">
					<label>id</label><input/>
					<label>pw</label><input type="password"/>
					<button>login</button>
					<a href="<%=root%>/user/join.do">join</a>					
				</form>
			</div>
		</div>
		<div id="menu">
			<ul>
				<li><a href="<%=root%>/">HOME</a></li>
				<li><a href="<%=root%>/intro.do">INTRO</a></li>
				<li><a href="<%=root%>/emp/list.do">EMP</a></li>
				<li><a href="<%=root%>/user/login.do">LOGIN</a></li>
			</ul>
		</div>
		<div id="content">
		<%@ page import="com.bit.model.EmpDto" %>
		<%
			EmpDto bean=(EmpDto)request.getAttribute("dto");
		%>
				<h2><%=bean.getEmpno() %> 정보</h2>
				<form method="post">
					<input type="hidden" name="empno" value="<%=bean.getEmpno() %>">
					<div>
						<span>ename</span>
						<span><input name="ename" value="<%=bean.getEname() %>"/></span>
					</div>
					<div>
						<span>hiredate</span>
						<span><%=bean.getHiredate() %></span>
					</div>
					<div>
						<span>sal</span>
						<span><input name="sal" value="<%=bean.getSal() %>"/></span>
						<span>comm</span>
						<span><input name="comm" value="<%=bean.getComm() %>"/></span>
					</div>
					<div>
						<span>job</span>
						<span><%=bean.getJob() %></span>
						<span>mgr</span>
						<span><input name="mgr" value="<%=bean.getMgr() %>"/></span>
					</div>
					<div>
						<button>수정</button>
						<button type="reset">취소</button>
						<button type="button">뒤로</button>
					</div>
				</form>
				
		</div>
		<div id="footer">
			Copyright © NAVER Corp. All Rights Reserved.
		</div>		
	</div>
</body>
</html>