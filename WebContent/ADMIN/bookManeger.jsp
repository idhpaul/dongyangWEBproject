<%@page import="book.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function onBookInsert(){
		var title=document.getElementById('title').value;
		var author=document.getElementById('author').value;
		document.forms.bookinsert.action="./ADMIN/bookInsert.jsp?title="+title+"&author="author;
		document.forms.bookinsert.submit();
	}
	</script>
</head>
<body>
			<div class="container">
			<table class="table table-striped">
		          <thead>
		            <tr>
		              <th>책제목</th><th>작가</th><th>도서삭제</th>
		            </tr>
		          </thead>
		          <tbody>
					<jsp:useBean id="bookDAO" class="book.BookDAO"/>
						 <% 
						 ArrayList<Book> book = bookDAO.bookList(); 
						 for(int i = 0; i < book.size(); i++ ){
							 Book booklist = new Book();
							 booklist = book.get(i);
						 %>
						<tr>
							<td><%=booklist.getBookTitle() %></td>
							<td><%=booklist.getBookAuthor() %></td>
							<td><input type="button" value="삭제" onclick="bookDelet(<%= booklist.getBookID()%>)"></td>
						</tr>
						<%} %>
						<tr>
							<!-- Trigger the modal with a button -->
							<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">도서등록</button>
							<!-- Modal -->
							<div id="myModal" class="modal fade" role="dialog">
							  <div class="modal-dialog">
							    <!-- Modal content-->
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal">&times;</button>
							        <h4 class="modal-title">도서등록</h4>
							      </div>
							      <div class="modal-body">
							        <form action="./ADMIN/bookInsert.jsp" method="post" id="bookinsert" enctype="multipart/form-data">
							        	도서 제목 <br><input type="text" name="title" id="title"><br>
							        	작      가  <br> <input type="text" name="author" id="author"><br>
		   					  	              도서이미지: <input type="file" name="bimg" accept="image/*"><br>
		   					  	        <p style="color: red;">jpg png 등 이미지파일을 선탯하세요</p>
		   					  	              도      서 : <input type="file" name="bookdata" accept=".pdf"><br>
		   					  	        <p style="color: red;">도서 자료는 pdf파일만 지원합니다</p>
		   					  	        <button onclick="document.forms.bookinsert.submit()">등록</button>
							        </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>
						</tr>
		          </tbody>
		        </table>
		</div>
		
</body>
</html>