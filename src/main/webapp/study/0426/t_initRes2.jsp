<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t_initRes2.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<P><br /></P>
<div class="container">	
	<h2>이곳은 init2(Servlet)에서 보낸 값을 찍어보는 공간</h2>
	<p>
		부서명 : ${logoName}<br/>
		홈페이지 주소 : ${homeAddress}
	</p>
	<p>
		아이디 : ${iMid}<br/>
		비밀번호 : ${iPwd}
	</p>
</div>	
<P><br /></P>
</body>
</html>