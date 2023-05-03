package study.t0426;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
/* @WebServlet(name = "/t0426/Test1Ok", urlPatterns = { "/t0426/Test1Ok" }) */
@WebServlet("/t0426/Test1Ok")
public class Test1Ok extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet() 입니당");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("title(doGet) :" + title);
		System.out.println("content(doGet) :" + content);
		
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		
		String viewPage = "/study/0426/test1Res.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost() 입니당");
		doGet(request, response);
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("title(doPost) :" + title);
		System.out.println("content(doPost) :" + content);
		
		doGet(request, response);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service() 입니당");    // 얘만 뜬다. 이 아이가 우선이다! 서비스가 있으면 메소드로 호출하지 않는 이상, post와 get이 작동하지 않는다.
		
		doPost(request, response);
	} 
	
	@Override
	public void init() throws ServletException {
		System.out.println("이곳은 init() 입니당");  // 1번!
	}
	
	@Override
	public void destroy() {
		System.out.println("이곳은 destroy() 입니당");
	}
}
