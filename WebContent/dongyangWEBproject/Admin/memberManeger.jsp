<%@page import="user.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		          <h4>��������</h4>
		        </div>
		        <table class="table table-fixed">
		          <thead>
		            <tr>
		              <th class="col-xs-3">�������̵�</th><th class="col-xs-3">�̸�</th><th class="col-xs-4">�����ֱ�</th><th class="col-xs-2">����</th>
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
								<td class="col-xs-4"><input type="button" value="�����ڱ��Ѻο�" onclick="idAdmin('<%= userdata.get(i).getUserId()%>');"/></td>
								<td class="col-xs-2"><input type="button" value="����" onclick="idDelete('<%= userdata.get(i).getUserId()%>');"/></td>
							</tr>
						<%} %>
		          </tbody>
		        </table>
		      </div>
		  </div>
		  <form action="libprofile.jsp" method="get">
		  		���̵� �˻� : <input type="text" name="ID"> <input type="submit" value="�˻�">
		  </form>
		</div>
</body>
</html>