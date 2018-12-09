<%@page import="java.nio.channels.FileChannel"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="bookDAO" class="book.BookDAO"></jsp:useBean>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		int size = 10*1024*1024;
		String title = "";
		System.out.println(title);
		String author = "";
		String path = application.getRealPath("/BOOKDATA/");
		String upload = path + "..\\..\\..\\..\\..\\..\\..\\dongyang\\WebContent\\UPLOAD\\";
		String imgPath =path+ "..\\..\\..\\..\\..\\..\\..\\dongyang\\WebContent\\IMAGE\\bookImage\\";
		String imgName ="";
		String dataPath =path+"..\\..\\..\\..\\..\\..\\..\\dongyang\\WebContent\\BOOKDATA\\";
		String dataName ="";
		System.out.println(dataPath);
		try{
			MultipartRequest multi=new MultipartRequest(request,upload,size,"UTF-8",new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			title = multi.getParameter("title");
			author = multi.getParameter("author");
		    String file1 = (String)files.nextElement();
		    dataName = multi.getFilesystemName(file1);
		    String file2 = (String)files.nextElement();
		    imgName = multi.getFilesystemName(file2);
		    //파일이 우선적으로 입력되는 장소 경로
		    File fdata = new File(upload+imgName);
		    File fimg = new File(upload+dataName);
		    //파일을 옮기기전에 같은이름의 파일이 있는지 체크하기위해 만은 파일 객체
		    File Afdata = new File(imgPath+imgName);
		    File Afimg = new File(dataPath+dataName);
		    if(Afdata.exists() || Afimg.exists()){
		    	script = response.getWriter();
				script.println("<script>");
				//경로 바꿔줄것(절대경로)
				script.println("alert('동일명의 파일이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
		    }
		    System.out.println(Afdata);
		    System.out.println(Afimg);
		    FileInputStream dataStream = new FileInputStream(fimg);        
		    FileOutputStream outputdataStream = new FileOutputStream(Afimg);
		    
		    FileInputStream fimgStream = new FileInputStream(fdata);        
		    FileOutputStream outputfimgStream = new FileOutputStream(Afdata);
		      
		    FileChannel fcin =  dataStream.getChannel();
		    FileChannel fcout = outputdataStream.getChannel();
		    FileChannel fcin1 =  fimgStream.getChannel();
		    FileChannel fcout1 = outputfimgStream.getChannel();
		      
		    long size1 = fcin.size();
		    fcin.transferTo(0, size1, fcout);
		    long size2 = fcin.size();
		    fcin1.transferTo(0, size2, fcout1);
		    
		    fcout1.close();
		    fcin1.close();
		    fcout.close();
		    fcin.close();
		    outputfimgStream.close();
		    fimgStream.close();
		    outputdataStream.close();
		    dataStream.close();
		    
			fimg.delete();
			fdata.delete();
		    int i = bookDAO.bookInset(imgName, title, author, dataName);
		    if(i==-1){
		    	script = response.getWriter();
		    	script.println("<script>");
				//경로 바꿔줄것(절대경로)
				script.println("alert('데이터베이스 오류')");
				script.println("history.back()");
				script.println("</script>");
		    }else{
		    	script = response.getWriter();
		    	script.println("<script>");
				//경로 바꿔줄것(절대경로)
				script.println("alert('정상등록')");
				script.println("location.href='../libprofile.jsp'");
				script.println("</script>");
		    }
		}catch(Exception e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>