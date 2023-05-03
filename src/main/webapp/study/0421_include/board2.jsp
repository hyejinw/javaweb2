<!-- board.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>board.jsp</title>
	<jsp:include page="/include/bs4.jsp" /> <!-- jsp액션 태그 안에서의 '/'는 ContextPath명으로 간주된다. -->
</head>
<body>
<!-- 헤더 영역(로고/메뉴)를 표시 -->
<div id="header"  class="text-center" style="background-color:skyblue">
	<%@ include file="menu.jsp" %> 
	<%-- <jsp:include page="<%=request.getContextPath() %>/study/0421_include/menu.jsp"/> --%>
</div>
<P><br /></P>
<!-- 	<div class="container" style="height:1000px"> -->	
	<div class="container">	
		<!-- 본문 영역 -->
		<!-- 세로부분은 공백을 좀 띄워도 된다. 다만 가로는 주의하자!!! 바로바로 픽셀단위 때문에 골치가 아파진다. -->
		<div id="content" class="text-center">
			<h2>이곳은 게시판입니다.</h2>
			<hr/>
			<p><img src="../../images/3.jpg" width="600px" />
			<hr/>
		</div>	
	</div>	
<P><br /></P>
	<!-- footer 영역(Copyright/주소/소속/이메일/작성자 등) -->
	<div id="footer">
		<%@ include file="footer.jsp" %> 
	</div>
</body>
</html>