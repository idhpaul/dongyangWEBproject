<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
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
        location.href = "./Admin/memberDelet.jsp?id=" + delID;   //get방식으로 삭제할아이디를 넘김          
    }
    function idAdmin(userID){
        location.href = "./Admin/memberAdmin.jsp?id=" + userID;   //get방식으로 삭제할아이디를 넘김       
    }
    //유저정보 scripts onclick 함수
    function js_changePassword(userId){
       var input = document.getElementById('js_changePassword').value;
       if(input =="")
    		alert("변경할 비밀번호를 입력하세요")
       else
       		location.href = "./Admin/memberEdit.jsp?id=" + userId +"&pass="+input;
    }
    function js_changeName(userId){
    	var input = document.getElementById('js_changeName').value;
    	if(input =="")
     		alert("변경할 이름을 입력하세요")
		else
        	location.href = "./Admin/memberEdit.jsp?id=" + userId +"&name="+input;
               
    }
    function js_changeEmail(userId){
    	var input = document.getElementById('js_changeEmail').value;
    	if(input =="")
     		alert("변경할 이메일을 입력하세요")
        else
        	location.href = "./Admin/memberEdit.jsp?id=" + userId +"&email="+input;
               
    }
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
	
		<div class="container">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
					        <table class="table table-fixed">
		          <thead>
		            <tr>
		              <th class="col-xs-3">책제목</th><th class="col-xs-3">작가</th><th class="col-xs-4">출판사</th><th class="col-xs-2">책읽기</th>
		            </tr>
		          </thead>
		          <tbody>
							<tr>
								<td class="col-xs-3">제목</td>
								<td class="col-xs-3">작가</td>
								<td class="col-xs-4">출판사</td>
								<td class="col-xs-2"><input type="Button" value="책읽기"/></td>
							</tr>
		          </tbody>
		        </table>
		</div>
		<div class = "col-lg-2"></div>
	</div>
	
	
	
	
	<%}else{ %>
	<div id="headTitle">
		<h1>관리자 페이지</h1>
	</div>
		<div class="container uesrMember">
		  <div class="row">
		      <div class="panel panel-default">
		        <div class="panel-heading">
		          <h4>유저관리</h4>
		        </div>
		        <table class="table table-fixed">
		          <thead>
		            <tr>
		              <th class="col-xs-3">유저아이디</th><th class="col-xs-3">이름</th><th class="col-xs-4">권한주기</th><th class="col-xs-2">삭제</th>
		            </tr>
		          </thead>
		          <tbody>
					 <% 
					 String userID;
					 try{
						 userID = request.getParameter("ID");
					 }catch(Exception e){
						 userID = "";
					 }
					 ArrayList<User> userdata;
					 if(userID == null || userID.equals("") == true){
						 userdata = userDAO.userPrint(); 
					 }else{
						 userdata = userDAO.userPrint(userID); 
					 }
							 for(int i =0 ; i < userdata.size();i++){%>
							<tr>
								<td class="col-xs-3"><%= userdata.get(i).getUserId() %></td>
								<td class="col-xs-3"><%= userdata.get(i).getUserName() %></td>
								<td class="col-xs-4"><input type="button" value="관리자권한부여" onclick="idAdmin('<%= userdata.get(i).getUserId()%>');"/></td>
								<td class="col-xs-2"><input type="button" value="삭제" onclick="idDelete('<%= userdata.get(i).getUserId()%>');"/></td>
							</tr>
						<%} %>
		          </tbody>
		        </table>
		      </div>
		  </div>
		  <form action="libprofile.jsp" method="get">
		  		아이디 검색 : <input type="text" name="ID"> <input type="submit" value="검색">
		  </form>
		</div>
		<%} %>
</body>


	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "DESIGN/js/bootstrap.js"></script>
</html>