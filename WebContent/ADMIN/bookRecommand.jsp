<%@page import="book.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function recomdel(delID){
	    location.href = "./ADMIN/bookRdelet.jsp?bookid=" + delID;   //get방식으로 삭제할아이디를 넘김          
	}
	function rInsert(insertID){
	    location.href = "./ADMIN/bookRInsert.jsp?bookid=" + insertID;   //get방식으로 삭제할아이디를 넘김       
	}
</script>
<body>
		<div class="container">
		  <div class="row">
		      <div class="panel">
		        <div class="panel-heading">
		          <h4>추천도서관리</h4>
		        </div>
		        <table class="table table-fixed">
		          <thead>
		            <tr>
		              <th class="col-xs-3">번호</th>
		              <th class="col-xs-3">도서제목</th>
		              <th class="col-xs-3">작가</th>
		              <th class="col-xs-3">추천등록</th>
		            </tr>
		          </thead>
		          <tbody>
		          <jsp:useBean id="bookDAO" class="book.BookDAO"/>
					 <% 
					 		ArrayList<Book> book = bookDAO.bookList(); 
							 for(int i =0 ; i < book.size();i++){
								 Book booklist = new Book();
							 		booklist = book.get(i);
							 %>
							<tr>
								<td class="col-xs-3"><%=booklist.getBookID() %></td>
								<td class="col-xs-3"><%=booklist.getBookTitle()%></td>
								<td class="col-xs-3"><%=booklist.getBookAuthor() %></td>
								<td class="col-xs-3">
								<% int t= bookDAO.bookRecomCheck(booklist.getBookID());
								if(t==0){%>
									<input type="button" value="추천항목으로" onclick="rInsert(<%= booklist.getBookID()%>);">
								<%}else{ %>
									<input type="button" value="추천취소" onclick="recomdel(<%= booklist.getBookID()%>);">
								<%} %>
								</td>
							</tr>
						<%} %>
		          </tbody>
		        </table>
		      </div>
		  </div>
</body>
</html>