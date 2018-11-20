<%@page import="com.oracle.webservices.internal.api.message.PropertySet.Property"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO"%>
<%@ page import = "user.User" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="user.User" scope ="page"/>
<jsp:setProperty name = "user" property = "userID"/>
<jsp:setProperty name = "user" property = "userPassword"/>
<jsp:setProperty name = "user" property = "userName"/>
<jsp:setProperty name = "user" property = "userGender"/>
<jsp:setProperty name = "user" property = "userEmail"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 엑션 페이징</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	if(user.getUserID() == null || user.getUserPassword() == null ||user.getUserName() == null||user.getUserGender() == null|| user.getUserEmail() == null){
		script.println("<script>");
		script.println("alert('내용을 채우지 않은 칸이 있습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		UserDAO userDao = new UserDAO();
		int result = userDao.join(user);
		if(result == -1){
			script.println("<script>");
			script.println("alert('데어베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			session.setAttribute("userID",user.getUserID());
			script.println("<script>");
			script.println("alert('회원가입 완료')");
			script.println("location.href('index.jsp')");
			script.println("</script>");
		}
		
	}
	%>
</body>
</html>