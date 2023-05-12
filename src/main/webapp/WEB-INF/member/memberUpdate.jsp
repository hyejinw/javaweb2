<%-- <%@page import="java.time.LocalDate"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- 오늘 날짜: <%=java.time.LocalDate.now() %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberJoin.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctp}/js/woo.js"></script> 
	<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  sweetalert -->
	<script>
		'use strict';
		// 닉네임 중복버튼을 클릭했는지의 여부를 확인하기 위한 변수(버튼 클릭 후엔 내용 수정처리 불가)
		let nickCheckSw = 0;

		// 닉네임 중복 검사  
		function nickCheck() {
			let nickName = myform.nickName.value;
			let url = "${ctp}/MemberNickCheck.mem?nickName="+nickName;
			
			if(nickName.trim() == "") {
				alert("닉네임을 입력하세요");
				myform.nickName.focus();
			}
			else {
				nickCheckSw = 1;
				myform.nickName.readOnly = true;
				window.open(url, "nWin", "width=580px, height=250px");
			}
		}
		
		// 전화번호 길이 제한
		function handleOnInput(el, maxlength) {
		  if(el.value.length > maxlength)  {
		    el.value 
		      = el.value.substr(0, maxlength);
		  }
		}
		
		// 첫 번째 전화번호 내용 입력 후 자동으로 커서 옮기기
		$(document).ready(function() {
	    $(".inputs").keyup(function () {
        if (this.value.length == this.maxLength) {
          $(this).next('.inputs').focus();
        }
	    });
		});	
		
		// 회원 정보 수정 체크
		function fCheck(){
		  let nickName = document.getElementById("nickName").value.trim();
		  let name = document.getElementById("name").value.trim();
		  let email1 = document.getElementById("email1").value.trim();
		  let email2 = document.getElementById("email2");
		  let email = email1 + "@" + email2;
		  let tel1 = myform.tel1.value;
		  let tel2 = myform.tel2.value;
		  let tel3 = myform.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
		  let postcode = myform.postcode.value + " ";
		  let roadAddress = myform.roadAddress.value + " ";
		  let detailAddress = myform.detailAddress.value + " ";
		  let extraAddress = myform.extraAddress.value + " ";
		  
		  let check = true;
		  
			const regex3 = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;  // (닉네임)2자 이상 16자 이하, 영어 또는 숫자 또는 한글
			const regex4 = /^[가-힣a-zA-Z]+$/;  // (성명)한글,영문만 적어도 1자이상   
			const regex5 = /^[0-9a-zA-Z]+/g; // 이메일
		  const regex6 = /\d{2,3}-\d{3,4}-\d{4}$/g; //(전화번호)
		  

		  // 닉네임 확인 
		  if(!regex3.test(nickName)){
		    document.getElementById("nickNameError").innerHTML="닉네임 형식에 맞춰주세요.(영어/숫자/한글 2~16자)";
		    check = false;
		   }
		  else {
			  document.getElementById("nickNameError").innerHTML="";
			  check = true;
		   }
		  
		  // 성명 확인
		  if(!regex4.test(name)){
			  console.log('성명 여기로 왔어요',name);
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 1자이상)";
		    check = false;
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
			  check = true;
		  }
		   
		  // 이메일확인
		  if(!regex5.test(email1)){
		    document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다.";
		    check = false;
		  }
		  else {
			  document.getElementById("emailError").innerHTML="";
			  check = true;
		  } 
		     
		     
		   // 전화 번호 저장
			if(tel2 != "" && tel3 != "") {
			  if(!regex6.test(tel)) {
				  document.getElementById("telError").innerHTML="전화번호 형식을 확인해주세요.";
				  check = false;
			  }
			  else {
				  document.getElementById("telError").innerHTML="";
				  check = true;
			  }
			}
			else {		// 전화번호를 입력하지 않을시 DB에는 '010- - '의 형태로 저장하고자 한다.
				tel2 = " ";
				tel3 = " ";
				tel = tel1 + "-" + tel2 + "-" + tel3;
				check = true;
			}
		    
		  if(!check){
			  alert('입력된 값을 다시 확인해주세요.');
			  window.scrollTo(0,250); // (그냥 위치만 바뀌는)스크롤 위로 올리기 
			  check = true;
		  }
		  else {
			  if(nickName == '${sNickName}') {
				  console.log('nickName : ', nickName);
				  nickCheckSw = 1;
			  }
		    if(nickCheckSw == 0) {
					alert("닉네임 중복확인을 해주세요.");
					document.getElementById("nickNameBtn").focus();
				}
				else {
			    myform.tel.value = tel;
			    myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
			    myform.email.value = email;
			   	myform.submit();
				}
		  }
		}
	</script>
	<style>
		/* 현재 창 스크롤 부드럽게 */
		html {
			scroll-behavior:smooth;
		}
		.text-primary {
			font-size: 0.9em;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container" id="top">	
	<form name="myform" method="post" action="${ctp}/MemberUpdateOk.mem" class="was-validated">
    <h2>회 원 정 보 수 정</h2>
    <br/>
    <div class="form-group">
      아이디 : ${sMid}
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" value="닉네임 중복체크" id="nickNameBtn" class="btn btn-secondary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" id="nickName" name="nickName" value="${sNickName}" required class="form-control" />
    	<div id="nickNameError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" id="name" name="name" value="${vo.name}" required class="form-control" />
    	<div id="nameError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <label for="email1" >Email address:</label>
        <div class="input-group mb-3">
          <input type="text" name="email1" id="email1" value="${email1}" required class="form-control" />
          <div class="input-group-append">
            <select name="email2" id="email2" class="custom-select">
              <option value="naver.com" <c:if test="${email2=='naver.com'}">selected</c:if>>naver.com</option>
              <option value="hanmail.net" <c:if test="${email2=='hanmail.net'}">selected</c:if>>hanmail.net</option>
              <option value="hotmail.com" <c:if test="${email2=='hotmail.com'}">selected</c:if>>hotmail.com</option>
              <option value="gmail.com" <c:if test="${email2=='gmail.com'}">selected</c:if>>gmail.com</option>
              <option value="nate.com" <c:if test="${email2=='nate.com'}">selected</c:if>>nate.com</option>
              <option value="yahoo.com" <c:if test="${email2=='yahoo.com'}">selected</c:if>>yahoo.com</option>
            </select>
          </div>
        </div>
	    	<div id="emailError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 </span> &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="남자" <c:if test="${vo.gender=='남자'}">checked</c:if>>남자
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="여자" <c:if test="${vo.gender=='여자'}">checked</c:if>>여자
        </label>
      </div>
    </div>
    <div class="form-group">
   	  <!-- 생일을 null로 보내면 자꾸 오류가 생겨서 기본값을 줘버렸다. -->
      <label for="birthday">생일</label>
      <input type="date" name="birthday" value="${birthday}" class="form-control"/>
<%--     	<c:set var="ymd" value="<%=new java.util.Date()%>" />
      <label for="birthday">생일</label>
      <input type="date" name="birthday" value=<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /> class="form-control"/> --%>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">전화번호 </span> &nbsp;&nbsp;
            <select name="tel1" class="custom-select">
              <option value="010" ${tel1=="010" ? "selected" : ""}>010</option>
              <option value="02" ${tel1=="02" ? "selected" : ""}>서울</option>
              <option value="031" ${tel1=="031" ? "selected" : ""}>경기</option>
              <option value="032" ${tel1=="032" ? "selected" : ""}>인천</option>
              <option value="041" ${tel1=="041" ? "selected" : ""}>충남</option>
              <option value="042" ${tel1=="042" ? "selected" : ""}>대전</option>
              <option value="043" ${tel1=="043" ? "selected" : ""}>충북</option>
              <option value="051" ${tel1=="051" ? "selected" : ""}>부산</option>
              <option value="052" ${tel1=="052" ? "selected" : ""}>울산</option>
              <option value="061" ${tel1=="061" ? "selected" : ""}>전북</option>
              <option value="062" ${tel1=="062" ? "selected" : ""}>광주</option>
            </select>-
        </div>
        <input type="number" name="tel2" value="${tel2}" size=4 maxlength=4 oninput='handleOnInput(this, 4)' class="form-control inputs"/>-
        <input type="number" name="tel3" value="${tel3}" size=4 maxlength=4 oninput='handleOnInput(this, 4)' class="form-control inputs"/>
<!--         <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
        <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/> -->
      </div>
    </div>
    <div class="form-group">
      <label for="address">주소</label>
      <!-- <input type="hidden" name="address" id="address"> -->
      <div class="input-group mb-1">
        <input type="text" name="postcode" id="sample6_postcode" value="${postcode}" placeholder="우편번호" class="form-control">
        <div class="input-group-append">
          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
        </div>
      </div>
      <input type="text" name="roadAddress" id="sample6_address" value="${roadAddress}" size="50" placeholder="주소" class="form-control mb-1">
      <div class="input-group mb-1">
        <input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
        <div class="input-group-append">
          <input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" placeholder="참고항목" class="form-control">
        </div>
      </div>
    </div>
    <div class="form-group">
      <label for="homepage">Homepage address:</label>
      <input type="text" class="form-control" name="homePage" value="${vo.homePage}" placeholder="홈페이지를 입력하세요." id="homePage"/>
    </div>
    <div class="form-group">
      <label for="name">직업</label>
      <select class="form-control" id="job" name="job">
        <option ${vo.job=="학생" ? "selected" : ""}>학생</option>
        <option ${vo.job=="회사원" ? "selected" : ""}>회사원</option>
        <option ${vo.job=="공무원" ? "selected" : ""}>공무원</option>
        <option ${vo.job=="군인" ? "selected" : ""}>군인</option>
        <option ${vo.job=="의사" ? "selected" : ""}>의사</option>
        <option ${vo.job=="법조인" ? "selected" : ""}>법조인</option>
        <option ${vo.job=="세무인" ? "selected" : ""}>세무인</option>
        <option ${vo.job=="자영업" ? "selected" : ""}>자영업</option>
        <option ${vo.job=="기타" ? "selected" : ""}>기타</option>
      </select>
    </div>
    <div class="form-group">
    	<!-- 
      <div class="form-check-inline">
        <span class="input-group-text">취미</span> &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="등산" name="hobby"/>등산
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="낚시" name="hobby"/>낚시
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="수영" name="hobby"/>수영
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="독서" name="hobby"/>독서
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="영화감상" name="hobby"/>영화감상
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="바둑" name="hobby"/>바둑
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="축구" name="hobby"/>축구
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="기타" name="hobby" checked/>기타
        </label>
      </div>
       -->
       취미 :
       <c:set var="varHobbies" value="${fn:split('등산/낚시/수영/독서/영화감상/바둑/축구/기타','/')}" />
       <c:forEach var="tempHobby" items="${varHobbies}" varStatus="st">
       	<input type="checkbox" name="hobby" value="${tempHobby}" <c:if test="${fn:contains(hobby,varHobbies[st.index])}">checked</c:if> />${tempHobby} &nbsp;
       </c:forEach>
    </div>
    <div class="form-group">
      <label for="content">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content" >${vo.content}</textarea>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="공개" ${vo.userInfor=="공개" ? "checked" : ""}/>공개
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="비공개" ${vo.userInfor=="비공개" ? "checked" : ""}/>비공개
        </label>
      </div>
    </div>
    <div  class="form-group">
      회원 사진(파일용량:2MByte이내) :
      <img src = "${ctp}/images/member/${vo.photo}" width="100px"/>
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    </div>
    <!-- form태그 안의  required 기능은 input이 submit일 때만 사용가능하다. -->
<!-- <button type="submit" class="btn btn-secondary" >회원가입</button> &nbsp; -->
    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원가입 정보 수정</button> &nbsp;
    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    <button type="button" class="btn btn-secondary" onclick="">돌아가기</button>
    
    <input type="hidden" name="tel"/>
    <input type="hidden" name="address"/>
    <input type="hidden" name="email"/>
  </form>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>