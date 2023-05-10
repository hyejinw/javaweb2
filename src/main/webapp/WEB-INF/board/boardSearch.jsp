<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardSearch.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
	 	.here:hover {
	 		text-decoration:none;
	 	}
	</style>
  <script>
    'use strict';
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/BoardList.bo?pag=${pag}&pageSize="+pageSize;
    }
    
    function searchCheck() {
    	let searchString = $("#searchString").val();
    	if(searchString.trim() == "") {
    		alert("검색어를 입력해주세요.");
    		searchForm.searchString.focus();
    	}
    	else {
    		searchForm.submit();
    	}
    }
  </script> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2 class="text-center">게 시 판 검 색 결 과</h2>
	<div class="text-center">
		<font color="blue">${searchTitle}</font>(으)로 <font color="red">${searchString}</font>(을)를 검색한 결과 <font color="orange"><b>${searchCount}</b></font>건이 검색되었습니다.	
	</div>
	<br/>
	<table class="table table-borderless m-0 p-0">
		<tr>
			<td><a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${pag}" class="btn btn-info btn-sm">돌아가기</a></td>
		</tr>
	</table>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>글 번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성 날짜</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<%-- <td>${vo.idx}</td> --%>
				<td>${searchCount}</td>
				<td>
					<a href="${ctp}/BoardContent.bo?flag=search&search=${search}&searchString=${searchString}&idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}">${vo.title}</a>
					<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
<%-- 					<c:if test="${vo.hour_diff <= 24}"><span class="badge badge-warning">New</span></c:if> --%>
				</td>
				<td>${vo.nickName}</td>
				<td>
					<!-- 1일(24시간)이내는 시간만 표시, 이후는 날짜와 시간 표시 : 2023-05-04 10:35:21 -->
					<!-- 단, 날짜가 오늘 날짜만 시간으로 표시하고 어제 날짜는 날짜로 표시 -->
					<c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
					<c:if test="${vo.hour_diff <= 24}">
						${vo.day_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,16)}
					</c:if>
				</td>
				<td>${vo.readNum}</td>
				<td>${vo.good}</td>
			</tr>	
			<c:set var="searchCount" value="${searchCount - 1}"/>
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
	<br/>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>