<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t_initRes.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<P><br /></P>
<div class="container">	
	<h2>이곳은 init(Servlet)에서 보낸 값을 찍어보는 공간</h2>
	<p>
		부서명 : ${logoName}<br/>
		홈페이지 주소 : ${homeAddress}
	</p>
</div>	
<P><br /></P>
</body>
</html>