<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name= request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender= request.getParameter("gender");
	
	String[] hobbies = request.getParameterValues("hobby");   // 값이 배열로 넘어올 때는 values로 적어주자!
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2Ok.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
	<style>
		
	</style>
</head>
<body>
<P><br /></P>
	<div class="container">	
		<h2>전송된 값 출력하기</h2>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><%=age %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=gender %></td>
			</tr>
			<tr>
				<th>취미</th>
				<%-- <td><%=hobbies %></td>  이렇게 적으면 주소로 나온다.--%>       
				<td>
<%-- 			<%
						for(String hobby : hobbies) {
							out.print(hobby + " | ");
						}
					%>
 --%>					
 				  <%
 				  	String str = "";          // 이렇게 적으면 값을 수정할 수 있다.
						for(String hobby : hobbies) {
							str += hobby + " | ";
						}
						str = str.substring(0, str.length()-2); // 이런 식으로!
						out.print(str);
					%>
				</td>       
			</tr>
		</table>
		<br/>
		<p class="text-center">
			<a href="test2.jsp" class="btn btn-success">돌아가기</a>
		</p> 
	</div>	
<P><br /></P>
</body>
</html>