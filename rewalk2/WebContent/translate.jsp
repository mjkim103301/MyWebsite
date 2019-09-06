<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>사진 번역</title>
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
				<li ><a href="bbs.jsp">이달의 여행기</a></li>
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
			
		</thead>
		<tbody>
		
			<input type="file" name="filename1" size=40>
			
			<%
		request.setCharacterEncoding("euc-kr");
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 1024*1024*5;
		 String encType = "euc-kr";
		 String savefile = "img";
		 ServletContext scontext = getServletContext();
		 realFolder = scontext.getRealPath(savefile);
		 
		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
		 
		 String fullpath = realFolder + "\\" + filename1;
		
		%>
			<img src="<%=fullpath%>" width=512 height=384></img> <br>
			<input type="button" value="번역하기" size=40>
			<tr>	
				
				<td colspan="2" style="min-height:200px; text-align:left;">
				
				</td>
			</tr>
		
		</tbody>
	
		</table>
	
		
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>