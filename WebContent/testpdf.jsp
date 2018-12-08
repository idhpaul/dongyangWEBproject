<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="DESIGN/js/pdfobject.js"></script>
 
<script type="text/javascript">
window.onload = function (){
        var success = new PDFObject({ url: "./IMAGE/book1.pdf" }).embed("pdf"); 
    };
</script>


</head>
<body>
<div id="pdf">
	<a href="./IMAGE/book1.pdf">클릭</a>
</div>
</body>
</html>