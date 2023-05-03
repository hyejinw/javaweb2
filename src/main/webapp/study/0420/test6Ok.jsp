<!-- test6Ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String[] hobbies = request.getParameterValues("hobby");
	String strHobby = "";
	
	for(String hobby : hobbies) {
		strHobby += hobby + "/";
	}
	strHobby = strHobby.substring(0, strHobby.length()-1);
%>

<p>성명 : <%=request.getParameter("name") %></p>
<p>나이 : <%=request.getParameter("age") %></p>
<p>성별 : <%=request.getParameter("gender") %></p>
<p>취미 : <%=strHobby %></p>
<p>호스트IP : <%=request.getParameter("hostIp") %></p>
<p>전송방식 : <%=request.getMethod() %></p>
<p>접속 URL : <%=request.getRequestURL() %></p>   <!-- 창의 상세 주소 -->
<p>접속 URI : <%=request.getRequestURI() %></p>  <!-- URL애서 도메인 이름을 제외한 주소 -->
<p>접속 서버이름 : <%=request.getServerName() %></p>    
<p>접속 서버 포트 : <%=request.getServerPort() %></p>
<p>접속 Context명 : <%=request.getContextPath() %></p>
<p>접속 프로토콜 : <%=request.getProtocol() %></p>

<!-- <p><input type="button" value="돌아가기" onclick="location.href='test6.jsp';" /></p> -->
<p><input type="button" value="돌아가기" onclick="history.back()" /></p>   <!-- 이건 꽤나 위험한 명령이다. -->
