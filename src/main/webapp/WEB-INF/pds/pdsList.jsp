<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>pdsList.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<script>
		'use strict';
		
		// part 선택 시 해당 part만 불러오기
		function partCheck() {
			let part = partForm.part.value;
			location.href = "${ctp}/PdsList.pds?part="+part;
		}
	
		// 다운로드 횟수 증가(ajax처리)
		function downNumCheck(idx) {
			$.ajax({
				type : "post",
				url : "${ctp}/PdsDownNumCheck.pds",
				data : {idx : idx},
				success : function() {
					location.reload();
				},
				error : function() {
					alert("전송 오류!");
				}
			});
		}
		
		// 자료실 파일 삭제(ajax처리)
		function pdsDeleteCheck(idx, fSName) {
			let ans = confirm('선택한 자료파일을 삭제하시겠습니까?');
			if(!ans) return false;
			
			let pwd = prompt('비밀번호를 입력하세요?');  /* 모달창으로 바꾸기^^ */
			
			let query = {
					idx : idx,
					fSName : fSName,
					pwd : pwd
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/PdsDeleteCheck.pds",
				data : query,
				success : function(res) {
					alert('삭제 처리되었습니다!');
					location.reload();
				},
				error : function() {
					alert('전송 실패!');
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2 class="text-center">자 료 실 리 스 트(${part})</h2>
	<br/>
	<table class="table table-borderless text-center">
		<tr>
			<td style="width:20%" class="text-left">
				<form name="partForm">
					<select name="part" onchange="partCheck()" class="form-control">
						<option ${part=="전체" ? "selected" : ""}>전체</option>
						<option ${part=="학습" ? "selected" : ""}>학습</option>
						<option ${part=="여행" ? "selected" : ""}>여행</option>
						<option ${part=="음식" ? "selected" : ""}>음식</option>
						<option ${part=="기타" ? "selected" : ""}>기타</option>
					</select>
				</form>
			</td>
			<td class="text-right">
				<a href="${ctp}/PdsInput.pds?part=${part}" class="btn btn-success">자료 올리기</a>
			</td>
		</tr>
	</table>
	<table class="table table-border text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>제목</th>
			<th>올린이</th>
			<th>올린 날짜</th>
			<th>분류</th>
			<th>파일명(크기)</th>
			<th>다운로드 수</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.title}</td>  <!-- 24시간 전이면 new 나오게! 누르면 상세보기 새창으로! 모달 창에 -->
				<td>${vo.nickName}</td> 
				<td>${vo.fDate}</td> <!-- 시간 차이에 따라 나오는 값을 다르게 -->
				<td>${vo.part}</td>
				<td>
					<c:set var="fNames" value="${fn:split(vo.fName, '/')}"/>
					<c:set var="fSNames" value="${fn:split(vo.fSName, '/')}"/>
					<c:forEach var="fName" items="${fNames}" varStatus="st">
						<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a><br/>
					</c:forEach>
<%-- 					(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0"/> KByte)  <!--  알아서 쉼표가 붙는다. --> --%>
					(<fmt:formatNumber value="${vo.fSize/1024/1024}" pattern="#,##0.0"/> MByte)  <!--  알아서 쉼표가 붙는다. -->
				</td>
				<td>${vo.downNum}</td>
				<td>
					<a href="${ctp}/PdsTotalDown.pds?idx=${vo.idx}" class="badge badge-info">전체 다운로드</a><br/>
					<a href="javascript:pdsDeleteCheck('${vo.idx}', '${vo.fSName}')" class="badge badge-danger">삭제1</a>
					<a href="javascript:pdsDeleteCheck2('${vo.idx}', '${vo.fSName}')" class="badge badge-warning">삭제2</a>
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan="8" class="m-0 p-0"></td></tr>
	</table> 
</div>	
<!-- 블럭 페이징 처리 -->
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>