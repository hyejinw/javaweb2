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
		<h2>Null값 처리하기</h2>
		<p>전송 방식: get / post</p>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/t0421/Test1Ok">
			<p>
				아이디: <input type="text" name="mid" id="mid" />
			</p>
			<p>
				<input type="submit" value="전송(post)" class="btn btn-success" />
				<input type="button" value="전송(get)" onclick="location.href='<%=request.getContextPath()%>/t0421/Test1Ok';" class="btn btn-info" />
			</p>                                                          <!--  get방식은 따로 설정하지 않으면 값을 들고 가지 않는다. -->
			<input type="hidden" name="name" value="홍길동" />
			<input type="hidden" name="job"/>
		</form>
	</div>	
<P><br /></P>
</body>
</html>