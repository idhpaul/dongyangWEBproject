<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 이 jsp 문서는 상단의 네비게이션 바를 따로 분리해놓은 문서입니다. navbar의 로그인 작용과 같은 작업들은 이쪽에서 진행을 해주시면 됩니다-->

<% 
	//네비게이션바 절대경로 설정
	String path = "/DongyangWEB/dongyangWEBproject/"; 
  
	//로그인 확인 변수
	String userId = (String)session.getAttribute("userId");
%>
  
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <!-- 모바일 사이즈로 작아졌을때 메누바에 표시할 메뉴 바 -->
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="<%=path %>index.jsp">동양도서관</a>
	    </div>
	    <div>
	      <div class="collapse navbar-collapse" id="myNavbar">
	        <ul class="nav navbar-nav">
	        <!-- 여기 메인페이지 드랍아운 부분 ul 안쪽에 li를 추가하면 메뉴항목 늘어남 -->
	          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">도서관 소개 <span class="caret"></span></a>
	            <ul class="dropdown-menu">
	              <li><a href= "<%=path %>index.jsp#section41">도거관 소개</a></li>
	              <li><a href="<%=path %>index.jsp#section42">이달의 추천 도서</a></li>
	            </ul>
	          </li>
	          <li>
	          	<a href = "<%=path %>libnotice.jsp">희망도서 요청</a>
	          </li>
	          <li>
	          	<a href = "<%=path %>libprocessor.jsp">도서관 이용</a>
	          </li>
	          <!-- 새로 메뉴에 새로훈 항목을 추가할떄는 이쪽 -->
	          <!-- 
		          <li><a href = "#">메뉴이름</li> <ㅡ 이런형태로 추가하면 늘어남
	           -->
	        </ul>
	        <!-- 로그인 구현 페이지 후에 아이디를 접속했을때 저부분이 다바뀌어 다 로그인 했을떄로 보여지게 구연할 예정 -->
	        <% if(userId == null){ %>
	        	<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href='#' class ="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href = "<%=path %>LOGIN/login.jsp">로그인</a></li>
							<li><a href = "<%=path %>LOGIN/join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			<% }else{ %>
				<ul class="nav navbar-nav navbar-right">
      				<li><p class="navbar-text"><a href="libprofile.jsp"><%=userId %></a>님 반갑습니다.</p></li>
      				<li><a href="<%=path %>LOGIN/logout.jsp"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
   				</ul>
			<%} %>
	      </div>
	    </div>
	  </div>
	</nav>
</body>
</html>