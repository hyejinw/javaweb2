<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ajaxTest1.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
	
	<script>
	  'use strict';
	  // 일반 검색 + jQuery
	  function idCheck() {
//		  let mid = document.myform.mid.value; 
//		  let mid = document.getElementById('mid').mid.value; 
			let mid = $("#mid").val();
				
		  if(mid.trim() == null) {
				alert("아이디를 입력하세요");
//				document.myform.mid.focus();
//				document.getElementById('mid').focus();
				$("#mid").focus();  //jQuery 의 장점: 간단하다!
				return false;
			}
		  location.href = "${ctp}/AjaxTest1_1?mid="+mid;
		 }
	 
	  //ajax를 이용한 아이디 검색
	  function idCheck1() {
		  let mid = $("#mid").val();
		  
		  if(mid.trim() == null) {
			  alert('아이디를 입력하세요');
			  $("#mid").focus();
			  return false;
		  }
		  
		  // 데이터를 query라는 변수에 담았다!
		  let query = {
			  //mid : 'admin' 이렇게 직접 적어도 된다.
			  mid : mid
		  }
		  
			$.ajax({
				url : "${ctp}/AjaxTest1_2",
				type : "get",
				data : query,
				contextType : "application/json",
				charset : "utf-8",
				success : function(res) {
					alert("서버에 성공적으로 다녀왔습니다." + res);
					$("#demo").html(res);
				},
				error : function() {
					alert("전송 실패!");
				}
			});
	  }
	  
	  function idCheck2() {
		  let mid = $("#mid").val();
		  
		  if(mid.trim() == null) {
			  alert('아이디를 입력하세요');
			  $("#mid").focus();
			  return false;
		  }
			
		  $.ajax({
				url : "${ctp}/AjaxTest2",	
				type : "post",				
				data : {mid : mid},  // 서버에 전송할 데이터
				success : function(res) {
					$("#demo").html(res);
					let str = res.split("/");
					$("#tMid").html(str[0]);
					$("#name").html(str[1]);
					$("#nickName").html(str[2]);
					$("#gender").html(str[3]);
					$("#point").html(str[4]);
					
				},
				error : function() {
					alert("전송 실패!");
				}				
		  });
	  }
	  
	  function idCheck3() {
		  let mid = $("#mid").val();
		  
		  if(mid.trim() == null) {
			  alert('아이디를 입력하세요');
			  $("#mid").focus();
			  return false;
		  }
			$.ajax({
				type : 'post',
				url : '${ctp}/AjaxTest3',
				data : {mid : mid}, 
				success : function(res) {
					res = res.substring(res.indexOf("[")+1, res.lastIndexOf("]"));
					$("#demo").html(res);
					
					// res.indexOf(",",res.indexOf("mid=") 라고 적으면 첫 번째 
					$("#tMid").html(res.substring(res.indexOf("mid=")+4, res.indexOf(",",res.indexOf("mid="))));
					$("#name").html(res.substring(res.indexOf("name=")+5, res.indexOf(",",res.indexOf("name="))));
					$("#nickName").html(res.substring(res.indexOf("nickName=")+9, res.indexOf(",",res.indexOf("nickName="))));
					$("#gender").html(res.substring(res.indexOf("gender=")+7, res.indexOf(",",res.indexOf("gender="))));
					$("#point").html(res.substring(res.indexOf("point=")+6, res.indexOf(",",res.indexOf("point="))));					
				}
			});		  
	  }
	  
	  // AjaxTest4에서 JSON방식으로 값을 보낼 건데, 그걸 여기서 받을 거야.
	  function idCheck4() {
		  let mid = $("#mid").val();
			console.log('mid', mid);		  
			
		  if(mid.trim() == null) {
			  alert('아이디를 입력하세요');
			  $("#mid").focus();
			  return false;
		  }
		  $.ajax({
 			  type : 'post',
				url : '${ctp}/AjaxTest4',
				data : {mid : mid}, 
				success : function(res) {
					$("#demo").html(res); 
					
/* 			  type : "post",  큰 따옴표로 하면 오류가 뜬다!!!!
			  url : "${ctp}/AjaxTest4",
			  date : {mid : mid},
			  success : function(res) {
				  $("#demo").html(res); */
				  let js = JSON.parse(res);
				  console.log("js",js)
				  
				  $("#tMid").html(js.mid);
				  $("#name").html(js.name);
				  $("#nickName").html(js.nickName);
				  $("#gender").html(js.gender);
				  $("#point").html(js.point);
			  },
				error : function() {
					alert("전송 실패!");
				}			  
		  });
	  }
		  
		function idCheck5() {
		  let mid = $("#mid").val();
			console.log('mid', mid);		  
			
		  if(mid.trim() == null) {
			  alert('아이디를 입력하세요');
			  $("#mid").focus();
			  return false;
		  }			
			
		  $.ajax({
			  type : "post",
			  url : "${ctp}/AjaxTest5",
			  data : {mid : mid}, 
				success : function(res) {
					$("#demo").html(res); 
					let js = JSON.parse(res);
				  console.log("js",js);
				  
/* 				  $("#tMid").html(js[0].mid);
				  $("#name").html(js[0].name);
				  $("#nickName").html(js[0].nickName);
				  $("#gender").html(js[0].gender);
				  $("#point").html(js[0].point);
				   */
			   	let tMid = "", tName = "", tNickName = "", tGender = "", tPoint = "";
				  for(let j of js) {
						tMid += j.mid + "/";
						tName += j.name + "/";
						tNickName += j.nickName + "/";
						tGender += j.gender + "/";
						tPoint += j.point + "/";
				  }
				  $("#tMid").html(tMid);
				  $("#name").html(tName);
				  $("#nickName").html(tNickName);
				  $("#gender").html(tGender);
				  $("#point").html(tPoint);
				},
				error : function() {
					alert("전송 실패!");
				}							
		  });
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2>Ajax 연습</h2>
	<hr/>
	<form name="myform">
		아이디 : <input type="text" name="mid" id="mid" class="mb-2"/><br/>
		일반 검색 : <input type="button" value="아이디 일반 검색" onclick="idCheck()" class="btn btn-success" /><br/>
		<hr/>
		aJax 검색 : 
		<input type="button" value="아이디 검색1" onclick="idCheck1()" class="btn btn-primary" /> &nbsp;
		<input type="button" value="아이디 검색2" onclick="idCheck2()" class="btn btn-primary" /> &nbsp;
		<input type="button" value="아이디 검색3" onclick="idCheck3()" class="btn btn-primary" /> &nbsp;
		<input type="button" value="아이디 검색4" onclick="idCheck4()" class="btn btn-primary" /> &nbsp;
		<input type="button" value="아이디 검색5" onclick="idCheck5()" class="btn btn-primary" /> &nbsp;
		
		<div>출력 결과: <span id="demo"></span></div>
		<hr/>
		<div>
			<div>아이디 : <span id="tMid"></span></div>
			<div>성명 : <span id="name"></span></div>
			<div>별명 : <span id="nickName"></span></div>
			<div>성별 : <span id="gender"></span></div>
			<div>포인트 : <span id="point"></span></div>
		</div>
	</form>
</div>	
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>