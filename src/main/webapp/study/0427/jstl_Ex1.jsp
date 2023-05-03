<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl_Ex1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	function fCheck() {
  		let number = myform.number.value;
		  let str = demo.innerHTML='<img src="${pageContext.request.contextPath}/images/'+number+'.jpg" width="100px">';
		  demo.innerHTML = str;
  		
  	}	
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <p>
  	콤보상자에 숫자 1~6까지를 기억시키고 화면에 보여준다.<br/>
  	이때 숫자를 선택하면 아래쪽(demo)으로 선택한 숫자의 그림파일을 출력한다.
  </p>
  <div>
  	<form name="myform">
		  <select name="number" onchange="fCheck()" size="6">
	    	<option value="">=== 선택 ===</option>
	 	  	<c:forEach var="i" begin="1" end="6">
			    <option>${i}</option>
	  		</c:forEach>
			  </select>
		</form>
  </div>
	<p><br/></p>
	<div id="demo"></div>
</div>
</body>
</html>







