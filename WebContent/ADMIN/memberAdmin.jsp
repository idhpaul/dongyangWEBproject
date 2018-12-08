<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC
"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="dao" class="user.UserDAO" />
   
    <%     
        //넘어온 ID값 받아서 삭제하는 메소드 호출
   
        int result = dao.memberAdmin(request.getParameter("id"));
        String message="삭제되지 않았습니다.";
        if(result > 0 ){
                       
            message = "관리자권한을 부여했습니다.";
        }
    %> 
   
    <script>   
        alert("<%=message%>");
        location.href="../libprofile.jsp";  
    </script>
</body>
</html>