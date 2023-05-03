package study.t0421_hw;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet("/study/t0421_hw/LoginOk")
public class LoginOk2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		String member;
		
		// 회원 인증
		if(mid.equals("admin") && pwd.equals("1234a")) {
			member = "OK";
		}
		else {
			member = "NO";
		}
		response.sendRedirect(request.getContextPath()+"/study/0421_hw/main.jsp?member="+member);
	}
}