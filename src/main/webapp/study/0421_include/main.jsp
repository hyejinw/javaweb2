<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null? "": request.getParameter("sw");
	String member = request.getParameter("member")==null? "": request.getParameter("member"); 
	if(member.equals("OK")) member = "정회원";
	else member = "비회원";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<%-- <jsp:include page="<%=request.getContextPath() %>/include/bs4.jsp" /> --%>
	<%-- <jsp:include page="../../include/bs4.jsp" /> --%>
	<%-- 	<jsp:include page="${pageContext.request.contextPath}/include/bs4.jsp" /> --%>
	<jsp:include page="/include/bs4.jsp" /> <!-- jsp액션 태그 안에서의 '/'는 ContextPath명으로 간주된다. -->
</head>
<body>
<!-- 헤더 영역(로고/메뉴)를 표시 -->
<div id="header"  class="text-center" style="background-color:skyblue">
	<%@ include file="menu.jsp" %> 
	<%-- <jsp:include page="<%=request.getContextPath() %>/study/0421_include/menu.jsp"/> --%>
</div>
<P><br /></P>
<!-- 	<div class="container" style="height:1000px"> -->	
	<div class="container">	
		<!-- 본문 영역 -->
		<!-- 세로부분은 공백을 좀 띄워도 된다. 다만 가로는 주의하자!!! 바로바로 픽셀단위 때문에 골치가 아파진다. -->
		<div id="content" class="text-center">
<%    if(sw.equals("guest")) { %>
			<%@ include file="guest.jsp" %>
<%    } else if(sw.equals("board")) { %>
			<%@ include file="board.jsp" %>
<%    } else if(sw.equals("pds")) { %>
			<%@ include file="pds.jsp" %>
<%    } else if(sw.equals("schedule")) { %>
			<%@ include file="schedule.jsp" %>
<%    } else if(sw.equals("photo")) { %>
			<%@ include file="photo.jsp" %>
<%    } else if(sw.equals("login")) { %>
			<%@ include file="login.jsp" %>
<%    } else { %>
				<h2>이곳은 메인입니다.(<%=member %>)</h2>
				<hr/>
				<p><img src="../../images/1.jpg" width="600px" />
				<hr/>
<%    } %>			
		</div>	
	</div>	
<P><br /></P>
	<!-- footer 영역(Copyright/주소/소속/이메일/작성자 등) -->
	<div id="footer">
		<%@ include file="footer.jsp" %> 
	</div>
</body>
</html>