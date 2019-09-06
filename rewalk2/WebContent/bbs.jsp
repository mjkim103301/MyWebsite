<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>이달의 여행기</title>
<style type="text/css">
	a,a:hover{
	color:#000000;
	text:decoration:none;
	}
</style> 
</head>
<body>
	<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">rewalk2 여행일기 웹사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">이달의 여행기</a></li>
				<%
				if(userID!=null){ 
				%>
				<li ><a href="mypage.jsp">나의 여행기</a></li>
				<%
				} 
				%>
				
			</ul>
			<%
			if(userID==null){ 
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dorpdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">시작하기<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li> <a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>	
			<%
			}else{
			%>
		
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dorpdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">마이페이지<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li> <a href="logoutAction.jsp">로그아웃</a></li>
						<li> <a>회원탈퇴</a></li>
						
					</ul>
				</li>
			</ul>	
			<%
			}
			%>	
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color :#eeeeee; text-align:center;">등수</th>
				<th style="background-color :#eeeeee; text-align:center;">제목</th>
				<th style="background-color :#eeeeee; text-align:center;">여행기간</th>
				<th style="background-color :#eeeeee; text-align:center;">작성자</th>
				<th style="background-color :#eeeeee; text-align:center;">작성일</th>
				<th style="background-color :#eeeeee; text-align:center;">♥좋아요♥</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>제주도 여행기</td>
				<td>2017.05.04 - 2017.05.10</td>
				<td>홍길동</td>
				<td>2019-08-18</td>
				<td>3</td>
			</tr>
		</tbody>
		</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>