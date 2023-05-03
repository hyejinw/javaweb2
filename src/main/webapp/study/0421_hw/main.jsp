<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null? "": request.getParameter("sw");
	String member = request.getParameter("member")==null? "": request.getParameter("member"); 
	if(member.equals("OK")) member = "회원";
	else member = "비회원"; 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
	<header>
		<%@ include file="nav.jsp" %> 
	</header>
	<div>
	<% if(sw.equals("reservation")) { %>
		<%@ include file="reservation.jsp" %> 
	<% } else if(sw.equals("menu")) {%>
		<%@ include file="menu.jsp" %> 
	<% } else if(sw.equals("location")) {%>
		<%@ include file="location.jsp" %> 
	<% } else if(sw.equals("brand")) {%>
		<%@ include file="brand.jsp" %> 
	<% } else if(sw.equals("login")) {%>
		<%@ include file="login.jsp" %> 
<%-- 	<% } else if(sw.equals("logout")) {%>
		<%@ include file="logout.jsp" %>  --%>
	<% } else {%>
		<%@ include file="mainContent.jsp" %> 
	<% } %>
	</div>
	
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>