<%@page import="com.oracle.webservices.internal.api.message.PropertySet.Property"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO"%>
<%@ page import = "user.User" %>
<%@ page import = "java.io.PrintWriter" %>

<jsp:useBean id = "user" class="user.User" scope ="page">
	<jsp:setProperty name = "user" property = "userId"/>
	<jsp:setProperty name = "user" property = "userPassword"/>
	<jsp:setProperty name = "user" property = "userName"/>
	<jsp:setProperty name = "user" property = "userGender"/>
	<jsp:setProperty name = "user" property = "userEmail"/>
	<jsp:setProperty name = "user" property = "admin"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 엑션 페이징</title>
</head>
<body>
<%
	PrintWriter script = response.getWriter();
	if(user.getUserId() == null || user.getUserPassword() == null ||user.getUserName() == null||user.getUserGender() == null|| user.getUserEmail() == null){
		script.println("<script>");
		script.println("alert('내용을 채우지 않은 칸이 있습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		//DAO(data access object) 생성
		UserDAO userDao = new UserDAO();
		
		//관리자로 회원가입
		if(user.getAdmin()==1){
			int result = userDao.joinAdmin(user);
			if(result == -1){
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				script.println("<script>");
				script.println("alert('회원가입 완료')");
				//경로 바꿔줄것(절대경로)
				script.println("location.href='/dongyang/index.jsp';");
				script.println("</script>");
			}
		}
		
		//일반회원으로 회원가입
		int result = userDao.join(user);
		if(result == -1){
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			script.println("<script>");
			script.println("alert('회원가입 완료')");
			//경로 바꿔줄것(절대경로)
			script.println("location.href='/dongyang/index.jsp';");
			script.println("</script>");
		}
		
	}
%>
</body>
</html>