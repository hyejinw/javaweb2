<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<P><br /></P>
	<div class="container">	
		<%     // 스크립틀릿 안에서는 주석도 자바의 것으로 쓴다.
			int tot = 0;
			for(int i=1; i<=100; i++) {
				tot += i;
			}
			out.println("1에서 100까지의 합은 " +tot+ " 입니다.");       // view에 찍겠다.
		%>
		<hr/>
		일에서 백까지의 합은? <%=tot %> 입니다.
	</div>	
<P><br /></P>
</body>
</html>