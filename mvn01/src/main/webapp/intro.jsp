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
	#content .box{
		margin: 10px auto;
		width: 80%;
		background-color: aqua;
		border-radius: 10px;
		padding: 50px;
	}
	#content .box>h1{
		color: white;
	}
	#content .box>p{
		text-align: right;
	}
	#content .box>p>a{
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
	#footer{}
</style>
</head>
<body>

	<div class="container">
		<div id="header">
			<h1>비트</h1>
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
			<div class="box">
				<h2>Intro</h2>
				<p><a href="<%=root%>/emp/list.do">게시판</a></p>
			</div>
		</div>
		<div id="footer">
			Copyright © NAVER Corp. All Rights Reserved.
		</div>		
	</div>
</body>
</html>