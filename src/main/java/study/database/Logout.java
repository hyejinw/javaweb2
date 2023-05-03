
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
@WebServlet("/database/Logout")
public class Logout extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//session에 저장되어 있는 sMid 변수의 값을 가져와서 String으로 타입을 변환한다.
		String mid = (String)session.getAttribute("sMid");
		
		// 로그아웃 후에는 session에 저장된 모든 값을 지워버린다.
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('"+mid+"님의 로그아웃 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
		out.print("</script>");
	}
}
