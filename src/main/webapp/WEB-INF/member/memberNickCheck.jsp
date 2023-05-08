<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MemberNickCheck.java</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<script>
		'use strict';
		
		function sendCheck() {
			opener.window.document.myform.nickName.value = '${nickName}';
			opener.window.document.myform.nickName.focus();
			window.close();
		}
		function nickCheck() {
			let nickName = childForm.nickName.value;
			
			if(nickName.trim() == "") {
				alert("닉네임을 입력하세요");
				childForm.nickName.focus();
			}
			else {
				childForm.submit();
			}
		}
	</script>
</head>
<body>
<P><br /></P>
<div class="container">	
	<h3>닉네임 체크폼</h3>
	<c:if test="${res == 1}">
		<h4><font color="blue"><b>${nickName}</b></font> 닉네임은 중복되지 않았습니다.</h4>
		<p><input type="button" value="창 닫기" onclick="sendCheck()"/></p>
	</c:if>
	<c:if test="${res != 1}">
		<h4><font color="blue"><b>${nickName}</b></font> 닉네임은 이미 사용 중입니다.</h4>
		<form name="childForm" method="post" action="${ctp}/MemberNickCheck.mem">
			<p>
				<input type="text" name="nickName"/>
		    <input type="button" value="닉네임 재검색" onclick="nickCheck()"/>
			</p>
		</form>
	</c:if>
</div>	
<P><br /></P>
</body>
</html>