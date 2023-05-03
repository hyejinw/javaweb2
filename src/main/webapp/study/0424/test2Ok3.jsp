<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 스크립틀릿 대신에 jstl을 사용 -->
<!-- 앞에서 전송된 값들을 변수에 담는다 -->
<c:set var="name" value="${param.name}" />
<c:set var="age" value="${param.age}" />
<c:set var="gender" value="${param.gender}" />
<c:set var="job" value="${param.job}" />
<c:set var="address" value="${param.address}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2Ok3.jsp</title>
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
        <td>${name}</td>	
      </tr>
      <tr>
        <th>나이</th>
        <%-- <td><c:out value="${age}" /></td>  : jstl을 사용해서 쓸 수도 있지만 el표기법으로 쓰는 게 더 편하다.--%>
        <td>${age + 1}</td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${gender}</td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${job}</td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${address}</td>
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