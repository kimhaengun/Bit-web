<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../template/header.jsp"></jsp:include>
	<jsp:include page="../template/menu.jsp"><jsp:param value=".." name="path"/></jsp:include>
				<!-- 내용시작부분 -->
				<h1>게시판</h1>
				<table width="80%">
					<tr>
						<th width="80">글번호</th>
						<th>제목</th>
						<th width="100">글쓴이</th>
						<th width="80">조회수</th>
					</tr>
					<%@page import="com.bit.*, java.sql.*" %>
					<%
						Connection conn = null;
									Statement stmt = null;
									ResultSet rs = null;
									String sql = "select * from bbs35 order by num desc";
									ArrayList<EmpBean> list = null;
									list = new ArrayList<EmpBean>();
									try{
										conn = LocalSql.getConnection();
										stmt = conn.createStatement();
										rs = stmt.executeQuery(sql);
										while(rs.next()){
											EmpBean bean = new EmpBean();
											bean.setNum(rs.getInt("num"));
											bean.setSub(rs.getString("sub"));
											bean.setId(rs.getString("id"));
											bean.setCnt(rs.getInt("cnt"));
											list.add(bean);
										}
									}finally{
										if(rs!=null)rs.close();
										if(stmt!=null)stmt.close();
										if(conn!=null)conn.close();
									}
									for(int i=0; i<list.size(); i++){
										EmpBean bean = list.get(i);
					%>
					<tr align="center">
						<td>
							<a href="detail.jsp?num=<%=bean.getNum()%>"><%=bean.getNum() %></a>
						</td>
						<td><%=bean.getSub() %></td>
						<td><%=bean.getId() %></td>
						<td><%=bean.getCnt() %></td>
					</tr>
					<% }%>
				</table>
				<p align="center">
					<a href="add.jsp">입력</a>
				</p>
				<!-- 내용끝부분 -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>