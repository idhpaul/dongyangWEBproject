<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO"%>
<%@ page import = "user.User" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="user.User" scope ="page"/>
<jsp:setProperty name = "user" property = "userID"/>
<jsp:setProperty name = "user" property = "userPassword"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 엑션 페이징</title>
</head>
<body>
	<%
	UserDAO userDao = new UserDAO();
	int result = userDao.login(user.getUserID(), user.getUserPassword());
	if(result == 1){
		PrintWriter script = response.getWriter();
		session.setAttribute("userID",user.getUserID());
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>