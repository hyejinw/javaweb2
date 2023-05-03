<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl5.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<P><br /></P>
<div class="container">	
	<h2>2차원 배열값을 출력</h2>
<%
	String[][] address = {
			{"홍길동","서울"},
			{"김말숙","청주"},
			{"이기자","울산"},
			{"소나무","제주"}			
	};
	pageContext.setAttribute("address", address);
%>	

	<c:forEach var="temp" items="${address}">  <!-- 가로줄 총 4번 반복 -->
		<c:forEach var="t" items="${temp}" begin="0" end="1">   <!-- 세로줄 총 2번 반복 -->
			${t}
		</c:forEach>
		<br/>
	</c:forEach>
	
</div>	
<P><br /></P>
</body>
</html>