<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2>회 원 전 용 방</h2>
	<hr/>
	<div>
		<p><font color="blue">${sNickName}님</font>(${strLevel}) 로그인 중</p>
		<p>누적 포인트: ${point}</p>
		<p>총 방문 횟수: ${visitCnt}</p>
		<p>오늘 횟수: ${todayCnt}</p>
		<p>프로필 사진: <img src="${ctp}/images/member/${photo}" width="200px"/></p>
		<p>작성한 방명록 수: ${res}</p>
		<p><a href="${ctp}/MemberGuestList.mem" class="btn btn-success">작성한 글 보기</a></p> <!-- 이름이 같거나 아이디가 같으면, 닉네임이 같으면 해당 사람이 쓴 글이다. -->
		<p></p>
	</div>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>