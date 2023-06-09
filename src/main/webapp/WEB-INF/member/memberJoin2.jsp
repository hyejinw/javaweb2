<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  <!-- sweetalert -->
	<!-- 회원가입 정규식 확인용 -->
	<script src="${ctp}/js/joinCheck.js"></script> 
	<script>
		'use strict';

		function alert(msg) {
			Swal.fire({"title":msg, "timer": 2000});
		}
		
		// 아이디 중복 검사 
		function idCheck() {
			let mid = myform.mid.value;
			let url = "${ctp}/MemberIdCheck.mem?mid="+mid;
			
			Swal.fire({
				  title: '아이디 중복 확인창',
				  input: 'text',
				  inputAttributes: {
				    autocapitalize: 'off'
				  },
				  showCancelButton: true,
				  confirmButtonText: '확인',
				  cancelButtonText: '취소',
				  reverseButtons: true,
				  showLoaderOnConfirm: true,
				  preConfirm: () => {
				    return fetch(`//api.github.com/users/${login}`)
				      .then(response => {
				        if (!response.ok) {
				          throw new Error(response.statusText)
				        }
				        return response.json()
				      })
				      .catch(error => {
				        Swal.showValidationMessage(
				          `이미 사용 중인 아이디입니다.`
				        )
				      })
				  },
				  allowOutsideClick: () => !Swal.isLoading()
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire({
				      title: `${result.value.login}'s avatar`,
				      imageUrl: result.value.avatar_url
				    })
				  }
				})

		}
		// 닉네임 중복 검사  
		function nickCheck() {
			let nickName = myform.nickName.value;
			let url = "${ctp}/MemberNickCheck.mem?nickName="+nickName;
			
			if(nickName.trim() == "") {
				alert("닉네임을 입력하세요");
				myform.mid.focus();
			}
			else {
				window.open(url, "nWin", "width=580px, height=250px");
			}
		}
		
	</script>
	<style>
		.text-primary {
			font-size: 0.9em;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container" id="top">	
	<form name="myform" method="post" action="${ctp}/MemberJoinOk.mem" class="was-validated">
    <h2>회 원 가 입</h2>
    <br/>
    <div class="form-group">
      <label for="mid">아이디 : &nbsp; &nbsp;<input type="button" value="아이디 중복체크" class="btn btn-secondary btn-sm" onclick="idCheck()"/></label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
    	<div id="midError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
      <div id="pwdError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <label for="pwd2">비밀번호 확인 :</label>
      <input type="password" class="form-control" id="pwd2" placeholder="비밀번호를 입력하세요." required />
      <div id="pwdError2" class="text-primary"></div>
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
    	<div id="nickNameError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    	<div id="nameError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <label for="email1" >Email address:</label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
          <div class="input-group-append">
            <select name="email2" class="custom-select">
              <option value="naver.com" selected>naver.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="nate.com">nate.com</option>
              <option value="yahoo.com">yahoo.com</option>
            </select>
          </div>
        </div>
	    	<div id="emailError" class="text-primary"></div>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 </span> &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="남자" checked>남자
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="여자">여자
        </label>
      </div>
    </div>
    <div class="form-group">
   	  <!-- 생일을 null로 보내면 자꾸 오류가 생겨서 기본값을 줘버렸다. -->
    	<c:set var="ymd" value="<%=new java.util.Date()%>" />
      <label for="birthday">생일</label>
      <input type="date" name="birthday" value=<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" /> class="form-control"/>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">전화번호 </span> &nbsp;&nbsp;
            <select name="tel1" class="custom-select">
              <option value="010" selected>010</option>
              <option value="02">서울</option>
              <option value="031">경기</option>
              <option value="032">인천</option>
              <option value="041">충남</option>
              <option value="042">대전</option>
              <option value="043">충북</option>
              <option value="051">부산</option>
              <option value="052">울산</option>
              <option value="061">전북</option>
              <option value="062">광주</option>
            </select>-
        </div>
        <input type="text" name="tel2" maxlength='4' class="form-control"/>-
        <input type="text" name="tel3" maxlength='4' class="form-control"/>
      </div>
    </div>
    <div class="form-group">
      <label for="address">주소</label>
      <input type="hidden" name="address" id="address">
      <div class="input-group mb-1">
        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
        <div class="input-group-append">
          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
        </div>
      </div>
      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
      <div class="input-group mb-1">
        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
        <div class="input-group-append">
          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
        </div>
      </div>
    </div>
    <div class="form-group">
      <label for="homepage">Homepage address:</label>
      <input type="text" class="form-control" name="homePage" value="http://" placeholder="홈페이지를 입력하세요." id="homePage"/>
    </div>
    <div class="form-group">
      <label for="name">직업</label>
      <select class="form-control" id="job" name="job">
        <option>학생</option>
        <option>회사원</option>
        <option>공무원</option>
        <option>군인</option>
        <option>의사</option>
        <option>법조인</option>
        <option>세무인</option>
        <option>자영업</option>
        <option>기타</option>
      </select>
    </div>
    <div class="form-group">
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
    </div>
    <div class="form-group">
      <label for="content">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
        </label>
      </div>
    </div>
    <div  class="form-group">
      회원 사진(파일용량:2MByte이내) :
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    </div>
    <!-- form태그 안의  required 기능은 input이 submit일 때만 사용가능하다. -->
<!-- <button type="submit" class="btn btn-secondary" >회원가입</button> &nbsp; -->
    <button type="button" class="btn btn-secondary" onclick="joinCheck()">회원가입</button> &nbsp;
    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    <button type="button" class="btn btn-secondary" onclick="">돌아가기</button>
  </form>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>