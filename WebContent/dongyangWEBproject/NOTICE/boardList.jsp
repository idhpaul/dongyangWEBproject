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
	final int ROWSIZE = 10; // 한페이지에 보일 게시물 수 
	final int BLOCK = 5; 
	int pg = 1; //기본 페이지값 
	if(request.getParameter("page")!=null) { //받아온 pg값이 있을때, 다른페이지일 때 
	pg = Integer.parseInt(request.getParameter("page")); // pg값을 저장 
	} 
	int start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2) 
	int end = (pg*ROWSIZE); // 해당페이지에서 끝번호(step2) I
	int allPage = 0; // 전체 페이지수 
	int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6) 
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10) 
	
	int total = boardDAO.boardAllList();
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}

%>
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
					<td colspan="1">게시판 입니다</td>
					<td colspan="2">검색 : <input type="text" name="searchTitle" maxlength="150"> <input type="submit" value="검색"></td>
					<td colspan="1">
					<%if(session.getAttribute("userId")!=null){%>
						<input type="button" onclick="location.href='libnotice.jsp?insert=1'" value="글쓰기">
					<%}%>
					</td>
				</tr>
				<tr>
					<td colspan="1"></td>
					<td colspan="2">
							<%
								if(pg>BLOCK) {
							%>
								[<a href="libnotice.jsp?page=1">◀◀</a>]
								[<a href="libnotice.jsp?page=<%=startPage-1%>">◀</a>]
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
								[<a href="libnotice.jsp?page=<%=endPage+1%>">▶</a>]
								[<a href="libnotice.jsp?page=<%=allPage%>">▶▶</a>]
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