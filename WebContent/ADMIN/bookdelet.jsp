<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
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
	 	 PrintWriter script = response.getWriter();
        //넘어온 ID값 받아서 삭제하는 메소드 호출
        String dir = "BOOKDATA";
        String path = application.getRealPath("/BOOKDATA/");
        path ="C"+ path.substring(1, path.indexOf(".metadata"))+"dongyang\\WebContent\\";
        ArrayList<String> result = bookDAO.bookDelet(request.getParameter("bookid"));  
        File fdata = new File(path+"BOOKDATA\\"+result.get(0));
        File fimg = new File(path+"IMAGE\\bookImage\\"+result.get(1));
        //System.out.print(root);
        System.out.print(path);
        if(fdata.isFile()||fimg.isFile()){
        	fdata.delete();
        	fimg.delete();
        	System.out.print("가능");
        	script = response.getWriter();
	    	script.println("<script>");
			//경로 바꿔줄것(절대경로)
			script.println("alert('정상등록')");
			script.println("location.href='../libprofile.jsp'");
			script.println("</script>");
        }
        else{
        	System.out.print("안됨");
        	script.println("<script>");
			//경로 바꿔줄것(절대경로)
			script.println("alert('삭제 실패')");
			script.println("history.back()");
			script.println("</script>");
        }
    %> 
</body>
</html>