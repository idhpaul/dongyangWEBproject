<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel = "stylesheet" href = "DESIGN/css/bootstrap.css">
	<link rel = "stylesheet" href = "DESIGN/css/animate.css">
<title>동양 E 도서관</title>
</head>
<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:useBean id="boardDAO" class="board.BoardDAO" scope="page"/>
<style>
	.conf{
		margin-top: 110px;
	}
	#viewalign{
		margin-top: 110px;
	}
	.headtitle{
		font-size: 36px;
   	    line-height: 40px;
   	    margin: 20px;
	}
	.headtitle2{
		font-size: 36px;
   	    line-height: 40px;
   	    margin: 100px;
	}
	.borderd{
	border-left: 2px;
	}
	 #headTitle *{
 	text-align: center;
	 }
	 #headTitle2{
	 	margin-top:20px;
	 	margin: auto;
	 	line-height: 100px;
	 	text-align: center;
	 }
	 #view {
	 	width: 70%;
	 	text-align: center;
	 	margin: auto;
	 }
</style>

<body>
	<jsp:include page="./HEADER/navbar.jsp" flush="false"/>
	<%
	String bno = request.getParameter("bno");
	String update = request.getParameter("update");
	if(bno == null && update==null){%>
	<div class="container conf">
		<jsp:include page="./NOTICE/boardList.jsp"/>
	</div>
	<%}else if(bno!=null&&update==null){ %>
	<!-- 여기서 부터는 View와 관련 된 부분 -->
	<div id="viewalign">
		<jsp:include page="./NOTICE/view.jsp"/>
	</div>
	<%}else {%>
	<div id="viewalign">
		<jsp:include page="./NOTICE/updateBoard.jsp"/>
	</div>
	<%} %>
	<!-- parameter값을 읽어 해당 목록 카테고리  활성화 시켜주는 역할을 함 -->
	<!-- 여기 하단부에 위치해야됨  -->
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "DESIGN/js/bootstrap.js"></script>
</body>
</html>