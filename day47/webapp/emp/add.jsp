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
	#content>form{
		display: black;
		width: 500px;
		margin: 10px auto;
	}
	#content>form>div{
		margin-bottom: 10px;
	}
	#content>form>div>label{
		display: inline-block;
		width: 200px;
	}
	#content>form>div>input{
		width: 280px;
		box-sizing: border-box;
	}
	#content>form>div:last-child{
		text-align: center;
	}
	
	#footer{}
</style>
<script type="text/javascript" src="<%=root%>/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#content')
			.find('input').eq(0).focus()
			.end()
			.end()
			.find('button').last().click(function(){
				history.back();
			})
	})
</script>
</head>
<body>

	<div class="container">
		<div id="header">
			<h1>??????????????????</h1>
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
				<h2>EMP INSERT</h2>
				<form action="" method="post">
					<div>
						<label>empno</label>
						<input name="empno"/>
					</div>
					<div>
						<label>ename</label>
						<input name="ename"/>
					</div>
					
					<div>
						<label>sal</label>
						<input name="sal"/>
					</div>
					<div>
						<button>??????</button>
						<button type="submit">??????</button>
						<button type="reset">??????</button>
					</div>
					
				</form>
		</div>
		<div id="footer">
			Copyright ?? NAVER Corp. All Rights Reserved.
		</div>		
	</div>
</body>
</html>