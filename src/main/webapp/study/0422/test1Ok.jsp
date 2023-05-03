<!-- test1Ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
%>
<jsp:include page="/include/bs4.jsp"/> 
<p><br/></p>
<div class="container">
	<p>아이디 : <%=mid %></p>
	<p>비밀번호 : <%=pwd %></p>
	<p><a href="test1.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<% if(mid.equals("admin") && pwd.equals("1234")) { %>
			<jsp:forward page="test1Res.jsp">
				<jsp:param value="<%=mid %>" name="mid"/>
				<jsp:param value="<%=pwd %>" name="pwd"/>
				<jsp:param value="insa" name="flag"/>
			</jsp:forward>		<!-- dispatcher forward 처럼 url무시, 값 전달만 하면 역할을 마친다. -->
<% } else if(mid.equals("hkd1234") && pwd.equals("1234")) { %>
			<jsp:forward page="test1Res.jsp">
				<jsp:param value="<%=mid %>" name="mid"/>
				<jsp:param value="<%=pwd %>" name="pwd"/>
				<jsp:param value="jaje" name="flag"/>
			</jsp:forward>		<!-- dispatcher forward 처럼 url무시, 값 전달만 하면 역할을 마친다. -->
<% } else { %>
			<jsp:forward page="test1.jsp" />		
<% } %>