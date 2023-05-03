<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 스크립틀릿 대신에 jstl을 사용 -->
<!-- 앞에서 전송된 값들을 vo객체에 담는다 -->
<!-- jsp에서 객체를 사용하기 위해선 해당 객체를 jsp액션태그(useBean)을 사용한 후 생성해야 한다. -->
<!-- Atom atom = new Atom(); 에서 atom은 id다 Atom()이 class다.  -->
<jsp:useBean id="vo" class="study.t0424.Test1VO" />

<!-- servlet에서는 getter()와 setter()를 이용해서 값을 불러오거나 저장시켜 준다. -->
<!-- jsp에서는 getProperty와 setProperty를 이용해서 값을 불러오거나 저장시켜 준다. -->
<%--
<jsp:setProperty property="name" name="vo"/>
<jsp:setProperty property="age" name="vo"/>
   <jsp:setProperty property="age" name="vo" value="25" />  이렇게 되면 값이 무조건 25으로 들어간다
<jsp:setProperty property="gender" name="vo"/>
<jsp:setProperty property="job" name="vo"/>
<jsp:setProperty property="address" name="vo"/>
 --%>
<jsp:setProperty property="*" name="vo"/>       <!-- 이렇게 한 번에 적어줄 수도 있다. 시간 절약! -->
 

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2Ok5.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>처리된 자료를 view에 출력시켜본다.</h3>
  <div>
    <table class="table table-bordered">
      <tr>
        <th>성명</th>
        <td>${name} / <jsp:getProperty property="name" name="vo" /></td>	
        <%-- <%=vo.getName()%> --%>
      </tr>
      <tr>
        <th>나이</th>
        <%-- <td><c:out value="${age}" /></td> --%>
        <td>${age + 1} / <jsp:getProperty property="age" name="vo" /></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${gender} / <jsp:getProperty property="gender" name="vo" /></td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${job} / <jsp:getProperty property="job" name="vo" /></td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${address} / <jsp:getProperty property="address" name="vo" /></td>
      </tr>
    </table>
    <p>
      <a href="test2.jsp" class="btn btn-warning">돌아가기</a>
    </p>
  </div>
</div>
<p><br/></p>
</body>
</html>