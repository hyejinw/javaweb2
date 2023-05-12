<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberPwdUpdate.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<script>
		'use strict';
		
		function fCheck() {
			let pwd = document.getElementById("pwd").value;
			
			if(pwd.trim() == "") {
				alert('비밀번호를 입력해주세요');
				document.document.getElementById("pwd").focus();
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<form name="myform" method="post" action="${ctp}/MemberPwdCheckOk.mem" class="was-validated">
		<br/>
		<table class="table table-hover">
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" id="pwd" autofocus required class="form-control"/>
					<div class="invalid-feedback">기존 비밀번호를 입력하세요.</div>
				</td>
			</tr>		
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="비밀번호 확인" onclick="fCheck()" class="btn btn-success mr-2"/>
					<input type="reset" value="다시 입력" class="btn btn-success mr-2"/>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/MemberMain.mem';" class="btn btn-success mr-2"/>
				</td>
			</tr>	
		</table>
	</form>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>