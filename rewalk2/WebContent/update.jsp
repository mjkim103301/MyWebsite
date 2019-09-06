<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%-- <jsp:setProperty name="bbs" property="bbsID"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>나의 여행기</title>
</head>
<body>
	<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
	int bbsID=0;
	if(request.getParameter("bbsID")!=null){
		bbsID=Integer.parseInt(request.getParameter("bbsID"));		
	}
	if(bbsID==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='mypage.jsp'");
		script.println("</script>");
	}
	Bbs bbs=new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='mypage.jsp'");
		script.println("</script>");
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
				<li class="active"><a href="mypage.jsp">나의 여행기</a></li>
				<%
				} 
				%>
				
			</ul>

		
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
	
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form action="updateAction.jsp?bbsID=<%=bbsID%>" method="post">
		<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color :#eeeeee; text-align:center;">여행기 수정하기</th>
				
			</tr>
		</thead>
		<tbody>
			
			<tr>
				<td><input type="text" class ="form-control" placeholder="여행기 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
			</tr>
			<tr>	
				
				<td><textarea class ="form-control" placeholder="여행기 등록하기" name="bbsContent" maxlength="2048" style="height: 350px"><%=bbs.getBbsContent()%></textarea></td>
				
			</tr>
		</tbody>
	
		</table>
		 <div class="btn btn-primary active">
			<label class="btn btn-primary active">
			<input type="radio" name="bbsPublicCheck" autocomplete="off" value="1" checked maxlength="20">공개
									
			</label>
			<label class="btn btn-primary active">
			<input type="radio" name="bbsPublicCheck" autocomplete="off" value="0" checked maxlength="20">비공개
									
			</label>
			
		</div>
			<input type="submit" class="btn btn-primary pull-right" value="수정하기">	
		</form>
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>