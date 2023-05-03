package study.t0426;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("")
@SuppressWarnings("serial")
public class T_init extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service() 입니당");
		
		/* request.getParameter("logoName"); */
		// 공통변수로 지정한 값을 가져오기!
		String logoName = getServletContext().getInitParameter("logoName");  // 서블릿에서 값을 가져올 때!
		String homeAddress = getServletContext().getInitParameter("homeAddress");  // 서블릿에서 값을 가져올 때!
		
		System.out.println(logoName);
		System.out.println(homeAddress);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("logoName", logoName);
		session.setAttribute("homeAddress", homeAddress);
		
		String viewPage= "/study/0426/t_initRes.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
