<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
:root {
  --padding: 60px;
}
.box {
  position: relative;
  margin: 50px auto;
  width: 400px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: var(--padding);
  background-color: #ffa0c5;
  border-radius: 20px;
}

.box input,
.box button {
  padding: 15px;
  font-size: 1.2em;
  border: none;
  border-radius: 20px;
}
.box input {
  margin-bottom: 25px;
}
.box button {
  background-color: #FFDB7E;
  color: #547fb2;
  border-radius: 30px;
}

.sign-up-box {
  position: absolute;
  width: 70px;
  height: 70px;
  border-radius: 80%;
  background-color: #86acd9;
  display: flex;
  justify-content: center;
  align-items: center;
  top: var(--padding);
  right: -35px;
  cursor: pointer;
  transition: all 500ms ease-in-out;
}
.sign-up-box i {
  font-size: 1.9em;
  color: #fff;
}

/*.active*/

.sign-up-box.active {
  top: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: stretch;
  padding: 30px;
  cursor: default;
  border-radius: 7px;
}

.sign-up-box.active input,
.sign-up-box.active button {
  padding: 15px;
  font-size: 1.2em;
  border: none;
  margin: 0;
}
.sign-up-box.active input {
  margin-bottom: 10px;
}

.sign-up-box.active > span {
  position: absolute;
  width: 30px;
  height: 30px;
  background-color: #fff;
  border-radius: 50%;
  top: 5px;
  right: 30px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #547fb2;
  font-weight: 700;
  cursor: pointer;
}
</style>

<script>
'use strict';

function fCheck() {
	let mid = loginForm.mid.value.trim();
	let pwd = document.getElementById("pwd").value.trim();
	const regex1 = /[a-zA-Z0-9_]{4,20}$/g;   //아이디 : 영문자,숫자,_ 포함으로 4~20 자까지 // 영어 대소문자, 숫자, 언더바 허용
	const regex2 = ^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$;
	
	if(mid == "") {
		alert("아이디를 입력하세요.");
		loginForm.mid.focus();
	}
	else if(!regex1.test(mid)) {
		alert("유효하지 않은 아이디 입니다.");
		loginForm.mid.focus();
	}
	else if(pwd == "") {
		alert("비밀번호를 입력하세요.");
		document.getElementById("pwd").focus();
	}
	else if(!regex2.test(pwd)) {
		alert("유효하지 않은 비밀번호 입니다.");
		document.getElementById("pwd").focus();
	}
 	else {
		loginForm.submit();
	} 
}
</script>

<div style="background-color:#fdfaf7; padding:0px 0px 100px">
	<form name="loginForm" method="post" action="<%=request.getContextPath()%>/study/t0421_hw/LoginOk">
		<div class="container text-center" style="padding:50px 0px 20px 0px">
 	 		<h2><b style="color: #282828;">로그인</b></h2>
	  </div>
	  <div class="box">
	  	<input type="text" name="mid" id="mid" value="admin" autofocus placeholder="아이디" />
	 	  <input type="password" name="pwd" id="pwd" value="1234" placeholder="비밀번호" />
		  <button onclick="fCheck()">로그인</button>
		</div>
	</form>
</div>