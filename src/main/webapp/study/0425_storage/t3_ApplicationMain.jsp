<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_ApplicationMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>어플리케이션 연습 메인메뉴</h2>
  <form name="myform" method="post" action="t3_ApplicationSave.jsp">
    <div>
      아이디 :
      <input type="text" name="mid" value="${aMid}" autofocus class="form-control"/>         <!-- 정말 신기방귀 session과 마찬가지로 이렇게 적어줄 수 있다. -->
    </div>
    <div>
      닉네임 :
      <input type="text" name="nickName" value="${aNickName}" class="form-control"/>
    </div>
    <div>
      성명 :
      <input type="text" name="name" value="${aName}" class="form-control"/>
    </div>
    <hr/>
	  <div class="row">
	    <div class="col"><a href="t3_ApplicationSave.jsp" class="btn btn-success form-control">어플리케이션 저장1(get)</a></div>  <!-- 공백을 null로 처리/ 아무런 값을 입력하지 않아도, 기본 설정값이 들어간다. -->
	    <div class="col"><button type="submit" class="btn btn-success form-control">어플리케이션 저장2(post)</button></div>       <!-- 공백을 공백으로 처리/ 아무런 값을 입력하지 않으면, 공백으로 남는다. -->
	    <!-- <div class="col"><button type="submit" class="btn btn-success form-control">세션 저장2</button></div> -->
	  </div>
  </form>
</div>
<p><br/></p>
</body>
</html>