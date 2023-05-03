<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl_Ex2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
 		var arrNumber = ("1","2","3","4","5","6");
 		var arrTitle = new Array(6);
 		let str;
 		
	 	function fCheck() {
	 		let number = myform.number.value;
	 		console.log('dkssud');
	 		
			if(number != "") {
			  str = '<img src="${pageContext.request.contextPath}/images/'+number+'.jpg" width="150px" height="200px"/>';
			  demo.innerHTML = str;
			  return false;
			}
	 	}	
	 	
	 	function fCheck2() {
	 		let number = myform.number.value;
	 		let title = myform.title.value.trim();
	 		
	 		if(number == "") {
	 			alert("그림을 선택해주세요");
	 		}
	 		else if(title == "") {
	 			alert("그림명을 입력해주세요");
	 		}
	 		else {
	 		arrTitle[number-1] = title;
 			console.log(arrTitle);
	 			if(number%2 == 0) {
			 		alert(number + '번째 그림의 이름이 저장되었어요!');
	 			}
	 			else {
			 		alert(number + '번째 그림명 저장 완료! 멋진 이름이네요!');
	 			}
	 		}
	 	}
	 	
	 	function fCheck3() {
	 		console.log('12345678');
	 		str = "<table class='table table-bordered text-center'><tr><th>그림</th><th>그림명</th><th>그림파일명</th></tr>";
	 		for(let i=0; i<6; i++) {
	 			if(arrTitle[i] != null) {
		 			str += '<tr>';
			 		str += '<td><img src="${pageContext.request.contextPath}/images/'+(i+1)+'.jpg" width="150px" height="200px"/></td>';
	 				str += '<td>'+arrTitle[i]+'</td>';
	 				str += '<td>'+(i+1)+'.jpg</td>';
		 			str += '</tr>';
	 			}
	 		}
	 		str += '</table>';
			demo.innerHTML = str;
	 	}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
  <pre>
    콤보상자에 숫자 1~6까지를 기억시키고 화면에 보여준다.(화면에 보여주는 숫자는 1~6.jpg인 그림파일명이다.)
    콤보상자 옆에 텍스트박스를 위치시키고, 해당 그림의 '그림명'을 입력후 '저장'버튼을 클릭하면,
    '그림명'과, '그림파일명'을 저장시켜준다.(여러개를 저장할 수 있도록 처리)
    마지막으로 '출력'버튼을 클릭하면 아래쪽(demo)으로 저장된 모든 그림파일과 그림파일명을 출력한다.
  </pre>
  <div>
  	<form name="myform">
		  <select name="number" onchange="fCheck()" size="6" class="form-control">
	 	  	<c:forEach var="i" begin="1" end="6">
			    <option>${i}</option>
	  		</c:forEach>
			  </select><br/>
			<input type="text" name="title" placeholder="해당 그림의 이름을 지어주세요" class="form-control"/><br/>
			<input type="button" onclick="fCheck2()" value="저장" class="btn btn-success"/>
			<input type="button" onclick="fCheck3()" value="파일 전체 출력" class="btn btn-primary"/>
		</form>
  </div>
	<p><br/></p>
	<div id="demo"></div>
</div>
<p><br/></p>
</body>
</html>