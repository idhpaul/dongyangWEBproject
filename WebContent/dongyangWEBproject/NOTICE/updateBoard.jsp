<%@page import="board.Board"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>Insert title here</title>
	<jsp:useBean id="boardDAO" class="board.BoardDAO" scope="page"/>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String userID = (String) session.getAttribute("userId");
		String writer = request.getParameter("writer");
		String bno = request.getParameter("bno");
			if(userID == null ||userID.equals(writer)==false){
				script.println("<script>");
				script.println("alert('글쓴이가 아니면 접근할수가 없습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
	%>
	<div id="headTitle2" class="col-sm-12">
		<h1>희망 도서 요청</h1>
	</div>
					<% Board board = boardDAO.boardView(bno); %>
				<form action="./NOTICE/updateBoardAction.jsp">
					<table id="view" class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="10" style="background-color: #eeeeee; text-align: center;">글수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td> 글 제목 </td>
								<td colspan="9"><input type="text" class="form-control" placeholder="<%= board.getTitle() %>" name="title" maxlength="50"/></td>
							</tr>
							<tr>
								<td colspan="1">내용</td>	
								<td><textarea class="form-control" placeholder="<%=board.getContent() %>" name="content" maxlength="2048" style="height: 350px;"></textarea></td>
							</tr>
							<tr>
								<td colspan="4"><input type="submit" class="form-control" values="수정"/></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="bno" value="<%= bno%>">
				</form>
</body>
</html>