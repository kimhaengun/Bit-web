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
	<%
		//객체 생성
		MongoClient client = new MongoClient("127.0.0.1");
		MongoDatabase db = client.getDatabase("lec32");
		//테이블 생성
		//db.createCollection("bbs01");
		MongoCollection<Document> coll = db.getCollection("bbs01");
		//쿼리 실행
		Document doc = new Document();
		doc.append("sub", request.getParameter("sub"));
		doc.append("content", request.getParameter("content"));
		coll.insertOne(doc);
		
		
	
		
	
		response.sendRedirect("./");
	%>
</body>
</html>