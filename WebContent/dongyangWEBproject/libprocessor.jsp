<%@page import="book.BookDAO"%>
<%@page import="book.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel = "stylesheet" href = "DESIGN/css/bootstrap.css">
	<link rel = "stylesheet" href = "DESIGN/css/animate.css">
<title>Insert title here</title>
</head>
<style>
 #list *{
	margin-left: 60px;
 
 }
 #mainp .c1{
 	margin-top: 50px;
 }
 #mainp .c2{
 	margin-top: 50px;
 }
 #headTitle *{
 	text-align: center;
 }
 #headTitle{
 	margin-top:100px;
 }
html {
    position:relative;
    z-index:1;
}
html:after {
    background-image:url(IMAGE/img/section1.png);
    top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.5!important;
    filter:alpha(opacity=50);
    z-index:-1;
    content:"";
    width:100%;
    height:100%;
}
td {
	background-color: #F4FFFF;
}
img{
	width: 100px;
	height: auto;
}
.jb-th-1{
	 width: 100px;
}
.jb-th-3{
	width: 200px;
}
.jb-th-4{
	width: 100px;
}
</style>
		<script>
		function bookRental(bookId){
		    location.href = "./RENTAL/rental.jsp?bookid=" + bookId;   //get방식으로 삭제할아이디를 넘김       
		}
		</script>
<body class="backgroundImage">
	<jsp:include page="./HEADER/navbar.jsp" flush="false"/>
	
	<div id="headTitle" class="col-sm-12">
		<h1>도서관 이용 페이지</h1>
	</div>
		<div class="container" style="text-align:center;">
		  <!-- 팝업창을 띄우는 버튼 -->
		  <button type="button" class="btn-default btn-info btn-lg t" style="margin-top: 20px;" data-toggle="modal" data-target="#myModal" st>이용안내</button>
		  <!-- Modal -->
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- 팝업창 안에 내용들 입력 -->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">이용 방법</h4>
		        </div>
		        <!-- 이용설명은 이쪽에 입력 하시면 됩니다!! -->
		        <div class="modal-body">
		          <p>1. 대여하기를 누릅니다</p>
		          <p>2. 마이페이지로 가면 책이 등록되어져 있습니다!</p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
	<div id="mainp">
		<div class="row">
		<div class="col-sm-1">
		</div>
		  <div class="col-sm-2 c1" style="border-top: 10px;">
		  		<div class="panel panel-default">
				  <div class="panel-heading"><h1 style="text-align: center;">장르</h1></div>
				  <div class="panel-body center">
				  <div id="list" class="btn-group-vertical">
						  <a href="libprocessor.jsp?page=liter" class="btn btn-primary">문학</a>
						  <a href="libprocessor.jsp?page=liter" class="btn btn-primary">참고서</a>
						  <a href="libprocessor.jsp?page=liter" class="btn btn-primary">시집</a>
						  <a href="libprocessor.jsp?page=liter" class="btn btn-primary">잡지</a>

					</div>
				  </div>
				</div>
		  </div>
		  <div class="col-sm-1">
		  </div>
		  <div class="col-sm-7 c2">
			      <table class = "table" style = "text-align: center; border : 1px solid #dddddd">
			      		<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;" class="jb-th-1">이미지</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;" class="jb-th-3">글쓴이</th>
								<th style="background-color: #eeeeee; text-align: center;" class="jb-th-4">대여</th>
							</tr>
						</thead>
						<tbody>
						<!-- 나중에 DB 데이터 불러올때 여기서 위와같이 페이지 파라메터 분석해서
							해당데이터 만큼 데이터 불러오면 됨
						 -->
						 <jsp:useBean id="bookDAO" class="book.BookDAO"/>
						 <% 
						 ArrayList<Book> book = bookDAO.bookList(); 
						 for(int i = 0; i < book.size(); i++ ){
							 Book booklist = new Book();
							 booklist = book.get(i);
						 %>
						<tr>
							<td><img alt="책이미지나중에 이름기입" src="IMAGE/bookImage/<%= booklist.getBookImg()%>"></td>
							<td><%=booklist.getBookTitle() %></td>
							<td><%=booklist.getBookAuthor() %></td>
							<td>
								<% if (booklist.getBookRental() == 1){ %>
									<input type="button" value="대여불가">
								<%}else{ %>
									<input type="button" value="대여" onclick="bookRental(<%=booklist.getBookID() %>)">
								<%} %>
							</td>
						</tr>
						<%} %>
						</tbody>
			      </table>
			    </div>
			  </div>
			</div>
		  </div>
		</div>
	</div>
		
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "DESIGN/js/bootstrap.js"></script>
	
	
</body>
</html>