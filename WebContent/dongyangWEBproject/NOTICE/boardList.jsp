<%@page import="board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:useBean id="boardDAO" class="board.BoardDAO" scope="page"/>
</head>

<body>
	<div id="headTitle" class="col-sm-12">
		<h1>희망 도서 요청</h1>
	</div>
	  <div class="row">
	    <div class="col-sm-12" style = "border-left: 10px;">
	    <div class="headtitle">
	    <!-- 페이지 파라메터 분석해서 페이지 문의인지 희망도서인지 분석하는부분 -->
	    </div>
	      <table class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
	      		<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<!-- 나중에 DB 데이터 불러올때 여기서 위와같이 페이지 파라메터 분석해서
					해당데이터 만큼 데이터 불러오면 됨
				 -->
				 <%
				 	ArrayList<Board> bbsList = boardDAO.boardList();
				 for(int i = 0 ; i < bbsList.size(); i++){ %>
				<tr>
					<td><%= bbsList.get(i).getBno() %></td>
					<td><a href="libnotice.jsp?bno=<%= bbsList.get(i).getBno()%>"><%= bbsList.get(i).getTitle() %></a></td>
					<td><%= bbsList.get(i).getWriter() %></td>
					<td><%= bbsList.get(i).getDate() %></td>
				</tr>
				<%} %>
				<tr>
					<td colspan="1"></td>
					<td colspan="2">검색 : <input type="button" name="searchTitle"> <input type="submit" value="검색"></td>
					<td colspan="1"><input type="button" onclick="location.href='libnotice.jsp'" value="글쓰기"></td>
				</tr>
				</tbody>
	      </table>
	    </div>
	    <div class="col-sm-3">
	    </div>
	  </div>
</body>
</html>