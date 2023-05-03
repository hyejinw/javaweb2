<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/memberCheck.jsp"></jsp:include>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberSearch.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<style>
		th {
			background-color:#eee;
			text-align: center;
		}
	</style>
	<script>
		'use strict';	
	  function deleteCheck() {
		  let ans = confirm("정말 탈퇴하시겠습니까?");
	  	if(ans) location.href = "${ctp}/database/DeleteOk";
	  }
	
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">
	<h2>개별 회원 조회</h2>	
	<table class="table table-bordered">
		<tr>
			<th>고유번호</th>
			<td>${vo.idx}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${vo.mid}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${vo.pwd}</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>${vo.name}</td>
		</tr>
		<tr>
			<th>포인트</th>
			<td>${vo.point}</td>
		</tr>
		<tr>
			<th>최종 방문일</th>
			<td>${vo.lastDate}</td>
		</tr>
		<tr>
			<th>오늘 방문 횟수</th>
			<td>${vo.todayCount}</td>
		</tr>
	</table>
	<br/>
	<p>
		<a href="${ctp}/study/0428_database/memberMain.jsp" class="btn btn-success mr-2">돌아가기</a>
		<c:if test="${sMid == vo.mid}">
			<a href="${ctp}/database/Update" class="btn btn-success mr-2">정보수정</a>
			<a href="javascript:deleteCheck()" class="btn btn-success mr-2">회원 탈퇴</a>
			<!-- a태그에 함수 부르는 방법 -->
		</c:if>
	</p>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>