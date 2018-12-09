<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bookDAO" class="book.BookDAO"/>
	<%
		String bookid = request.getParameter("bookid");
		PrintWriter script = response.getWriter();
		int i = bookDAO.bookRInsert(bookid);
		if( i==-1 ){
			script.println("<script>");
			script.println("alert('데이터베이스 에러')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('성공')");
			script.println("location.href='/dongyang/libprofile.jsp';");
			script.println("</script>");
		}
	%>
</body>
</html>