<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<form name="myform" method="post" action="${ctp}/database/LoginOk">
		<table class="table table-bordered text-center">
			<tr>
				<td colspan="2"><font size="5">로 그 인 3</font></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" autofocus required class="form-control"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" required class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn btn-success mr-4"/>
					<input type="reset" value="다시 입력" class="btn btn-warning mr-4"/> 
					<input type="checkbox" name="idSave" checked /> 아이디 저장
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="비밀번호 찾기" onclick="location.href='${ctp}/Finder.fa';" class="btn btn-secondary mr-4"/>
					<input type="button" value="회원 가입" onclick="location.href='${ctp}/Join.fa';" class="btn btn-primary"/>
				</td>
			</tr>
		</table>
	</form>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>