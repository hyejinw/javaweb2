<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>idFinderRes.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2>아이디 찾기 결과 ✔</h2>	
	<table class="table table-bordered">
		<tr>
			<th>성명</th>
			<td>${name}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${nickName}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td class="text-danger">${mid}</td>
		</tr>
	</table>
	<br/>
 	<p>
		<a href="${ctp}/MemberLogin.mem" class="btn btn-success mr-2">돌아가기</a>
	</p>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>