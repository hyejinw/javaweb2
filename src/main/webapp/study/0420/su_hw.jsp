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
		<h3>입력값 정렬하기</h3>
			<form name="myform" method="post" action="<%=request.getContextPath()%>/t0420/SuCheck">
			<div>
				숫자 1 : <input type="number" name="su" value="1" class="form-control" />
			</div>
			<div>
				숫자 2 : <input type="number" name="su" value="2" class="form-control" />
			</div>
			<div>
				숫자 3 : <input type="number" name="su" value="3" class="form-control" />
			</div>
			<div>
				숫자 4 : <input type="number" name="su" value="4" class="form-control" />
			</div>
			<div>
				숫자 5 : <input type="number" name="su" value="5" class="form-control" />
			</div>
			<div>
				<input type="submit" value="전송" class="btn btn-success mt-4" />
			</div>
		</form>
	</div>	
<P><br /></P>
</body>
</html>