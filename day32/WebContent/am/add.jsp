<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="100%">
		<tr>
			<td><img alt="logo" src="/day32/imgs/logo.png" height="100"></td>
		</tr>
		<tr>
			<td background="/day32/imgs/mn.png" >
				<p align="center">
					<a href="/day32/">HOME</a>
					<a href="/day32/am/list.jsp">AM</a> 
					<a href="/day32/pm/list.jsp">PM</a>
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 내용작성 --> 
				<h1 align="center">입력 페이지</h1>
				<form action="insert.jsp">
				<table align="center">
					<tr>
						<td>제목</td>
						<td><input type="text" name="sub" placeholder="제목 입력"></td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="id" placeholder="이름 입력"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="content" cols="40" rows="5"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="입력">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
				</form>
				<!-- 내용끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="6" background="/day32/imgs/footer.png">
				<p>&copy;88888888888888888888888888</p>
			</td>
		</tr>
	</table>
</body>
</html>