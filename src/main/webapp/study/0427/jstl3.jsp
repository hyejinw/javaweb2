<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl3.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
</head>
<body>
<P><br /></P>
<div class="container">	
	<h2>Function Library</h2>
	<pre>
		사용법 : $ { fn : 함수명(변수/값 ...) }
		관계연산자 : ==(eq), !=(ne), <(lt), >(gt) // >=(ge), <=(le)
	</pre>
	
<%
							 //01234567890123456789012			
	String atom = "Welcome to My Homepage!";
	pageContext.setAttribute("atom", atom);
	pageContext.setAttribute("atom2", atom);

	String[] hobbies = {"등산","낚시","수영","바둑","싸이클","독서"};
	pageContext.setAttribute("hobbies", hobbies);
%>

	<p>
		atom 변수의 값? ${atom}<br/>
		1. atom 변수 값의 길이 :<%=atom.length() %> /  ${fn:length(atom)} <br/>
		1-1. hobbies 변수 값의 길이 :<%=hobbies.length %> /  ${fn:length(hobbies)} <br/>
		2. 대문자 변화(toUpperCase()) :<%=atom.toUpperCase() %> / ${fn:toUpperCase(atom )} <br/>
		3. 소문자 변화(toLowerCase()) :<%=atom.toLowerCase() %> / ${fn:toLowerCase(atom )} <br/>
		4-1. 문자열 추출(substring()) : <%=atom.substring(0,3) %> / ${fn: substring(atom,0,3) } <br/>
		4-2. 문자열 추출(substring()) : <%=atom.substring(2,5) %> / ${fn: substring(atom,2,5) } <br/>
		4-3. 문자열 추출(substring()) : <%=atom.substring(2) %> <%--" lcome to My Homepage!" ${fn: substring(atom,2) } 이렇게는 못 쓴다.--%> 
																/ ${fn:substring(atom,2,fn:length(atom)) }
																/ ${fn:substring(atom,2,-1) }<br/>
		5-1. 특정 문자열의 위치값 검색(indexOf()) : <%=atom.indexOf("o") %>	 / ${fn:indexOf(atom, 'o')} <br/>  <!-- 자바에선 ''를 char로 인식하지만 웹에선 가능하다. -->
		5-2. 특정 문자열의 위치값 검색(indexOf()) : <%=atom.lastIndexOf("o") %>	 / <%-- ${fn:lastIndexOf(atom, 'o')} --%> <br/>
			atom 변수에 기억된 'o'문자의 위치를 모두 출력<br/>
			<c:set var="cnt" value="0"/>
			<c:forEach var="i" begin="0" end="${fn:length(atom)-1}" varStatus="st">
				<%-- <c:if test="${fn:indexOf(atom,i,i+1) eq 'o'}"> --%>
				<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
					 <c:set var="cnt" value="${cnt+1}"/>
					 ${cnt}번째 위치==> ${i}    /
				</c:if>
			</c:forEach>
			<br/>
			atom 변수 값의 'o' 문자 개수는? <font color="red">${cnt}</font>
		<br/><hr/>
		6. 문자열 추출(substringBefore() / substringAfter())<br/>
			 문자 'o' 앞의 문자열 출력substringBefore() : ${fn:substringBefore(atom,'o')}<br/> 	
			 문자 'o' 뒤의 문자열 출력substringAfter() : ${fn:substringAfter(atom,'o')}<br/> 
	
	  7. 문자열 분리(split(변수, 분리할 문자)) : 문자 분리 후에는 분리된 문자들을 '변수'에 담아줘야 한다.<br/>
	  	 예) atom 변수의 문자 중 'o' 문자를 기준으로 분리<br/>
	  	 <c:set var="atoms" value="${fn:split(atom,'o')}"/>
	  	 <c:forEach var="atom" items="${atoms}" varStatus="st">
	  	 		${st.count}. ${atom}<br/>
	  	 </c:forEach>
	  	 atom 안에 입력된 'o' 문자의 개수는? ${fn:length(atoms)-1}	<br/>
	
		8-1. 문자열 치환(replace()) : 출력하려면 '변수'에 담아줘야 한다.<br/>
				 예) atom변수의 'My'를 'Your'로 변경
				 <%=atom.replace("My", "Your") %> / ${fn:replace(atom2, 'My', 'Your')}<br/>
				 
		8-2. 문자열 치환(replace())<br/>
				 예) atom변수의 'o'를 'O'로 변경
				 <%=atom.replace("o", "O") %> / ${fn:replace(atom2, 'o', 'O')}<br/>
				 
		9. 특정 문자(열) 포함 유무? contains()<br/>
			 예) atom2변수에 'o'를 포함하고 있느냐? ${fn:contains(atom2,'o')}<br/>
			 예) atom2변수에 'My'를 포함하고 있느냐? ${fn:contains(atom2,'My')}<br/>
			 예) atom2변수에 'Your'를 포함하고 있느냐? ${fn:contains(atom2,'Your')}<br/>
			 
			 
	</p>
</div>	
<P><br /></P>
</body>
</html>


<!-- 소불고기 / 반반(베이컨 포테이토 / 치즈 ) / 오픈 스파케티  -->
