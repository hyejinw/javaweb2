<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp"></jsp:include>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	 	'use strict';
	 	
	 	function searchCheck() {
	 		let temp ="";
	 		temp += '검색할 아이디 : ';
	 		temp += '<input type="text" name="mid" id="mid" class="mr-3"/>';
	 		temp += '<input type="button" value="아이디 검색" onclick="idCheck()" class="btn btn-secondary"/>';
	 		demo.innerHTML = temp;
	 	}
	 	
	 	function idCheck() {
	 		let mid = document.getElementById("mid").value;
	 		location.href ="${ctp}/LoginSearch.fa?mid=" + mid;
	 	}
	</script> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container text-center">	
	<h2>회원 전용 방</h2>
	<br/>
	<p>현재 ${sMid}(${sName})님 로그인 중</p>
	<hr/>
	<p>보유 포인트 : ${sPoint}</p>
	<p>최종 방문일자 : ${fn:substring(sLastDate,0,16)} /  오늘 방문일수 : ${sTodayCount}회</p>
	<hr/>
	<c:set var="random"><%=(int)(Math.random()*6)+1 %></c:set>
	<p><img src="${ctp}/images/${random }.jpg" width="300px" /></p>
	<hr/>
	<div class="row">
		<div class="col"></div>
		<div class="col"><button type="button" onclick="searchCheck()" class="btn btn-primary">개별조회</button></div>
		<div class="col"><a href="${ctp}/List.fa" class="btn btn-warning">전체조회</a></div>
		<div class="col"><a href="${ctp}/Logout.fa" class="btn btn-danger">로그아웃</a></div>
		<div class="col"></div>
	</div>
	<hr/>
	<div id="demo"></div>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>