<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bookDAO" class="book.BookDAO"/>
	  <%     
        //넘어온 ID값 받아서 삭제하는 메소드 호출
        String dir = "BOOKDATA";
        String path = application.getRealPath("/BOOKDATA/");
        String result = bookDAO.bookDelet(request.getParameter("bookid"))+".pdf";  
        String root = request.getContextPath();
		path+="..\\..\\..\\..\\..\\..\\..\\dongyang\\WebContent\\BOOKDATA\\";
		path+=result;
        File f = new File(path);
        //System.out.print(root);
        System.out.print(path);
        if(f.isFile())f.delete();
        else System.out.print("안됨");
    %> 
    <script>   
        alert("성공했습니다>");
        location.href="../libprofile.jsp";  
    </script>
</body>
</html>