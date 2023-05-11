<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
  <style>
    .viewCheck {
      color: orange;
    }
    #memberInfo1, #memberInfo2 {
      float: left;
    }
    #memberInfo3, #memberInfo4 {
      clear: both;
    }
  </style> 
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2>회 원 전 용 방</h2>
	<hr/>
  <div id="memberInfo1" class="mr-5">
    <p>현재 <font color="blue">${sNickName}</font>(${strLevel})님 로그인 중이십니다.</p>
    
   	<!-- 등업 확인 메시지 -->
		<c:if test="${sLevel == 2 && visitCnt < 20}">
			<div class="mb-3 p-4 border">🔅축하합니다. 💖정회원💖이 되셨습니다.<br/><a href="${ctp}/BoardList.bo" class="btn btn-warning btn-sm">게시판</a>에 글을 남겨보세요🔅</div>
		</c:if>
    
    <p>누적 포인트 : <span class="viewCheck">${point}</span></p>
    <p>최종 방문일자 : <span class="viewCheck">${fn:substring(sLastDate,0,fn:length(sLastDate)-2)}</span></p>
    <p>총 방문횟수 : <span class="viewCheck">${visitCnt}</span></p>
    <p>오늘 방문횟수 : <span class="viewCheck">${todayCnt}</span></p>
  </div>
  <div id="memberInfo2">
    <p>회원사진<br/><img src="${ctp}/images/member/${photo}" width="200px"/></p>
  </div>
  <hr id="memberInfo4" />
  <div id="memberInfo3">
	  <h4>활동내역</h4>
	  <div style="margin: 15px 0px">
	  	<!-- 아이디가 같거나, 닉네임이 같으면 해당 사람이 쓴 글이다. 성명은 중복이 가능하기 때문에 사용하지 않았다.-->
	  	<a href="${ctp}/MemberGuestList.mem" class="btn btn-success btn-sm">작성글 보기</a>&nbsp;&nbsp;&nbsp;
	  	방명록 작성 글 수 : 
	  	<span class="viewCheck">${guestCnt}</span>
	  </div>
	  <div style="margin: 15px 0px">
	 	  <a href="${ctp}/BoardSearchMember.bo" class="btn btn-success btn-sm">작성글 보기</a>&nbsp;&nbsp;&nbsp;
	  	게시판 작성 글 수 : <span class="viewCheck">${boardCnt}</span>
	  </div>
	  <div style="margin: 15px 0px">
	  	<a href="#" class="btn btn-success btn-sm">작성글 보기</a>&nbsp;&nbsp;&nbsp;
	  	자료실 작성 글 수 : <span class="viewCheck">${pdsCnt}</span>
	  </div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>