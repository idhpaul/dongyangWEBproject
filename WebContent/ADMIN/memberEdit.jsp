<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="dao" class="user.UserDAO" />
   
    <%
    	String userId = request.getParameter("id");
    	String userPassword = request.getParameter("pass");
    	String userName = request.getParameter("name");
    	String userEmail = request.getParameter("email");
    	String message=null;
    	
    	if(userPassword!=null){
    		dao.changePassword(userId, userPassword);
    		message="비밀번호";
    	}
    	else if(userName!=null){
    		dao.changeName(userId, userName);
    		message="이름";
    	}else if(userEmail!=null){
    		dao.changeEmail(userId, userEmail);
    		message="이메일";
    	}

    %> 
    
    <script>   
        alert("<%=message%>"+" 변경 완료! 다시 로그인하세요");
        location.href="../LOGIN/logout.jsp";  
    </script>

</body>
</html>