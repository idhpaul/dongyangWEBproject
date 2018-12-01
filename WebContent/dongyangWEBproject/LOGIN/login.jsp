<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href = "../DESIGN/css/bootstrap.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인 페이지</title>
</head>
<style>
	.line{
		line-height: 20px;
		margin-top: 200px;
		margin-bottom: 500px;
	}
	html {
	    position:relative;
	    z-index:1;
	}
	html:after {
	    background-image:url(../IMAGE/img/section1.png);
	    top:0;
	    left:0;
	    position:absolute;
	    background-size:100%;
	    opacity:0.5!important;
	    filter:alpha(opacity=50);
	    z-index:-1;
	    content:"";
	    width:100%;
	    height:100%;
	}
</style>
<body>
	<jsp:include page="../HEADER/navbar.jsp" flush="false"/>
		<div class="container line">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style ="padding-top : 20px;">
			<form  method="get" action="loginAction.jsp">
				<h3 style = "text-align : center;">로그인 화면</h3>
				<div class = "form-group">
					<input type = "text" class = "form-control" placeholder="아이디" name = "userId" maxlenth="20">
				</div>
				<div class = "form-group">
					<input type = "password" class = "form-control" placeholder="비밀번호" name = "userPassword" maxlenth="40">
				</div>
				<input type="submit" class = "btn btn-primary form-control" value="로그인">
			</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "../DESIGN/js/bootstrap.js"></script>
</body>

</html>