<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <jsp:include page="/include/memberCheck.jsp"></jsp:include> 왜 이렇게만 되는 걸까?  --%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>finderRes.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<style>
		th {
			background-color:#eee;
			text-align: center;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">
	<h2>비밀번호 찾기 결과</h2>	
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>${vo.mid}</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>${vo.name}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td class="font-weight-bolder text-danger">
				<c:forEach var="i" begin="0" end="${fn:length(vo.pwd)-1}">
					<c:if test="${(i % 2) == 0}">${fn:substring(vo.pwd,i,i+1)}</c:if>
					
					<c:if test="${(i % 2) != 0}">
						${fn:replace(fn:substring(vo.pwd,i,i+1),fn:substring(vo.pwd,i,i+1), '*')}
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>
	<br/>
 	<p>
		<a href="${ctp}/study/0428_database/login.jsp" class="btn btn-success mr-2">돌아가기</a>
	</p>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>