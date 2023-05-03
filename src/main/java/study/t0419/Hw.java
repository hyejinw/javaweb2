package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/hw")
public class Hw extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// WAS가 서버로 "utf-8"로 인코딩해달라고 request한다.
		request.setCharacterEncoding("utf-8");
		
  	// 서버가 클라이언트로 response한다. == 서버는 값을 가져올 때 html를 읽어주고, 한글은 utf-8 방식으로 읽어준다/응답해준다.
		response.setContentType("text/html; charset=utf-8");
		
		// 값을 하나씩 가져오겠다.
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		String nick = request.getParameter("nick");
		String n = request.getParameter("n");

		/* 회원 정보
		  admin, 1234, 알, 홍길동 
		*/
		PrintWriter out = response.getWriter();
		if(mid.equals("admin") && pwd.equals("1234") && nick.equals("알") && n.equals("홍길동")) {
			out.println("<script>");
			out.println("alert('로그인 성공! 홍길동님 환영합니다.');");
			out.println("</script>");
			out.println("<h3>홍길동님</h3>");
			out.println("<p>정보를 확인해주세요!</p>");
			out.println("<p>아이디 : " + mid + "</p>");
			out.println("<p>비밀번호 : " + pwd + "</p>");
			out.println("<p>닉네임 : " + nick + "</p>");
			out.println("<p>성명 : " + n + "</p><hr/>");
			out.println("<a href='"+request.getContextPath()+"/study/0419/hwSuccess.jsp'>마이페이지</a>");
		}
		else {
			out.println("<script>");
			out.println("alert('로그인 실패! 정보를 재확인해주세요:)');");
			out.println("location.href='"+request.getContextPath()+"/study/0419/hw.jsp';");
			out.println("</script>");	
			
		}
	}
}

