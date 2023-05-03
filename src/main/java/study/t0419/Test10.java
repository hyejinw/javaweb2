package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t10")
public class Test10 extends HttpServlet {
	@Override  // get이나 post 방식을 가리지 않고 모두 받는 service가 우선 순위가 높다. 즉 같이 쓸 필요가 없다. 유의하자!
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String mid = request.getParameter("mid"); // 서버로 간 값을 가져온다.
		String pwd = request.getParameter("pwd");
		
		// admin, hkd1234 ~~~~ 비밀번호: 1234
		if((mid.equals("admin") || mid.equals("hkd1234")) && pwd.equals("1234")) {

		 out.println("<script>");
		 out.println("alert('회원인증 성공');");
		 out.println("location.href = '"+request.getContextPath()+"/study/0419/test10Success.jsp';");
		 out.println("</script>");
		

		}
		else {
		 out.println("<script>");
		 out.println("alert('회원인증 실패');");
		 out.println("location.href = '"+request.getContextPath()+"/study/0419/test10.jsp';");
		 out.println("</script>");
		}
		
	}
}
