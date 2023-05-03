<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<%-- <jsp:include page="/include/memberCheck.jsp"></jsp:include> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		th {
			background-color: #ccc;
		}
	</style> 
	<script>
		'use strict';
		
		function fCheck() {
			// form의 내용을 가져와서 유효성 검사(아이디/ 비밀번호/ 성명...  공백과 길이 체크... 길이는 모두 20글자 이내)
			
			myform.submit();
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2>비밀번호 찾기 3</h2>
	<form name="myform" method="post" action="${ctp}/FinderOk.fa" >
		<table class="table text-center">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" id="mid" required class="form-control"/></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="name" required class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="비밀번호 찾기" class="btn btn-primary mr-2"/>
					<input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/Login.fa';" class="btn btn-secondary"/>
				</td>
			</tr>
		</table>
	</form>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>