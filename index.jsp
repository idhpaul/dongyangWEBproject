<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>동양 E 도서관</title>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "stylesheet" href = "css/bootstrap.css">
	<link rel = "stylesheet" href = "css/animate.css">
	<link rel = "stylesheet" href = "css/main.css">
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
    background-image:url("img/mainpage.jpg");
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
<body data-spy="scroll" data-target=".navbar" data-offset="50">
	<jsp:include page="navbar.jsp" flush="false"/>
	<!-- 네비게이션 바 부분 은 후에 maintoolbar.jsp 파일로 변환시켜 include를 통해 불러올 생각을 해봄 -->
	<!-- 섹션 처리부분  -->
	<div id="section41" class="container-fluid mainback">
		<div class="jumbotron">
		  <h1 class="animated fadeIn Title slow">소개내용내용</h1>
			  <div class="animated fadeIn conetent slower">   
			  <p>데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터</p>
			  <p>데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터</p>
			  <p>데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터데이터</p>
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
	    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    <li data-target="#myCarousel" data-slide-to="1"></li>
	  </ol>
		  <!-- Wrapper for slides -->
	    <div class="carousel-inner">
	      <div class="item active img1">
	        <img src="img/recommand.png" alt="책이름" >
	      </div>
	      <div class="item img1">
	      		<div style = "position : relative">
			        <div class="front1" style = "position: absolute;"><img src="bookdata/bonobono1.jpg" alt="책이름"></div>
			        <div class="back1"><img src="img/recommand.png" alt="책이름"></div>
			        <h3>보노보노처럼 살다니 다행이야</h3>
        			<p>컨텐츠 내용 책줄거리 요약 DB에서 꺼내서 입력</p>
				</div>
	      </div>
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
	<script src = "js/bootstrap.js"></script>
</body>
</html>