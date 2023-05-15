<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>upLoad1.jsp</title>
	<jsp:include page="/include/bs4.jsp"/> 
	<script>
		'use strict';
		
		function fCheck() {
			let fName = document.getElementById("file").value;
			//alert("파일명 :" + fName);
			
			let ext = fName.substring(fName.lastIndexOf(".")+1).toUpperCase();
			//alert("확장자 :" + ext);
			
			let maxSize = 1024 * 1024 * 5; // 업로드 가능 파일은 5MByte까지
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택해주세요.");
			}
			let fileSize = document.getElementById("file").files[0].size;
			
			if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "HWP" && ext != "PPT" && ext != "PPTX") {
				alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx' 입니다.");
			}
			else if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 5MByte 입니다.");
			}
			else {
				//alert("전송 완료!");
				
				myform.submit();
			}
			
		}
		
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<P><br /></P>
<div class="container">	
	<h2>파일 업로드 연습(싱글파일처리)</h2>
	<p>COS 라이브러리를 이용한 파일 업로드</p>
	<div>(http://servlets.com/cos/)</div>
	<hr/>
	<form name="myform" method="post" action="${ctp}/FileUpLoad1Ok.st" enctype="multipart/form-data">
		파일명 : 
		<input type="file" name="fName" id="file" class="form-control-file border mb-4"/>
		<input type="button" value="전송" onclick="fCheck()" class="btn btn-success"/>
	</form>
	<!-- file이란 type은 value가 없어서 method 방식으로는 못 보낸다. -->
  <hr/>
  <input type="button" value="다운로드사이트로이동" onclick="location.href='${ctp}/DownLoad.st';" class="btn btn-secondary"/>
</div>
<P><br /></P>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>