<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String member2 = request.getParameter("member")==null? "": request.getParameter("member"); 
%>
<%-- <%@ include file="../../include/bs4.jsp" %> --%>
<%-- <%@ include file="<%=request.getContextPath() %>/include/bs4.jsp";%> jsp 코드 안에는 jsp 코드를 또 사용할 수 없다. --%>
<%-- <jsp:include page="<%=request.getContextPath() %>/include/bs4.jsp"/> --%>
<!-- 어차피 main에서 include를 걸거기 때문에 여기까지 걸 필요가 없다. 오류는 안 나지만 굳이 쓸 필요가 없다. -->
<!-- <div class="text-center"> -->
<div style="height:130px; text-align:center;">
	<br/><br/>
	<a href="main.jsp?member=<%=member2 %>" class="btn btn-outline-primary">홈으로</a> |
	<a href="main.jsp?sw=guest&member=<%=member2 %>" class="btn btn-outline-primary">방명록</a> |
	<a href="main.jsp?sw=board&member=<%=member2 %>" class="btn btn-outline-primary">게시판</a> |
<% if(member2.equals("OK")) {%>
		<a href="main.jsp?sw=pds&member=<%=member2 %>" class="btn btn-outline-primary">자료실</a> |
		<a href="main.jsp?sw=schedule&member=<%=member2 %>"class="btn btn-outline-primary">스케줄 관리</a> | 
		<a href="main.jsp?sw=photo&member=<%=member2 %>"class="btn btn-outline-primary">포토 갤러리</a> | 
		<a href="main.jsp?sw=logout"class="btn btn-outline-primary">로그아웃</a> 
<% } else { %>
		<a href="main.jsp?sw=login"class="btn btn-outline-primary">로그인</a> 
<% }%>
</div>