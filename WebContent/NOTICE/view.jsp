<%@page import="board.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:useBean id="boardDAO" class="board.BoardDAO" scope="page"/>
</head>
<body>
	<%
	String bno = request.getParameter("bno");
	%>
	<div id="headTitle2" class="col-sm-12">
		<h1>희망 도서 요청</h1>
	</div>
					<% Board boardView = boardDAO.boardView(bno); %>
					<table id="view" class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="4" style="background-color: #eeeeee; text-align: center;">글보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;"> 글 제목 </td>
							<td colspan="3"><%= boardView.getTitle()  %></td>
						</tr>
						<tr>
							<td>작성자</td>	
							<td colspan="3"><%= boardView.getWriter() %></td>
						</tr>
						<tr>
							<td>작성일</td>	
							<td colspan="3"><%=boardView.getDate() %></td>
						</tr>
						<tr>
							<td>내용</td>	
							<td colspan="3" style="min-height: 200px; text-align: left;"><%= boardView.getContent() %></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" onclick="location.href='libnotice.jsp'" value="목록"></td>	
							<td colspan="1"><input type="button" onclick="location.href='libnotice.jsp?bno=<%= bno%>&writer=<%= boardView.getWriter()%>&update=1'" value="수정"></td>
							<td colspan="1"><input type="button" onclick="location.href='./NOTICE/deletBoard.jsp?bno=<%= bno%>&writer=<%= boardView.getWriter()%>'" value="삭제"></td>
						</tr>
					</tbody>
				</table>
</body>
</html>