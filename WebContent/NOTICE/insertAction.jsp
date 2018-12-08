<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
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
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		if(title.equals("")||content.equals("")){
			script.println("<script>");
			script.println("alert('빈공간이 있습니다..')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			int i = boardDAO.boardInsert(title, content, userID);
			if(i==-1){
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");}
			else{
				script.println("<script>");
				script.println("alert('글쓰기 성공')");
				script.println("location.href='../libnotice.jsp'");
				script.println("</script>");}
			}
	%>
</body>
</html>