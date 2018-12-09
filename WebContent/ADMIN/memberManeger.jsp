<%@page import="user.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="userDAO" class="user.UserDAO"/>
</head>
<body>
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
</body>
</html>