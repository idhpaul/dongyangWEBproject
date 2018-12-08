<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%
	session.invalidate();
	//경로 바꿔줄것(절대경로)
	response.sendRedirect("/dongyang/index.jsp");
%>