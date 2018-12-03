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
<% 
	final int ROWSIZE = 10; // ���������� ���� �Խù� �� 
	final int BLOCK = 5; 
	int pg = 1; //�⺻ �������� 
	if(request.getParameter("page")!=null) { //�޾ƿ� pg���� ������, �ٸ��������� �� 
	pg = Integer.parseInt(request.getParameter("page")); // pg���� ���� 
	} 
	int start = (pg*ROWSIZE) - (ROWSIZE-1); // �ش����������� ���۹�ȣ(step2) 
	int end = (pg*ROWSIZE); // �ش����������� ����ȣ(step2) I
	int allPage = 0; // ��ü �������� 
	int startPage = ((pg-1)/BLOCK*BLOCK)+1; // ���ۺ����� (1~5�������ϰ�� 1, 6~10�ϰ�� 6) 
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // �� �� ���� (1~5�� ��� 5, 6~10�ϰ�� 10) 
	
	int total = boardDAO.boardAllList();
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}

%>
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
				 int pageNum=0;
				 if(request.getParameter("page")==null){
					 pageNum=0;
				 }else{
					 pageNum=Integer.parseInt(request.getParameter("page"));
				 }
				 	ArrayList<Board> bbsList = boardDAO.boardList(pg);
				 for(int i = 0 ; i < bbsList.size(); i++){ %>
				<tr>
					<td><%= bbsList.get(i).getBno() %></td>
					<td><a href="libnotice.jsp?bno=<%= bbsList.get(i).getBno()%>"><%= bbsList.get(i).getTitle() %></a></td>
					<td><%= bbsList.get(i).getWriter() %></td>
					<td><%= bbsList.get(i).getDate() %></td>
				</tr>
				<%} %>
				<tr>
					<td colspan="1">�Խ��� �Դϴ�</td>
					<td colspan="2">�˻� : <input type="text" name="searchTitle" maxlength="150"> <input type="submit" value="�˻�"></td>
					<td colspan="1">
					<%if(session.getAttribute("userId")!=null){%>
						<input type="button" onclick="location.href='libnotice.jsp?insert=1'" value="�۾���">
					<%}%>
					</td>
				</tr>
				<tr>
					<td colspan="1"></td>
					<td colspan="2">
							<%
								if(pg>BLOCK) {
							%>
								[<a href="libnotice.jsp?page=1">����</a>]
								[<a href="libnotice.jsp?page=<%=startPage-1%>">��</a>]
							<%
								}
							%>
							
							<%
								for(int i=startPage; i<= endPage; i++){
									if(i==pg){
							%>
										<u><b>[<%=i %>]</b></u>
							<%
									}else{
							%>
										[<a href="libnotice.jsp?page=<%=i %>"><%=i %></a>]
							<%
									}
								}
							%>
							
							<%
								if(endPage<allPage){
							%>
								[<a href="libnotice.jsp?page=<%=endPage+1%>">��</a>]
								[<a href="libnotice.jsp?page=<%=allPage%>">����</a>]
							<%
								}
							%>
					</td>
					<td colspan="1"></td>
				</tr>
				</tbody>
	      </table>
	    </div>
	    <div class="col-sm-3">
	    </div>
	  </div>
</body>
</html>