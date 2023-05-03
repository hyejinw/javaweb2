<!-- 지시자(디렉티브(directive)) 예) 페이지 지시자-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<P><br /></P>
	<div class="container">	
		<h2>JSP 문법</h2>
		<%-- JSP 주석 --%>
		<%
		 // 스크립틀릿(자바코드를 작성하는 영역) 다른 코드들 사이에 자바코드를 적을 수 있다고 생각하자.
		 /*
		 	 자바에서 여러 줄 주석처리
		 	 
		 */
		  System.out.println("이곳은 jsp파일 안 입니다.");   // console에 나온다.
		
			
			out.println("<font color='red'> 이곳은 jsp안에서의 html코드 입니다. </font>");   // view에 나온다.
		%>
		<hr/>
		<%= "안녕하세요. 이곳은 표현식(Expression) 내부입니다." %>                    <%-- 표현식: 변수, 계산식, 메소드 호출 결과를 문자열로 출력하는 데 사용한다. --%> 
	</div>	
<P><br /></P>
</body>
</html>