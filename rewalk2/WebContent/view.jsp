<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>여행기 보기</title>
</head>
<body>
	<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
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
	
	String bbsPublicCheck=request.getParameter("bbsPublicCheck");
	
	
	Bbs bbs=new BbsDAO().getBbs(bbsID);
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
				<th colspan="3" style="background-color :#eeeeee; text-align:center;">여행기 보기</th>
				
			</tr>
		</thead>
		<tbody>
			
			<tr>
				<td style="width:20%;">여행기 제목</td>
				<td colspan="2"><%=bbs.getBbsTitle() %></td>
			</tr>
			<tr>
				<td >여행 기간</td>
				<td colspan="2"><%=bbs.getBbsStartDate().substring(0,10) +" ~ "+bbs.getBbsEndDate().substring(0,10) %></td>
			</tr>
			<tr>	
				<td >작성자</td>
				<td colspan="2"><%=bbs.getUserID()%></td>
			</tr>
			<tr>	
				<td >작성일자</td>				
				<td colspan="2"><%=bbs.getBbsDate().substring(0,11)+bbs.getBbsDate().substring(11,13)+"시" + bbs.getBbsDate().substring(14,16)+"분"%></td>
			</tr>
			<tr>	
				<td >내용</td>
				<td colspan="2" style="min-height:200px; text-align:left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>")%></td>
			</tr>
			<tr>	
				<td >공개여부</td>
				<td colspan="2" ><%=bbs.getBbsPublicCheck()%></td>
			<%-- 	<%
				if(bbsPublicCheck=="1")
				{
				%>
				
					<td colspan="2" >공개</td>
				<%
				}
				else if(bbsPublicCheck=="0")
				{
				%> 
				<td colspan="2" >비공개</td>
				<%
				}
				else 
				{
				%> 
				<td colspan="2" >값이 제대로 안들어감</td>
				<%
				}
				%> --%>
				
			</tr>
		</tbody>
	
		</table>
		<a href="mypage.jsp" class="btn btn-primary">목록</a>
		<%
		if(userID!=null&&userID.equals(bbs.getUserID())){
		%>
			<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
			<a href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
		<% 
		}
		%>
		<!--  <div class="btn btn-primary active">
			<label class="btn btn-primary active">
			<input type="radio" name="bbsPublicCheck" autocomplete="off" value="1" checked maxlength="20">공개
									
			</label>
			<label class="btn btn-primary active">
			<input type="radio" name="bbsPublicCheck" autocomplete="off" value="0" checked maxlength="20">비공개
									
			</label>
			
		</div>  -->
			
		
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>