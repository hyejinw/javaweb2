<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
   int cnt = 0;
   String atom = "Welcome to My Homepage!";
   pageContext.setAttribute("atom", atom);
   pageContext.setAttribute("cnt", cnt);
   pageContext.setAttribute("cnt2", cnt);
   pageContext.setAttribute("cnt3", cnt);
   
   String search = request.getParameter("search")==null ? "":request.getParameter("search");
   pageContext.setAttribute("search", search);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>title</title>
   <jsp:include page="/include/bs4.jsp" />
</head>
<body>
   <p><br/></p>
   <div class="container">
   <pre>
   0         1         2   
   012345678901234567890123
   Welcome to My Homepage!
   </pre>
   <p> 찾고자 하는 단어를 입력하세요
   <form name="myform" method="post" action="">
      <input type="text" name="search" id="search"/>
      <input type="submit" value="찾기"/>
   </p>
   </form>
   <div>입력하신 단어는 ... ${search}</div>
 
   
   완벽 일치(대소문자 구분) :
      <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
         <c:if test="${fn:substring(atom,i,i+1) == search}">
            <c:set var="cnt" value="${cnt + 1}"/>
             ${i}번째 /
            <c:if test="${cnt+0 == 3}">
                <c:set var="save_three" value="${i}"/>
            </c:if>
         </c:if>
      </c:forEach>
      <c:if test="${cnt==0}">검색문자 없음</c:if>
  <br/>
  <br/>
  알파벳 일치(대소문자 구분x) : 
       <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
         <c:if test="${fn:substring(fn:toLowerCase(atom),i,i+1) == fn:toLowerCase(search)}">
            <c:set var="cnt2" value="${cnt2 + 1}"/>
             ${i}번째 /
            <c:if test="${cnt2+0 == 3}">
                <c:set var="save_three" value="${i}"/>
            </c:if>
         </c:if>
      </c:forEach>
      <c:if test="${cnt2==0}">검색문자 없음</c:if>
  <br/><br/>
  
  3번째 문자까지 검색하면 더이상 수행 X : 
   <c:forEach var="i" begin="0" end="${fn:length(atom)-1}"> <!-- 길이만큼 반복 -->
  <c:if test="${cnt3+0 < 3}"> <!-- cnt<3이되면 멈춤  -->
         <c:if test="${fn:substring(fn:toLowerCase(atom),i,i+1) == fn:toLowerCase(search)}"><!-- 같은 문자가 있다면 -->
            <c:set var="cnt3" value="${cnt3 + 1}"/><!-- 찾았다고 +1 체크  -->
             ${i}번째 /
         </c:if>
  </c:if>
      </c:forEach>
      <c:if test="${cnt3==0}">검색문자 없음</c:if>
  <br/>
          
          
          
   </div>
   <p><br/></p>
</body>
</html>
