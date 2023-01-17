<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body background="imgs/bg.jpg">
	<table width="800" align="center" style="background: white">
		<%@ include file="header.jsp"%>	
		<%@ include file="menu.jsp"%>
		<tr align="center">
			<td colspan="6" valign="top" height="500">
				<h1 >게시판</h1>
				<form action="insert.jsp">
				<table >
					<tr>
						<td>제목</td>
						<td><input type="text"	name="sub"></td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td><input type="text"	name="id"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="content" cols="30" rows="10"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="입력">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
				</form>
				
			</td>
		</tr>
		<%@ include file="footer.jsp"%>	
	</table>
</body>
</html>