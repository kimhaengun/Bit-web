<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/menu.jspf" %>
	<h1>리스트페이지</h1>
	<table>
		<thead>
			<tr>
				<td>deptno</td>
				<td>dname</td>
				<td>loc</td>				
			</tr>
		</thead>
      <tbody>
         <c:forEach items="${list }" var="bean">
            <tr>
               <c:url value="detail.do" var="detail">
                  <c:param name="deptno" value="${bean.deptno }"></c:param>
               </c:url>
               <td><a href="${detail}">${bean.deptno }</td>
               <td>${bean.dname}</td>
               <td>${bean.ename }</td>
            </tr>
         </c:forEach>
      </tbody>

	</table>
</body>
</html>