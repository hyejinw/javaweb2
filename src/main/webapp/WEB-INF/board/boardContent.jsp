<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardContent.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  	th {
  		text-align: center;
  		background-color: #eee;
  	}
  </style>
  <script>
  	'use strict';
  	
  	// 좋아요 누르기
  	function goodCheck() {
  		location.href = "${ctp}/BoardGoodCheck.bo?idx=${vo.idx}";
  	}
  	
  	// 게시글 삭제
  	function boardDelete() {
  		let ans = confirm("현 게시글 삭제하시겠습니까?");
  		if(ans) {
  			location.href="${ctp}/BoardDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&nickName=${vo.nickName}";
  		}
  	}
  	
  	// 댓글 달기(ajax로 처리)
  	function replyCheck() {
  		let content = $("#content").val();
  		if(content.trim() == ""){
  			alert("댓글을 입력하세요");
  			$("#content").focus();
  			return false;
  		}
  		
  		/* 자바스크립트에서 객체를 만드는 방법이다. */
  		let query = {   
  				boardIdx : ${vo.idx},
  				mid : '${sMid}',
  				nickName : '${sNickName}',
  				content : content,
  				hostIp : '${pageContext.request.remoteAddr}'
			/*  hostIp : '<%=request.getRemoteAddr() %>' 와 같은 표현이다.*/
  		}
  		
  		$.ajax({
  			type : 'post',
  			url : '${ctp}/BoardReplyInput.bo',
  			data : query,
  			success : function(res) {
  				if(res == '1') {
  					alert('댓글이 입력되었습니다.');
  					location.reload();
  				}
  				else {
  					alert('댓글이 입력되지 않았습니다.');
  				}
  			},
  			error : function() {
					alert("전송되지 못했습니다.");  				
  			}
  		});
  	}
  	
  	// 댓글 삭제(ajax이용)
  	function replyDelete(replyIdx) {
  		let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
  		if(!ans) return false;
  		
 			$.ajax({
 				type : 'post',
 				url : '${ctp}/BoardReplyDelete.bo',
 				data : {replyIdx : replyIdx},
 				success : function(res) {
 					if(res == '1') {
  					alert('댓글이 삭제되었습니다.');
  					location.reload();
 					}
 					else {
  					alert('댓글이 삭제되지 않았습니다.');
  					location.reload();
 					}
 				},
 				error : function() {
 					alert('전송되지 못했습니다.');
 				}
 			});
  	}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">글 내 용</h2>
  <br/>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td class="text-left">공개 여부 : ${vo.openSw}</td>
      <td class="text-right">접속IP : ${vo.hostIp}</td>
    </tr>
  </table>  
  <table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName}</td>
      <th>작성 날짜</th>
      <td>${fn:substring(vo.wDate,0,fn:length(vo.wDate))}</td>
    </tr>
    <tr>
      <th>제목</th>
      <td colspan="3">${vo.title}</td>
    </tr>
    <tr>
      <th>이메일</th>
      <td>${vo.email}</td>
      <th>조회수</th>
      <td>${vo.readNum}</td>
    </tr>
    <tr>
      <th>홈페이지</th>
      <td>${vo.homePage}</td>
      <th>좋아요</th>
      <td>
      	${vo.good} (<a href="javascript:goodCheck()">❤</a>)
     	</td>
    </tr>
    <tr>
      <th>내용</th>
      <td colspan="3" style="height:250px">${fn:replace(vo.content, newLine,"<br/>")}</td>
    </tr>
    <tr>
      <td colspan="4" class="text-center">
      	<c:if test="${flag == 'search'}">
  	      <input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardSearch.bo?search=${search}&searchString=${searchString}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/>
      	</c:if>
      	<c:if test="${flag != 'search'}">
  	      <input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary mr-3"/>
  	      <c:if test="${sMid == vo.mid || sLevel == 0}">  <!-- 아이디가 로그인한 사용자와 같거나 관리자는, 수정/삭제 가능! -->
	  	      <input type="button" value="수정" onclick="location.href='${ctp}/BoardUpdate.bo?pag=${pag}&pageSize=${pageSize}&idx=${vo.idx}';" class="btn btn-success mr-3"/>
	  	      <input type="button" value="삭제" onclick="boardDelete()" class="btn btn-danger"/>
      		</c:if>
      	</c:if>
      </td>
    </tr>
  </table>
  <c:if test="${flag != 'search'}">
	  <!-- 이전글/ 다음글 처리 -->
	  <table class="table table-borderless">
	  	<tr>
	  		<td>
	  			<c:if test="${nextVo.nextIdx != 0}">
	  				<a href="${ctp}/BoardContent.bo?idx=${nextVo.nextIdx}&pageSize=${pageSize}&pag=${pag}" >다음글 : 다음글 제목 ${nextVo.nextTitle}</a><br/>
	  			</c:if>
	  			<c:if test="${preVo.preIdx != 0}">
	  				<a href="${ctp}/BoardContent.bo?idx=${preVo.preIdx}&pageSize=${pageSize}&pag=${pag}" >이전글 : 이전글 제목 ${preVo.preTitle}</a>
	  			</c:if>
	  		</td>
	  	</tr>
	  </table>
  </c:if>

  <!-- 댓글 리스트 보여주기 -->
  <div class="container">
  	<table class="table table-hover text-left">
  		<tr>
  			<th>&nbsp;작성자</th>
  			<th>댓글</th>
  			<th>작성일자</th>
  			<th>접속 IP</th>
  		</tr>
  		<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
  			<tr>
  				<td>
  					<c:if test="${sMid == replyVo.mid || sLevel == 0}">
  						<a href="javascript:replyDelete(${replyVo.idx})"><span class="badge badge-pill badge-danger">❌</span></a>
  					</c:if>&nbsp;
  					${replyVo.nickName}
  				</td>
  				<td>${fn: replace(replyVo.content, newLine, "<br/>")}</td>
  				<%-- <td class="text-center">${fn: replace(replyVo.wDate,0,fn:length(replyVo.wDate))}</td> --%>
  				<td class="text-center">${fn: substring (replyVo.wDate,0,10)}</td>
  				<td class="text-center">${replyVo.hostIp}</td>
  			</tr>
  		</c:forEach>
  	</table>
  </div>
  
  <!-- 댓글 입력창 -->
  <form name="replyForm">
  	<table class="table table-center">
  		<tr>
  			<td style="width:85%" class="text-left">   <!-- 이렇게 비율로 설정해주면 반응형으로 바뀐다.+ -->
  				댓글 : 
  				<textarea rows="4" name="content" id="content" class="form-control"></textarea>
  			</td>
  			<td style="width:15%" class="text-center">
  				<br/>
  				<p>작성자: ${sNickName}</p>
  				<p><input type="button" value="댓글 달기" onclick="replyCheck()" class="btn btn-info btn-sm"/></p>
  			</td>
  		</tr>
  	</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>