<!-- t2_SessionGroup.jsp -->
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include/bs4.jsp"/>
<div class="container">
<%
	// String name = (String)session.getAttribute("sName");
	
	// Enumeration getAttributeNames() : 기본 객체에 저장된 모든 속성의 이름을 반환!
	// void setAttribute(String namd, Object value) : 지정된 값을 지정된 속성 이름으로 저장
	// Object getAttributes(String name) : 지정된 이름으로 지정된 속성의 값을 반환
	// void removeAttribute(String name) : 지정된 이름의 속성을 삭제

	Enumeration names = session.getAttributeNames(); // enum은 열거형이다. hasMoreElements = 값이 있느냐?
	
	while(names.hasMoreElements()) {
		String name = (String) names.nextElement();
		out.println("세션명 : " + name + "<br/>");
	}
%>
	<p>
		<a href="t2_SessionMain.jsp" class="btn btn-success">돌아가기</a>
	</p>
</div>