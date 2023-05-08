<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>idFinder.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2 class="text-center">아이디 찾기✔</h2>
	<form name="myform" method="post" action="${ctp}/IdFinderOk.mem" >
		<table class="table text-center">
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="name" required class="form-control"/></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName" id="nickName" class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="아이디 찾기" class="btn btn-primary mr-2"/>
					<input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/MemberLogin.mem';" class="btn btn-secondary"/>
				</td>
			</tr>
		</table>
	</form>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>