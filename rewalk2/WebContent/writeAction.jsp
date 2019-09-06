<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>

<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<jsp:setProperty name="bbs" property="bbsPublicCheck"/>
<jsp:setProperty name="bbs" property="bbsStartDate"/>
<jsp:setProperty name="bbs" property="bbsEndDate"/>

<%-- <jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>여행기 썼을때 실제 동작하는 페이지</title>
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
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		
	
		if( bbs.getBbsTitle()==null||bbs.getBbsContent()==null )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{ 
			BbsDAO bbsDAO=new BbsDAO();
			int result=bbsDAO.write(bbs, bbs.getBbsTitle(), userID, bbs.getBbsContent(), bbs.getBbsPublicCheck(), bbs.getBbsStartDate(), bbs.getBbsEndDate());
			
			if(result==-1){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('저장 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				
				PrintWriter script=response.getWriter();
				script.println("<script>");
		
				script.println("location.href='mypage.jsp'");
				script.println("</script>");
			}
		}
	}
	
	%>
</body>
</html>