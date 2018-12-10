<%@page import="book.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>동양 E 도서관</title>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "stylesheet" href = "DESIGN/css/bootstrap.css">
	<link rel = "stylesheet" href = "DESIGN/css/animate.css">
	<link rel = "stylesheet" href = "DESIGN/css/main.css">
</head>
<body>
<!-- 이쪽은 따로 나중에 css파일로 만들어서 저장해놓을것임 -->
<!-- 부트스트랩 이외에 내가 설정해놓은 디자인들 -->
 <!-- 여기까지 --> 
</head>
<style>
	.mainback{
   color: black;
   position:relative;
    z-index:1;
  }
  .mainback:after{
    background-image:url("IMAGE/img/mainpage.jpg");
    top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.5!important;
    filter:alpha(opacity=50);
    z-index:1;
    content:"";
    width:100%;
    height:100%;
  }
  

</style>
<%
	String path = session.getServletContext().getContextPath();
	String path2 = session.getServletContext().getRealPath("/BOOKDATA/");
	path2 ="C"+ path2.substring(1, path2.indexOf(".metadata"))+"dongyang\\UPLOAD\\";
	System.out.println(path2);
%>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
	<jsp:include page="./HEADER/navbar.jsp" flush="false"/>
	<!-- 네비게이션 바 부분 은 후에 maintoolbar.jsp 파일로 변환시켜 include를 통해 불러올 생각을 해봄 -->
	<!-- 섹션 처리부분  -->
	<div id="section41" class="container-fluid mainback">
		<div class="jumbotron">
		  <h1 class="animated fadeIn Title slow">동양 미래 도서관</h1>
			  <div class="animated fadeIn conetent slower">   
			  <p>이제 도서관은 책을 읽는 공간에서 문화의 복합공간으로 변화하고 있습니다. 자료를 수집 · 정리하고 제공하는 전통적인 기능 외에 </p>
			  <p>다양한 문화교육프로그램을 제공하는 평생교육문화의 장으로 거듭나고 있습니다.</p>
			  <p>동양인과 함께 하는 도서관으로 거듭나기 위해 노력하겠습니다.</p>
			  </div>
		  </div>
	</div>
	<!-- 섹션41해당하는 부분 더 추가하려면 위에 형태 변경하고 스타일에 해당 아이디 등록 -->
	<div id="section42" class="container-fluid">
	<!-- 이부분 부터 부분 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	  <!-- 슬라이더의 갯수를 보여주는 부분 -->
	  <!-- class에 active가 붙여진 부분을 가장 먼저 활성화 시켜 보여주게 됨 -->
	  <ol class="carousel-indicators cusor">
	  <jsp:useBean id="bookDAO" class="book.BookDAO"/>
	  <%
	  	ArrayList<Book> booklist = bookDAO.recomList();
	  	if(booklist.size()==0){
	  %>
	    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    <%}else{ 
	    for(int i = 0 ; i<booklist.size();i++){
	    if(i==0){%>
	    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    <%}else{ %>
	    <li data-target="#myCarousel" data-slide-to="<%= i%>"></li>
	    <%} %>
	    <%}} %>
	  </ol>
		  <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	    <%if(booklist.size()==0){ %>
	      <div class="item active img1">
	        <img src="IMAGE/img/recommand.png" alt="책이름" >
	        <h3>추천하는 도서는 지금은 없습니다!</h3>
	      </div>
	     <%}else{ %>
	     <%for(int t=0 ; t< booklist.size();t++){ %>
	     <%if(t==0){ %>
	      <div class="item img1 active">
	      		<div style = "position : relative">
			        <div class="front1" style = "position: absolute;"><img src="IMAGE/bookImage/<%=booklist.get(t).getBookImg() %>" alt="책이름" id="img2"></div>
			        <div class="back1"><img src="IMAGE/img/recommand.png" alt="책이름"></div>
			        <h2><%=booklist.get(t).getBookTitle() %></h2>
        			<h3><%=booklist.get(t).getBookAuthor() %></h3>
				</div>
	      </div>
	      <%}else{ %>
	      <div class="item img1">
	      		<div style = "position : relative">
			        <div class="front1" style = "position: absolute;"><img src="IMAGE/bookImage/<%=booklist.get(t).getBookImg() %>" alt="책이름" id="img2"></div>
			        <div class="back1"><img src="IMAGE/img/recommand.png" alt="책이름"></div>
			        <h2><%=booklist.get(t).getBookTitle() %></h2>
        			<h3><%=booklist.get(t).getBookAuthor() %></h3>
				</div>
	      </div>
	      <%}}} %>
	    </div>
		  <!-- 이미지 좌우로 넘기는 키 설정 부분 -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
		</div>
	</div>
	
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "DESIGN/js/bootstrap.js"></script>
</body>
</html>