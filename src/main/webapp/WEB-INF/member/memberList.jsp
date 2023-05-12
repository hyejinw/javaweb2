<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberList.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<script>
		'use strict';
		
		if(${pag} > ${totPage}) location.href="";
	
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/MemberList.mem?pag=${pag}&pageSize="+pageSize;
    }
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2 class="text-center">전체 회원 리스트</h2>
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
			<td class="text-right">
        <!-- 첫페이지 / 이전페이지 / (현재페이지번호/총페이지수) / 다음페이지 / 마지막페이지 -->
        <c:if test="${pag > 1}">
          <a href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=1" title="첫페이지로" class="here">◁◁</a>
          <a href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=${pag-1}" title="이전페이지로" class="here">◀</a>
        </c:if>
        ${pag} | ${totPage}
        <c:if test="${pag < totPage}">
          <a href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=${pag+1}" title="다음페이지로" class="here">▶</a>
          <a href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=${totPage}" title="마지막페이지로" class="here">▷▷</a>
        </c:if>
			</td>
		</tr>
	</table>
	<table class="table table-hover text-center">
		<tr class="table-dark test-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>별명</th>
			<th>성명</th>
			<th>성별</th>
		</tr>	
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${curScrStartNo}</td>
				<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
<%-- 				<td>${vo.idx}</td> --%>
				<td>${vo.mid}</td>
				<td>${vo.nickName}</td>
				<td>
					<c:if test="${vo.userInfor == '공개'}">${vo.name}</c:if>
					<c:if test="${vo.userInfor != '공개'}"><font color="blue"><b>비공개</b></font></c:if>
				</td>
				<td>${vo.gender}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="5" class="m-0 p-0"></td></tr>
	</table>
	
	<br/>
	<!-- 블록 페이징 -->
	<!-- 4페이지(1블록)에서 0블록으로 가게되면 현재페이지는 1페이지가 블록의 시작페이지가 된다. -->
  <!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3 / 다음블록 / 마지막페이지 -->
  <div class="text-center">
  	<ul class="pagination justify-content-center pagination-sm">
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=1">◁◁</a></li></c:if>
	    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">◀</a></li></c:if>
	    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">▶</a></li></c:if>
	    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pageSize=${pageSize}&pag=${totPage}">▷▷</a></li></c:if>
 		</ul>
  </div>
  <br/>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>