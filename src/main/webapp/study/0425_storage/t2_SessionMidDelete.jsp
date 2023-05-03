<!-- t2_SessionMidDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("sMid");
	session.removeAttribute("sName");

	// Enumeration getAttributeNames() : 기본 객체에 저장된 모든 속성의 이름을 반환!
	// void setAttribute(String namd, Object value) : 지정된 값을 지정된 속성 이름으로 저장
	// Object getAttributes(String name) : 지정된 이름으로 지정된 속성의 값을 반환
	// void removeAttribute(String name) : 지정된 이름의 속성을 삭제

%>
<script>
  alert("세션에 저장된 아이디 삭제 완료!!!");
  location.href = "t2_SessionMain.jsp";
</script>