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
			const regex2 = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/g; //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
			
			let oldPwd = document.getElementById("oldPwd").value;
			let newPwd = document.getElementById("newPwd").value;
			let rePwd = document.getElementById("rePwd").value;
			
			if(oldPwd.trim() == "") {
				alert('기존 비밀번호를 입력해주세요');
				document.document.getElementById("oldPwd").focus();
			}
			else if(newPwd.trim() == "") {
				alert('새 비밀번호를 입력해주세요');
				document.document.getElementById("newPwd").focus();
			}
			else if(rePwd.trim() == "") {
				alert('새 비밀번호를 한 번 더 입력해주세요');
				document.document.getElementById("rePwd").focus();
			}
			else if(!regex2.test(newPwd)) {
				alert('비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)');
				document.document.getElementById("newPwd").focus();
			}
			else if(newPwd != rePwd) {
				alert('비밀번호가 동일하지 않습니다.');
				document.document.getElementById("rePwd").focus();
			}
			else if(newPwd == oldPwd) {
				alert('기존 비밀번호와 동일합니다. 변경 후 진행해주세요.');
				document.document.getElementById("newPwd").focus();
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
	<form name="myform" method="post" action="${ctp}/MemberPwdUpdateOk.mem" class="was-validated">
		<br/>
		<table class="table table-hover">
			<tr>
				<th>기존 비밀번호</th>
				<td>
					<input type="password" name="oldPwd" id="oldPwd" autofocus required class="form-control"/>
					<div class="invalid-feedback">기존 비밀번호를 입력하세요.</div>
				</td>
			</tr>		
			<tr>
				<th>새 비밀번호</th>
				<td>
					<input type="password" name="newPwd" id="newPwd" required class="form-control"/>
					<div class="invalid-feedback">새 비밀번호를 입력하세요.</div>
				</td>
			</tr>		
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="rePwd" id="rePwd" required class="form-control"/>
					<div class="invalid-feedback">새 비밀번호를 다시 입력하세요.</div>
				</td>
			</tr>	
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="비밀번호 변경" onclick="fCheck()" class="btn btn-success mr-2"/>
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