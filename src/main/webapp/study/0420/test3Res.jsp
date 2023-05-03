<!-- test3Res.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
%>
<script>
	alert('<%=name%>자료가 저장되었습니다.');
	location.href = '<%=request.getContextPath()%>/study/0420/test3.jsp';
</script>      <!-- 서블릿 내용을 삽입해야 하기 때문에 표현식으로 적어줘야 한다. -->