<!-- t2_SessionDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate(); //현재 브라우저를 통해서 저장된 모든 세션 삭제! 전부 삭제한다!  브라우저당 1개의 세션이 만들어진다. 그러므로 해당 브라우저의 세션을 삭제하고 싶다면 한 번만 지우면 된다.
%>
<script>
  alert("세션값 모두 삭제 완료!!!! 세션값 : ${sMid}");
  location.href = "t2_SessionMain.jsp";
</script>