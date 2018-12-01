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
		<h1>��� ���� ��û</h1>
	</div>
	  <div class="row">
	    <div class="col-sm-12" style = "border-left: 10px;">
	    <div class="headtitle">
	    <!-- ������ �Ķ���� �м��ؼ� ������ �������� ����������� �м��ϴºκ� -->
	    </div>
	      <table class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
	      		<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center;">����</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
					</tr>
				</thead>
				<tbody>
				<!-- ���߿� DB ������ �ҷ��ö� ���⼭ ���Ͱ��� ������ �Ķ���� �м��ؼ�
					�ش絥���� ��ŭ ������ �ҷ����� ��
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
					<td colspan="2">�˻� : <input type="button" name="searchTitle"> <input type="submit" value="�˻�"></td>
					<td colspan="1"><input type="button" onclick="location.href='libnotice.jsp'" value="�۾���"></td>
				</tr>
				</tbody>
	      </table>
	    </div>
	    <div class="col-sm-3">
	    </div>
	  </div>
</body>
</html>