<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>uuidOk.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<p>출력결과: ${uid}</p>
	<p><a href="" class="btn btn-primary">돌아가기</a>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>