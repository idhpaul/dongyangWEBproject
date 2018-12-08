<%@page import="java.io.PrintWriter"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="bookDAO" class="book.BookDAO"/>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String userId = (String) session.getAttribute("userId");
		String bookId = request.getParameter("bookid");
		if(userId==null){
			
			script.println("<script>");
			script.println("alert('로그인을 해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			int i = bookDAO.rentalBook(userId, Integer.parseInt(bookId));
			if(i==-1){
				script.println("<script>");
				script.println("alert('데이터베이스 에러')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("alert('정상대여')");
				script.println("location.href='../libprocessor.jsp';");
				script.println("</script>");
			}
			
		}
	%>
</body>
</html>