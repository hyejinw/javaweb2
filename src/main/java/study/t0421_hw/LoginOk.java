package study.t0421_hw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study/t0421_hw/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");

		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String remember = request.getParameter("remember") == null ? "off" : request.getParameter("remember");

		// 추가1) session에 아이디를 담기 위해 생성했다.
		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();
		String member;

		// 회원 인증
		if ((mid.equals("admin") || mid.equals("hkd1234")) && pwd.equals("1234a")) {
			member = "OK";
			session.setAttribute("sMid", mid);

//			if(remember.equals("on")) {
//				// 추가2) cookie에 아이디를 담았다.
//				Cookie cookieMid = new Cookie("cMid", mid);
//				cookieMid.setMaxAge(60*60*24);
//				response.addCookie(cookieMid); 
//			}

			Cookie cookieMid = new Cookie("cMid", mid);
			// 웹 어플리케이션의 전체(요청)경로에서 사용(포함)하고자 할 때는 /로 한다.
			cookieMid.setPath("/"); // 전체 경로에서 자료를 찾아올 수 있도록 경로를 저장한다.

			if (remember.equals("on")) {
				cookieMid.setMaxAge(60 * 60 * 24 * 7); // 만료시간 : 일주일
			} else {
				cookieMid.setMaxAge(0); // 만료시간 : 0 ==> 제거!
			}
			response.addCookie(cookieMid);

			
			 // 값을 넣어준다. 
//			Cookie[] cookies = request.getCookies();
//			  
//		  if(cookies != null) { for(int i=0; i<cookies.length; i++) {
//		  if(cookies[i].getName().equals("cMid")) { request.setAttribute("mid",
//		  cookies[i].getValue()); break; } } }
//			
//		  RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0421_hw/main.jsp;"); 
//		  dispatcher.forward(request, response);
//		
			out.print("<script>");
			out.print("alert('" + mid + "님 환영합니다. 오늘도 맛있는 하루 되세요!');");
			out.print("location.href='" + request.getContextPath() + "/study/0421_hw/main.jsp?member=" + member + "';");
			out.print("</script>");
			// response.sendRedirect(request.getContextPath()+
			// "/study/0421_hw/main.jsp?member="+member);
		} else {
			member = "NO";
			out.print("<script>");
			out.print("alert('아이디와 비밀번호를 확인해주세요.');");
			out.print("location.href='" + request.getContextPath() + "/study/0421_hw/main.jsp?sw=login';");
			out.print("</script>");
		}
	}
}