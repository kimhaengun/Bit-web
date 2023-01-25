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
			<td align="center">
				<h1>학생성적관리프로그램(web)</h1>	
			</td>
		</tr>
		<tr>
			<td bgcolor="gray" align="center">
				<p>
				<a href="../" style="">home</a>
				<a href="./list.jsp" style="">list</a>
				<a href="./add.jsp" style="">insert</a>
				<a href="#" style="">etc</a>
				</p>				
			</td>
		</tr>
		<tr>
			<td align="center">
				<h2>학생 성적 입력</h2>
				<form action="insert.jsp">
				<table width="600" align="center">
					<tr>
						<td>국어</td>
						<td><input type="text" name="kor"></td>
					</tr>
					<tr>
						<td>영어</td>
						<td><input type="text" name="eng"></td>
					</tr>
					<tr>
						<td>수학</td>
						<td><input type="text" name="math"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="입력">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
		<tr>
			<td bgcolor="gray" align="center">
				&copy; dqwkdjwqldhwqkdhwqiyghqygdwqhbdwq
			</td>
		</tr>
	</table>
</body>
</html>