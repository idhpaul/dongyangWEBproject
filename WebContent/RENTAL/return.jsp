<%@page import="java.io.PrintWriter"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="RentalDAO" class="rental.RentalDAO"/>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String userId = (String) session.getAttribute("userId");
		String bookId = request.getParameter("bookid");
		
		RentalDAO.returnBook(userId,bookId);
		
		script.println("<script>");
		script.println("alert('정상 반납되었습니다.')");
		script.println("location.href='../libprofile.jsp';");
		script.println("</script>");
		
	%>
</body>
</html>