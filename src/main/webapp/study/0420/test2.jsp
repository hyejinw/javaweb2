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
	<style>
		div {margin: 10px;}
		
	</style>
	<script>
		'use strict';
		function fCheck() {
			let name = myform.name.value.trim();
			let age = document.getElementById("age").value.trim();
			
			if(name == '') {
				alert("성명을 입력하세요");
				myform.name.focus();
			}
			else if(age < 20) {
				alert("20세 이상만 가입가능합니다.");
				myform.age.focus();
			}
			else {
				myform.submit();    //방법1)myform 의 모든 내용을 가지고 action 으로 보낸다. 
			}											//방법2)location.href 방식은 get방식이다. form에 내용이 많을 경우 값을 변수로 가져가기 힘들다.
		}
	</script>
</head>
<body>
<P><br /></P>
	<div class="container">	
		<h2>값 전송 연습</h2>
		<form name="myform" method="post" action="test2Ok.jsp">
			<div class="border">
				<div>
					성명: <input type="text" name="name" id="name" value="HongGilDong" class="form-control"/>
				</div>
				<div>
					나이: <input type="number" name="age" id="age" value="25" class="form-control" />
				</div>
				<div>
					성별: <input type="radio" name="gender" value="남자" checked />남자 &nbsp;
						   <input type="radio" name="gender" value="여자" />여자 
				</div>
				<div>
					취미:  <!-- 같은 이름으로 된 경우, 배열로 넘어간다. -->
						<input type="checkbox" name="hobby" value="등산" checked /> 등산 &nbsp;
						<input type="checkbox" name="hobby" value="낚시" /> 낚시 &nbsp;
						<input type="checkbox" name="hobby" value="독서" /> 독서 &nbsp;
						<input type="checkbox" name="hobby" value="여행" /> 여행 &nbsp;
						<input type="checkbox" name="hobby" value="춤" /> 춤 &nbsp;
						<input type="checkbox" name="hobby" value="음악감상" /> 음악감상 &nbsp;
						<input type="checkbox" name="hobby" value="영화감상" /> 영화감상
				</div>
			</div>
			<div class="text-center">
				<input type="button" value="전송" onclick="fCheck()" class="btn btn-success mr-3"/>
				<input type="reset" value="다시 입력" class="btn btn-warning"/>
			</div>
		</form>
	</div>	
<P><br /></P>
</body>
</html>