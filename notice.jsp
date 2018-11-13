<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel = "stylesheet" href = "css/bootstrap.css">
	<link rel = "stylesheet" href = "css/animate.css">
<title>동양 E 도서관</title>
</head>
<style>
	.conf{
		margin-top: 110px;
	}
	.headtitle{
		font-size: 36px;
   	    line-height: 40px;
   	    margin: 20px;
	}
	.borderd{
	border-left: 2px;
	}
</style>

<body>
	<jsp:include page="navbar.jsp" flush="false"/>
	<div class="container conf">
	  <div class="row">
	    <nav class="col-sm-3">
	      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
	        <li id="req" class=""><a href="notice.jsp?page=request">희망도서 신청</a></li>
	        <li id="faq" class=""><a href="notice.jsp?page=faq">문의 사항</a></li>
	      </ul>
	    </nav>
	    <div class="col-sm-9" style = "border-left: 10px;">
	    <div class="headtitle">
	    <!-- 페이지 파라메터 분석해서 페이지 문의인지 희망도서인지 분석하는부분 -->
	    <% 
	    	String str = request.getParameter("page");
	    	if(str.equals("request")){
	    %>
	    	희망도서 요청
	    <% }else{ %>
	    	문의사항
	    <% } %>
	    </div>
	      <table class = "table table-striped" style = "text-align: center; border : 1px solid #dddddd">
	      		<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<!-- 나중에 DB 데이터 불러올때 여기서 위와같이 페이지 파라메터 분석해서
					해당데이터 만큼 데이터 불러오면 됨
				 -->
				<tr>
					<td>1</td>
					<td>dddddd</td>
					<td>강효석</td>
					<td>1995/02/15</td>
				</tr>
				<tr>
					<td>1</td>
					<td>dddddd</td>
					<td>강효석</td>
					<td>1995/02/15</td>
				</tr>
				<tr>
					<td>1</td>
					<td>dddddd</td>
					<td>강효석</td>
					<td>1995/02/15</td>
				</tr>
				<tr>
					<td>1</td>
					<td>dddddd</td>
					<td>강효석</td>
					<td>1995/02/15</td>
				</tr>
				</tbody>
	      </table>
	    </div>
	  </div>
	</div>
	<!-- parameter값을 읽어 해당 목록 카테고리  활성화 시켜주는 역할을 함 -->
	<!-- 여기 하단부에 위치해야됨  -->
	<script>
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		var page =  getParameterByName('page');
		if(page == "request"){
			var element = document.getElementById( "req" );
			element.classList.add("active");
		}else{
			var element = document.getElementById( "faq" );
			element.classList.add("active");
		}
	</script>
	<script src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>