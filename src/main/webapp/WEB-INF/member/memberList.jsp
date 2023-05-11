<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberList.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2 class="text-center">전체 회원 리스트</h2>
	<br/>
	<table class="table table-hover text-center">
		<tr class="table-dark test-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>별명</th>
			<th>성명</th>
			<th>성별</th>
		</tr>	
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.mid}</td>
				<td>${vo.nickName}</td>
				<td>
					<c:if test="${vo.userInfor == '공개'}">${vo.name}</c:if>
					<c:if test="${vo.userInfor != '공개'}"><font color="blue"><b>비공개</b></font></c:if>
				</td>
				<td>${vo.gender}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="5" class="m-0 p-0"></td></tr>
	</table>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>