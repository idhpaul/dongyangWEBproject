<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="boardDAO" class="board.BoardDAO"/>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
		String userID = (String) session.getAttribute("userId");
		String writer = request.getParameter("writer");
		String bno = request.getParameter("bno");
		if(userID == null ||userID.equals(writer)==false){
		script.println("<script>");
		script.println("alert('해당유저가 아닙니다.')");
		script.println("history.back()");
		script.println("</script>");
		}else{
			script.println("<script>");
			boardDAO.boardDelet(bno);
			script.println("alert('정상적으로 삭제외었습니다.')");
			script.println("location.href='../libnotice.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>