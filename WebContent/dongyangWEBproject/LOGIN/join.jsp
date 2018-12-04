<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel = "stylesheet" href = "../DESIGN/css/bootstrap.css">
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
			<form  method="get" action="joinAction.jsp">
				<h3 style = "text-align : center;">회원가입</h3>
				<div class = "form-group">
					<input type = "text" class = "form-control" placeholder="아이디" name = "userId" maxlenth="20">
				</div>
				<div class = "form-group">
					<input type = "password" class = "form-control" placeholder="비밀번호" name = "userPassword" maxlenth="40">
				</div>
				<div class = "form-group">
					<input type = "text" class = "form-control" placeholder="이름" name = "userName" maxlenth="40">
				</div>
				<div class = "form-group" style = "text-align:center;">
							<input type = "radio" name = "userGender" value="남자">남자
							<input type = "radio" name = "userGender" value="여자" checked="checked">여자
				</div>
				<div class = "form-group">
					<input type = "email" class = "form-control" placeholder="이메일" name = "userEmail" maxlenth="40">
				</div>
				<div class = "form-group" style = "text-align:center;">
					<input type = "checkbox" name="admin" value="1">관리자
				</div>
				<input type="submit" class = "btn btn-primary form-control" value="회원가입">
			</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "../DESIGN/js/bootstrap.js"></script>
</body>
</html>