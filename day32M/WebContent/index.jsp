<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="java.net.ServerSocket"%>
<%@page import="com.mongodb.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>list page</h1>
		<dl>
		
		<%
			//객체 생성
			MongoClient client = new MongoClient("127.0.0.1");
			MongoDatabase db = client.getDatabase("lec32");
			MongoCollection<Document> coll = db.getCollection("bbs01");
			//쿼리 실행
			Document doc = new Document();
			//sort의 기준 / 1 = 순서대로, -1 = 역순
			doc.append("_id", -1);
			FindIterable<Document> rs = coll.find().sort(doc).skip(0).limit(5);
			MongoCursor<Document> ite = rs.iterator();
			while(ite.hasNext()){
				doc = ite.next();
		%>
			<dt><a href="detail.jsp?id=<%=doc.get("_id")%>"><%=doc.get("sub") %></a></dt>
			<dd><%=doc.get("content")%></dd>
		<%
			}
		%>
		</dl>
		<p>
			<a href="add.jsp" >입력</a>
		</p>
</body>
</html>