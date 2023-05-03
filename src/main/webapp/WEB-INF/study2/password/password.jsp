<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<script>
		'use strict';
		
		function pwdCheck(idx) {
			let pwd = myform.pwd.value.trim();
			myform.idx.value = idx;
			
			if(pwd == "") {
				alert("비밀번호를 입력하세요");
				myform.pwd.focus();
			}
			else {
				if(idx == 1 || idx == 2) {
					myform.action = "${ctp}/PassOk1.st";
				}
				else if(idx == 3) {
					myform.action = "${ctp}/PassOk2.st";
				}
				myform.submit();
			}
		}
	
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2>비밀번호 암호화 연습</h2>
	<p>(비밀번호를 10자 이내로 입력하세요)</p>
	<form name="myform" method="post">
		<table class="table table-bordered">
			<tr>
				<td>
					<p>아이디 : <input type="text" name="mid" value="hkd1234" class="form-control"/></p>
					<p>비밀번호 : <input type="password" name="pwd" maxlength="9" autofocus class="form-control"/></p>
					<p>
						<input type="button" value="확인(숫자비번)" onclick="pwdCheck(1)" class="btn btn-success mr-3"/>
						<input type="button" value="확인(혼합비법)" onclick="pwdCheck(2)" class="btn btn-primary mr-3"/>
						<input type="button" value="확인(SHA-256)" onclick="pwdCheck(3)" class="btn btn-warning"/>
					</P>
				</td>
			</tr>
		</table>
		<input type="hidden" name="idx"/>
	</form>
	<hr/>
	<h3>SHA(Secure Hash Algorithm)</h3>
	<pre>
		: 복호화하는 알고리즘은 안 좋은 거다.
		: SHA 단방향식 암호화 기법으로, 암호학적 해시함수들의 모임이다.
		일반적으로 복호화 할 수 없도록 만든 알고리즘을 SHA-2라고 한다.
		해시함수가 출력하는 암출된 문장을 다이제스트(Digest)라고 하는데,
		이때 SHA-2가 생성해주는 다이제스트의 출력길이는 256, 512Bit가 있다.
		이때 256Bit의 출력 길이를 갖는 SHA-2 암호화를 'SHA-256 암호화' 방식이라고 한다.
	</pre>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>