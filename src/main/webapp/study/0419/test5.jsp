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
		<%!
			public int hap(int su1, int su2) {   // 기본은 default로 된다.
				return su1 + su2;
			}
		%>
		
		<h2>두 수의 합은?</h2>
		
		<%
		 int hap = hap(10,20);		    // 17번 줄에서 정의된 메소드의 값을 가져왔다.
		%>
		<hr/>
		두 수의 합은? <%=hap %> 입니다.

	</div>	
<P><br /></P>
</body>
</html>