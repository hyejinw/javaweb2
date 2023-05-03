<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
  <script>
  'use strict';
  let notifi;

  function midCheck() {
    let mid = document.getElementById("mid").value.trim();
    const regex = /[a-zA-Z0-9_]{4,20}$/g;   //아이디 : 영문자,숫자,_ 포함으로 4~20 자까지 // 영어 대소문자, 숫자, 언더바 허용
    
    if(!regex.test(mid)) document.getElementById("demo1").style.display="block";
    else document.getElementById("demo1").style.display="none";
  }
  
  function pwdCheck() {
	  let pwd = document.getElementById("pwd").value.trim();
	  const regex1 = /[0-9a-zA-Z\!\@\#\$\%\^\&\*\(\)\_\+\,\.\?\<\>\[\]\{\}]{4,20}$/g; 
	  
    // 비밀번호 확인
	  if(!regex1.test(pwd)) document.getElementById("demo2").style.display="block";
	  else document.getElementById("demo2").style.display="none";
	 }
  
  function nickCheck() {
    let nick = document.getElementById("nick").value.trim();
    const regex2 = /[가-힣]+/g;  // 한글만 적어도 1자이상
    
 		// 닉네임 확인
    if(!regex2.test(nick)) document.getElementById("demo3").style.display="block";
	  else document.getElementById("demo3").style.display="none";
	 }
  
  function nCheck() {
    let n = document.getElementById("n").value.trim();
    const regex3 = /[A-Za-z가-힣]+/g;  // 한글,영문만 적어도 1자이상
	  
    // 성명 확인
    if(!regex3.test(n)) document.getElementById("demo4").style.display="block";
	  else document.getElementById("demo4").style.display="none";
	 }
  
  function emailCheck() {
    let email = document.getElementById("email").value.trim();
    const regex4 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  // 이메일 형식에 맞도록
	  
    // 이메일 확인
    if(!regex4.test(email)) document.getElementById("demo5").style.display="block";
	  else document.getElementById("demo5").style.display="none";
	 }
  
  function pageCheck() {
    let page = document.getElementById("page").value.trim();
    const regex5 = /^http[s]?:\/\/([\S]{3,})/i;  // URL형식에 맞도록
	  
    // 홈페이지주소 확인
    if(!regex5.test(page)) document.getElementById("demo6").style.display="block";
	  else document.getElementById("demo6").style.display="none";
	 }
  
  function phoneCheck() {
    let phone = document.getElementById("phone").value.trim();
    const regex6 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;  // 전화번호형식(지역번호(2~3)-국번호(3~4)-전화번호(4))
	  
    // 전화번호 확인
    if(!regex6.test(phone)) document.getElementById("demo7").style.display="block";
	  else document.getElementById("demo7").style.display="none";
	 }
  
  function identityCheck() {
	  let identity = document.getElementById("identity").value.trim();
    const regex7 = /^([0-9]{6})-([1-4]{1}[0-9]{6})$/g;  // 숫자와 구분자(-)만오되 앞쪽 6자리 - 뒷쪽 1자리(1~4까지의 숫자만)
    
    // 주민번호 확인
    if(!regex7.test(identity)) document.getElementById("demo8").style.display="block";
	  else document.getElementById("demo8").style.display="none";
	 }
   
  
  function wholeReset() {
    location.reload();
  }
  </script>
</head>
<body>
<p><br /></p>
  <div class="container text-center">
    <form name="myform" method="post" action="<%=request.getContextPath()%>/hw">
      <h2>로 그 인</h2>
      <h6>괄호( ) 안의 형식을 맞춰주세요</h6>
      <table class="table">
        <tr>
          <td>아이디(영문대소문자, 숫자, _ 허용 / 4~20자) : </td>
          <td rowspan="2"><input type="text" name="mid" id="mid" onchange="midCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo1" style="display:none; font-size:10pt; color:red">유효하지 않은 아이디입니다.</td>
        </tr>
        <tr>
          <td>비밀번호(영문대소문자, 숫자, _, 특수글자 허용/ 4~20자) : </td>
          <td rowspan="2"><input type="password" name="pwd" id="pwd" onchange="pwdCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo2" style="display:none; font-size:10pt; color:red">유효하지 않은 비밀번호입니다.</td>
        </tr>
        <tr>
          <td>닉네임(한글) : </td>
          <td rowspan="2"><input type="text" name="nick" id="nick" onchange="nickCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo3" style="display:none; font-size:10pt; color:red">유효하지 않은 닉네임입니다.</td>
        </tr>  
        <tr>
          <td>성명(한글 or 영문) : </td>
          <td rowspan="2"><input type="text" name="n" id="n" onchange="nCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo4" style="display:none; font-size:10pt; color:red">유효하지 않은 성명입니다.</td>
        </tr>        
        <tr>
          <td>이메일 : </td>
          <td rowspan="2"><input type="text" name="email" id="email" onchange="emailCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo5" style="display:none; font-size:10pt; color:red">유효하지 않은 이메일입니다.</td>
        </tr>        
        <tr>
          <td>홈페이지 주소 : </td>
          <td rowspan="2"><input type="text" name="page" id="page" onchange="pageCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo6" style="display:none; font-size:10pt; color:red">유효하지 않은 주소입니다.</td>
        </tr>        
        <tr>
          <td>전화번호(010-xxxx-xxxx) : </td>
          <td rowspan="2"><input type="text" name="phone" id="phone" onchange="phoneCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo7" style="display:none; font-size:10pt; color:red">유효하지 않은 전화번호입니다.</td>
        </tr>        
        <tr>
          <td>주민번호(6자리-7자리) : </td>
          <td rowspan="2"><input type="text" name="identity" id="identity" onchange="identityCheck()" class="form-control"/></td>
        </tr>
        <tr>
          <td id="demo8" style="display:none; font-size:10pt; color:red">유효하지 않은 주민번호입니다.</td>
        </tr>        
        <tr>
          <td colspan="3">
            <input type="submit" value="로그인" class="btn btn-success mr-4"/>
            <input type="button" value="다시 입력" onclick="wholeReset()" class="btn btn-primary" />
          </td>
        </tr>
      </table>
    </form>
  </div>
</body>
</html>