<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<P><br /></P>
<div class="container">	
	<h4>과제1</h4>
	<hr/>
	<pre>
		String atom="sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis";
		1. 찾고자 하는 문자를 입력받는다.
		2. atom 변수에 포함된 3번째 찾고자 하는 문자의 위치를 찾아서 출력 (검색한 위치값을 모두 출력할 것!)
		
		단, 1)찾고자 하는 문자가 없다면 '검색문자가 없습니다.' 라고 출력
		  	 2)3번째 문자까지를 모두 검색했다면 더 이상 수행하지 않도록 프로그램을 제작
	</pre>
	<hr/>
<%
								 // 	        1         2
						      //01234567890123456789012			
 	/* String atom = "Welcome to My Homepage!";  */
	String atom = "sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis";
	pageContext.setAttribute("atom", atom);
	
	String location = request.getParameter("location")==null ? "" : request.getParameter("location");
	pageContext.setAttribute("location", location);
	
%>
	<form name="myform">
		<input type="text" name="location" placeholder="위치를 알고 싶은 문자 입력" class="form-control"/><br/>
		<input type="submit" value="검색" class="btn btn-success" />
	</form>
	
	<!-- 값 출력 -->
	<div class="text-center"><br/><hr/><br/>
		검색 결과 <br/>
		------------------------ <br/>
		<c:set var="done_loop" value="false"/>
		<c:set var="cnt" value="0"/>
		<c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
			<c:if test="${done_loop ne true}">
				<c:if test="${cnt+0 < 3}">
					<c:if test="${fn:substring(atom, i, i+1) eq location}" >
						검사 횟수: ${cnt+1}&nbsp;&nbsp;&nbsp;&nbsp;
						<c:set var="cnt" value="${cnt + 1}"/> ${i}번째 <br/>
						<!-- !!!!!break!!!!! -->
						<c:if test="${cnt+0 == 3}"><c:set var="done_loop" value="true"/></c:if>
					</c:if>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if test="${cnt+0 == 0}">입력하신 ${location} 문자는 없습니다.</c:if>
	</div>
</div>	
<P><br /></P>
</body>
</html>