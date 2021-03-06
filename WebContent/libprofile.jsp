<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="book.Book" %>
<%@ page import="rental.RentalDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리페이지</title>
	<link rel = "stylesheet" href = "DESIGN/css/bootstrap.css">
	<link rel = "stylesheet" href = "DESIGN/css/animate.css">
	<style>
		.conf{margin-top: 110px;}
		.headtitle{
			font-size: 36px;
   	    	line-height: 40px;
   	    	margin: 20px;
		}
		.borderd{border-left: 2px;}
	 	#headTitle *{text-align: center;}
	 	#headTitle{margin-top:100px;}
		/* 테이블 스코롤 효과*/
		.table-fixed thead {width: 97%;}
		.table-fixed tbody {
	  	height: 230px;
	  	overflow-y: auto;
	  	width: 100%;
		}
		.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {display: block;}
		.table-fixed tbody td, .table-fixed thead > tr> th {
	 	 float: left;
	  	border-bottom-width: 0;
		}
		.uesrMember{margin-top: 50px;}​
	</style>
	<script>
	//관리자 scripts onclick 함수
    function idDelete(delID){
        location.href = "./ADMIN/memberDelet.jsp?id=" + delID;   //get방식으로 삭제할아이디를 넘김          
    }
    function idAdmin(userID){
        location.href = "./ADMIN/memberAdmin.jsp?id=" + userID;   //get방식으로 삭제할아이디를 넘김       
    }
    //유저정보 scripts onclick 함수
    function js_changePassword(userId){
       var input = document.getElementById('js_changePassword').value;
       if(input =="")
    		alert("변경할 비밀번호를 입력하세요")
       else
       		location.href = "./ADMIN/memberEdit.jsp?id=" + userId +"&pass="+input;
    }
    function js_changeName(userId){
    	var input = document.getElementById('js_changeName').value;
    	if(input =="")
     		alert("변경할 이름을 입력하세요")
		else
        	location.href = "./ADMIN/memberEdit.jsp?id=" + userId +"&name="+input;
               
    }
    function js_changeEmail(userId){
    	var input = document.getElementById('js_changeEmail').value;
    	if(input =="")
     		alert("변경할 이메일을 입력하세요")
        else
        	location.href = "./ADMIN/memberEdit.jsp?id=" + userId +"&email="+input;
               
    }
	function bookReturn(bookId){
	    location.href = "./RENTAL/return.jsp?bookid=" + bookId;   //get방식으로 삭제할아이디를 넘김       
	}
	function bookDelet(bookId){
	    location.href = "./ADMIN/bookdelet.jsp?bookid=" + bookId;   //get방식으로 삭제할아이디를 넘김       
	}
	</script>
	<!-- PDF scripts import -->
	<script type="text/javascript" src="DESIGN/js/pdfobject.js"></script>
 
	<script type="text/javascript">
		window.onload = function (){
    };
	</script>

</head>
<jsp:useBean id="userDAO" class="user.UserDAO" scope="page"/>
<jsp:useBean id="users" class="user.User" scope="page"/>
<% 
	String userId = (String) session.getAttribute("userId");
	int admin = userDAO.checkAdmin(userId); 
%>
<body>
	<jsp:include page="./HEADER/navbar.jsp" flush="false"/>
	<%
		if(admin==0){
			UserDAO userDao = new UserDAO();
	%>
	<div id="headTitle">
		<h1>마이 페이지</h1>
	</div>
	<br><br>
	<div class="container line">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style ="padding-top : 20px;">
				<h3 style = "text-align : center;">회원정보 변경</h3>
				<div class = "form-group">
					<input type = "password" class = "form-control" id="js_changePassword" placeholder="기존 비밀번호 : <%= userDAO.getPassword(userId) %>" name = "userPassword" maxlenth="40">
					<input type="button" value="비밀번호 변경" onclick="js_changePassword('<%=userId%>')"/>
				</div>
				<div class = "form-group">
					<input type = "text" class = "form-control" id="js_changeName" placeholder="기존 이름 : <%= userDAO.getName(userId) %>" name = "userName" maxlenth="40">
					<input type="button" value="이름 변경" onclick="js_changeName('<%=userId%>')"/>
				</div>
				<div class = "form-group">
					<input type = "email" class = "form-control" id="js_changeEmail" placeholder="기존 이메일 : <%= userDAO.getEmail(userId) %>" name = "userEmail" maxlenth="40">
					<input type="button" value="이메일 변경" onclick="js_changeEmail('<%=userId%>')"/>
				</div>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
			<!-- rental DAO HERE -->
	<%
		RentalDAO rental = new RentalDAO();
	%>
	<jsp:useBean id="rentalDAO" class="rental.RentalDAO" scope="page"/>
		<div class="container">
			<table class="table table-striped">
		        <thead>
		           <tr>
		             <th>책제목</th><th>작가</th><th>책읽기</th><th>책반납</th>
		           </tr>
		        </thead>
		        <tbody>
		          	<% 
						ArrayList<Book> rentallist =rentalDAO.rentalList(userId); 
						for(int i = 0; i < rentallist.size(); i++ ){
						Book booklist = new Book();
						booklist = rentallist.get(i);
						String root = application.getRealPath("/BOOKDATA/");
						String path = root+booklist.getBookData();
					%>
					<tr>	
						<td><%=booklist.getBookTitle() %></td>
						<td><%=booklist.getBookAuthor() %></td>
						<td><div id="pdf"><input type="Button" class="btn btn-success" value="책읽기" onclick="window.open('./BOOKDATA/<%=booklist.getBookData() %>')"/></div></td>
						<td><input type="Button" class="btn btn-danger" value="책반납" onclick="bookReturn(<%=booklist.getBookID() %>)"/></td>
					</tr>
					<%} %>
		        </tbody>
		     </table>
		</div>
	<%}else{ %>
	<!-- 관리자 페이지 수정 부분 -->
	<div id="headTitle">
		<h1>관리자 페이지</h1>
		<h2><a href="libprofile.jsp?page=user">유저관리</a> <a href="libprofile.jsp?page=book">도서관리</a><a href="libprofile.jsp?page=recommand">추천도서관리</a></h2>
	</div>
		<% 
			String pg = request.getParameter("page");
			if(pg==null || pg.equals("user")){
		%>
				<jsp:include page="./ADMIN/memberManeger.jsp"/>
		<%}else if(pg.equals("book")){ %>
				<jsp:include page="./ADMIN/bookManeger.jsp"/>
		<%}else if(pg.equals("recommand")){ %>
				<jsp:include page="./ADMIN/bookRecommand.jsp"/>
		<%}} %>
		<!-- 여기까지가 관리자 페이지 -->
</body>
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "DESIGN/js/bootstrap.js"></script>
</html>