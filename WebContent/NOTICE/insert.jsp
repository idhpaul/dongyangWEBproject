<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="board.Board"%>
<%@page import="board.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="boardDAO" class="board.BoardDAO" scope="page"/>
<%
	String user = (String) session.getAttribute("userId");
%>
</head>
<body>
	<div id="headTitle2" class="col-sm-12">
		<h1>희망 도서 요청</h1>
	</div>
				<form action="./NOTICE/insertAction.jsp">
					<table id="view" class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="10" style="background-color: #eeeeee; text-align: center;">글수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td> 글 제목 </td>
								<td colspan="9"><input type="text" class="form-control"  name="title" maxlength="50"/></td>
							</tr>
							<tr>
								<td colspan="1">내용</td>	
								<td><textarea class="form-control"  name="content" maxlength="2048" style="height: 350px;"></textarea></td>
							</tr>
							<tr>
								<td colspan="4"><input type="submit" class="form-control" values="글쓰기"/></td>
							</tr>
							<input type="hidden" name="user" value="<%=user%>"/>
						</tbody>
					</table>
				</form>
</body>
</html>