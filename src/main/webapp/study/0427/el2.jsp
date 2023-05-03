<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>el2.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<P><br /></P>
<div class="container">	
	<h2>form을 통해 넘어온 자료 출력</h2>
	<p>
		취미: ${hobbies}<br/> <!--  이것도 주소로 나온다. -->
		${hobbies[0]} / ${hobbies[1]} 
	</p>
	
	<hr/>
	<p><a href="${pageContext.request.contextPath}/study/0427/form2.jsp" class="btn btn-info">돌아가기</a></p>
</div>	
<P><br /></P>
</body>
</html>