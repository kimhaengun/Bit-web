<%@page import="org.bson.types.ObjectId"%>
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
	<h1>상세페이지</h1>
	<%
		String id = request.getParameter("id");
		MongoClient client = new MongoClient("127.0.0.1");
		MongoDatabase db = client.getDatabase("lec32");
		MongoCollection<Document> coll = db.getCollection("bbs01");
		Document doc = new Document();
		doc.append("_id", new ObjectId(id));
		FindIterable<Document> rs = coll.find(doc);
		MongoCursor<Document> ite = rs.iterator();
		if(ite.hasNext()){
			doc = ite.next();
		}
	%>
		<p><%=doc.get("sub") %></p>
		<p><%=doc.get("content") %></p>
	<%
		
	%>
</body>
</html>