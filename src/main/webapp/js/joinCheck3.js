/* joinCheck() */ 

// 가입부분 체크
function joinCheck(){
  let mid = document.getElementById("mid").value.trim();
  let pwd = document.getElementById("pwd").value.trim();
  let pwd2 = document.getElementById("pwd2").value.trim();
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
  
	const regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자 
	const regex2 = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/g; //(비밀번호)4자 이상 20자 이하, 영어, 숫자, 특수문자
	const regex3 = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;  // (닉네임)2자 이상 16자 이하, 영어 또는 숫자 또는 한글
	const regex4 = /[A-Za-z가-힣]/g;  // (성명)한글,영문만 적어도 1자이상 
	const regex5 = /^[0-9a-zA-Z]+/g; // 이메일
  const regex6 = /\d{2,3}-\d{3,4}-\d{4}$/g; //(전화번호)
  
  
  // 아이디 확인
  if(mid=="" || !regex1.test(mid)){
	  console.log('아이디 여기로 왔어요',mid);
    document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자 4~20자)";
    check = false;
   } 
   else {
	   
   }
  
  // 비밀번호 확인
  if(pwd==="" || !regex2.test(pwd)){
    document.getElementById("pwdError").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수,특수문자 허용 4~20자)";
    check = false;
  }
  else {
	    document.getElementById("pwdError").innerHTML="";
	    
	  if(pwd !== pwd2){
	    document.getElementById("pwdError").innerHTML="";
	    document.getElementById("pwdError2").innerHTML="비밀번호가 동일하지 않습니다.";
	    check = false;
	  }
	
	  else if(pwd2===""){
	    document.getElementById("pwdError2").innerHTML="비밀번호를 다시 입력해주세요.";
	    check = false;
	  }
	  else {
		  
	  }
  }
  
  // 닉네임 확인 
  if(nickName=="" || !regex3.test(nickName)){
    document.getElementById("nickNameError").innerHTML="닉네임 형식에 맞춰주세요.(영어/숫자/한글 2~16자)";
    check = false;
   }
  
  // 성명 확인
  if(name=="" || !regex4.test(name)){
    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문 1자이상)";
    check = false;
   }
  
  // 이메일확인
  if(email1=="" || !regex5.test(email1)){
    document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다.";
    check = false;
   }
   
  
  if(!check){
	  alert('입력된 값을 다시 확인해주세요.');
	  //window.scrollTo(0,0); // (그냥 위치만 바뀌는)스크롤 위로 올리기 
		let scrollTopBtn = document.getElementById('top');
		
		scrollTopBtn.addEventListener('click',function(){
		    window.scrollTo({top: 0, behavior:'smooth'});
		});
  }
  else {
    if(idCheckSw == 0) {
			alert("아이디 중복확인을 해주세요.");
			document.getElementById("midBtn").focus();
		} 
		else if(nickCheckSw == 0) {
			alert("닉네임 중복확인을 해주세요.");
			document.getElementById("nickNameBtn").focus();
		}
		else {
	    document.getElementById("midError").innerHTML="";
	    document.getElementById("pwdError").innerHTML="";
	    document.getElementById("pwdError2").innerHTML="";
	    document.getElementById("nickNameError").innerHTML="";
	    document.getElementById("nameError").innerHTML="";
	    document.getElementById("emailError").innerHTML="";
	    myform.tel.value = tel;
	    myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
	    myform.email.value = email;
	   	myform.submit();
		}
  }
}