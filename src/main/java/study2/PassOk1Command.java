package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PassOk1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		// 영문 소문자가 들어오면 전부 대문자로 바꿔줄 거야!
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));

		System.out.println("== 원본 자료 ==");
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		System.out.println("idx : " + idx);
		System.out.println();

		if(idx == 1) {
			// 숫자만 암호화
			// 암호화를 위한 키 설정(0x1234ABCD) == 이게 16진수를 의미한다.
			int key = 0x1234ABCD;
			
			int encPwd, decPwd;
			
			// 암호화...(EOR(^) 암호화)  Exclusive or
			encPwd = Integer.parseInt(pwd) ^ key;

			System.out.println("== 암호화된 비밀번호 ==");
			System.out.println("pwd : " + encPwd);
			System.out.println("~~~~~~~~~~~~~~~DB에 암호화된 비밀번호 저장~~~~~~~~~~~~~");
			System.out.println("암호화된 비밀번호를 DB에 저장시킨 후, 인증을 위해 다시 불러와서 디코딩 처리");
			
			decPwd = encPwd ^ key;
			System.out.println("== 복호화된 비밀번호 ==");
			System.out.println("pwd : " + decPwd);
			System.out.println();
		}
		
		else {
			// 숫자랑 문자(혼합) 암호화 (영문 소문자 입력 시는 대문자로 변경)
			System.out.println("1. 원본 비밀번호 : " + pwd);
			long intPwd;
			String strPwd = "";
			
			for(int i=0; i<pwd.length(); i++) {    
				intPwd = pwd.charAt(i);   // 가져온 pwd를 아스키 코드로 변환한다.
				strPwd += intPwd;
			}
			System.out.println("2. 아스키 코드문자로 변환된 비밀번호 : " + strPwd);
			
		  intPwd = Long.parseLong(strPwd);
		  
		  long encPwd; 
		  long key = 0x1234ABCD;     // 아스키 코드를 암호화한다.
		  
		  encPwd = intPwd ^ key;
		  strPwd = String.valueOf(encPwd);   //DB에 넣을 때는 값을 문자로 바꿔준다.
		  //strPwd = encPwd + "";  둘다 가능
		  
		  System.out.println("3. 인코딩된 비밀번호 DB에 저장시킬 비밀번호 : " + strPwd);
			System.out.println("~~~~~~~~~~~~~~~DB에 암호화된 비밀번호 저장~~~~~~~~~~~~~");
			
			// DB에 저장된 암호를 불러와서 복호화(디코딩)
			long decPwd;
			intPwd = Long.parseLong(strPwd);
			decPwd = intPwd ^ key;
			System.out.println("4. 복호화(디코딩)된 비밀번호 : " + decPwd);
			
			// 복원된 비번은 숫자이기에 문자로 변환 후 2자리씩(2개) 분리 처리한다.
			strPwd = String.valueOf(decPwd);
			char ch;
			String result = "";
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char)Integer.parseInt(strPwd.substring(i, i+2));
				result += ch;
			}
			System.out.println("5. 최종 복호화된 비밀번호 : " + result);
		}
	}

}
