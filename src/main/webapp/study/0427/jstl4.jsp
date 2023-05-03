<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl4.jsp</title>
	<%-- <jsp:include page="/include/bs4.jsp"/>  --%>
</head>
<body>
<P><br /></P>
<div class="container">	
	<h2>Format 라이브러리</h2>
	<pre>
		사용 용도: 형식 문자열 지정할 때 사용(쉼표, 화폐단위, 백분율 등)
		사용 방법: < fmt : 명령어 value=" $ { 값/변수 } " pattern="표현 패턴" type="화폐 단위" />
	</pre>
<%
	int won = 7654321;
	double won2 = 7654.321;
	pageContext.setAttribute("won", won);
	pageContext.setAttribute("won2", won2);
%>
	<div>
		1-1. 천 단위 쉼표 표시<br/>
			1234567 =>  <fmt:formatNumber value="1234567" /> <br/>
			7654321 =>  <fmt:formatNumber value="${won}" /> <br/>
			7654.321 => <fmt:formatNumber value="${won2}" /> <br/>
			7654.321 => <fmt:formatNumber value="${won2}" pattern="0,000,000.0000" /> <br/>
			7654.321 => <fmt:formatNumber value="${won2}" pattern="#,##0.000" /> <br/>
		
		1-2. 화폐단위<br/>
			7654321(원화) =>  <fmt:formatNumber value="${won}" type="currency" /> <br/>
			7654321(US달러) =>  <fmt:formatNumber value="${won}" type="currency" currencyCode="USD" /> <br/>
		
		<c:set var="su1" value="0.9456"/>
		1-3. 백분율<br/>
			0.94556 => <fmt:formatNumber value="${su1}" type="percent" />
			
		2. 날짜<br/>
			 <c:set var="today" value="<%=new Date()%>"/>
			 오늘날짜:	${today}<br/>
			 <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/><br/>
			 <fmt:formatDate value="${today}" pattern="hh:mm:ss"/><br/>
			 <fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss"/><br/>
			 <fmt:formatDate value="${today}" pattern="yyy년 MM월 dd일  hh시 mm분 ss초"/><br/>
			 
 		3. 국가별 설정(로케일)<br/>
 			 톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br/>
 			 톰캣 서버의 기본 로케일 변경(미국식) <fmt:setLocale value="en_US"/>
 			 														<fmt:formatNumber value="${won2}" type="currency"/>
		<br/>
		
		4. URL이동 : location.href=''; <br/>
		4-1. jstl3.jsp로 이동 : <%-- <c:redirect url="jstl3.jsp"/> --%> <br/>			 																
				 c:redirect 태그는 response.sendRedirect()와 같이 url 지정해 특정 페이지로 리다이렉트를 시켜주는 기능을 합니다.
				 위 태그가 실행되면 /example/jsp/view.jsp 페이지로 리다이렉트 됩니다.
				 c:param 태그를 이용해 해당 url에 파라미터를 전송할 수 있습니다.<br/>	
				 	
		5. 절대 경로: <br/>
			<img src="<%=request.getContextPath() %>/images/1.jpg" width="150px" /><br/>
			<img src="${ctp}/images/1.jpg" width="150px" /><br/>
			
		6. import
			<c:import url="/include/bs4.jsp"/>  <!-- 상단 줄을 안 적어줘도 된당! -->
	</div>
</div>	
<P><br /></P>
</body>
</html>