package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
//@WebServlet("/database/LoginOk")
public class LoginOk2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO2 dao = new LoginDAO2();
		
		PrintWriter out = response.getWriter();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		if(vo.getName() != null) {
			/* if(vo.getName() != "") {  이렇게 작성은 안 된다.*/
			// 회원 인증 성공 시 처리
			// 회원 인증 후 처리(1.자주 사용하는 자료를 세션에 저장(아이디, 성명, 닉네임))
			
			// 방문 포인트 처리 (최종 접속일 처리 / 방문 카운트도 같이)
			// DB의 최종 접속일(10자리)와 시스템 날짜(10자리)를 비교해
			// 같으면 todayCount = vo,getTodayCount()+1, 같지 않으면 todayCount =0;
	  	// vo,getTodayCount() < 5 면, vo,getTodayCount()=vo,getTodayCount()+5 
			// vo,getTodayCount() >= 5 면, vo,getTodayCount()=vo,getTodayCount();
			//dao.setPointPlus(mid, point, todayCount);

			dao.setPointPlus(mid);
			
			
			// 1. 세션처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint()+10);
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount()+1);
			
			out.print("<script>");
			out.print("alert('"+mid+"님의 로그인 성공');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
		}
		else {
			// 회원 인증 실패 시 처리
			out.print("<script>");
			out.print("alert('로그인 실패');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
			out.print("</script>");
		}
		
	}
}
