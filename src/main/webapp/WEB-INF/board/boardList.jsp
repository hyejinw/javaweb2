<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardList.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
  <script>
    'use strict';
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/BoardList.bo?pag=${pag}&pageSize="+pageSize;
    }
  </script> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2 class="text-center">게 시 판 리 스 트</h2>
	<table class="table table-borderless">
		<tr>
			<td colspan="2" class="text-right">
        <select name="pageSize" id="pageSize" onchange="pageCheck()">
          <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
        </select> 건
			</td>
		</tr>
		<tr>
			<td>
				<a href="${ctp}/BoardInput.bo" class="btn btn-primary btn-sm">글쓰기</a>
			</td>
			<td class="text-right">
        <!-- 첫페이지 / 이전페이지 / (현재페이지번호/총페이지수) / 다음페이지 / 마지막페이지 -->
        <c:if test="${pag > 1}">
          <a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1" title="첫페이지로">◁◁</a>
          <a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${pag-1}" title="이전페이지로">◀</a>
        </c:if>
        ${pag} | ${totPage}
        <c:if test="${pag < totPage}">
          <a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${pag+1}" title="다음페이지로">▶</a>
          <a href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}" title="마지막페이지로">▷▷</a>
        </c:if>
			</td>
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
				<td>${curScrStartNo}</td>
				<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
				<td>${vo.title}</td>
				<td>${vo.nickName}</td>
				<td>${vo.wDate}</td>
				<td>${vo.readNum}</td>
				<td>${vo.good}</td>
			</tr>	
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
	<br/>
	<!-- 블록 페이징 -->
	<!-- 4페이지(1블록)에서 0블록으로 가게되면 현재페이지는 1페이지가 블록의 시작페이지가 된다. -->
  <!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3 / 다음블록 / 마지막페이지 -->
  <div class="text-center">
  	<ul class="pagination justify-content-center">
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1">◁◁</a></li></c:if>
	    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}">▷▷</a></li></c:if>
 		</ul>
  </div>	
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>